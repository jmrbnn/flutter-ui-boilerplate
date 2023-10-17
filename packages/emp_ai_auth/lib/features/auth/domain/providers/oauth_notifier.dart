// ignore_for_file: avoid_web_libraries_in_flutter, depend_on_referenced_packages, non_constant_identifier_names

import 'package:emp_ai_auth/core/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/core/shared/utils/oauth_utils.dart';
import 'package:emp_ai_auth/core/shared/utils/web_event_dispatcher_util.dart';
import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_access_token_response_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_authorization_request_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_introspection_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_mfa_response_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_password_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_refresh_token_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_token_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_login_providers.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_state.dart';
import 'package:emp_ai_auth/features/auth/domain/repositories/oauth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'dart:html';
// import 'package:js/js_util.dart' as js_util;

class OAuthNotifier extends StateNotifier<OAuthState> {
  final OAuthenticationRepository authRepository;
  final UserRepository userRepository;

  OAuthNotifier({
    required this.authRepository,
    required this.userRepository,
  }) : super(const OAuthState.initial());

  final authInstance = EmpAuth.instance;
  String PASSWORD_EXPIRED_MESSAGE = 'Account is not fully set up';

  Future<OAuthAccessTokenResponse> getOAuthToken() async {
    var getOAuthCodeVerifier_ = await userRepository.getOAuthToken();

    return await getOAuthCodeVerifier_.fold(
        (l) => OAuthAccessTokenResponse.fromJson({}), (r) => r);
  }

  Future<String> getOAuthCodeVerifier() async {
    var getOAuthCodeVerifier_ = await userRepository.getOAuthCodeVerifier();

    return await getOAuthCodeVerifier_.fold((l) => '', (r) => r);
  }

  Future<String> getOAuthCode() async {
    var getOAuthCode_ = await userRepository.getOAuthCode();

    return await getOAuthCode_.fold((l) => '', (r) => r);
  }

  Future<String> getAccessState() async {
    var getOAuthState_ = await userRepository.getOAuthState();

    return await getOAuthState_.fold((l) => '', (r) => r);
  }

  Future<void> clearSession() async {
    await userRepository.clearOAuthCache();
  }

  Future<void> initChangePassword({
    required String username,
    required OAuthMfaResponse response,
  }) async {
    String query = Uri(
        queryParameters: GeneralUtils.cleanMap({
      ...{
        'willUpdatePassword': 'true',
      }
    })).query;
    GeneralUtils.isolateDebug('${response.url}&$query');

    state = OAuthState.redirect(url: '${response.url}&$query');

    // state = OAuthState.changePassword(username: username, response: response);
  }

  Future<void> logoutUser() async {
    // var clientTokenRepository = await userRepository.getOAuthToken();

    // OAuthIntrospectionParameters parameters = OAuthIntrospectionParameters(
    //   token: clientTokenRepository.fold((l) => '', (r) => r.accessToken),
    //   clientId: authInstance.clientId,
    //   clientSecret: authInstance.clientSecret,
    // );

    // Clear cache on UI
    // js_util.setProperty(js_util.globalThis, 'authSession', null);
    // js_util.setProperty(js_util.globalThis, 'authIntrospect', null);
    // WebEventUtil.dispatch(OAuthEvents.loggedOut);
    // ref.read(oAuthMiniAppProvider.notifier).update(const OAuthState.logOut());
    await clearSession();

    // POST to /auth/v1/logout
    final logout = await authRepository.oAuthLogoutUser();
    state = await logout.fold(
      (failure) => OAuthState.failure(failure),
      (response) async {
        if (response.statusCode == 200) {
          // Map<String, dynamic> queryParameters = {
          //   'client_id': parameters.clientId,
          //   'client_secret': parameters.clientSecret,
          //   'redirect_uri': 'https://mybudget.empowerteams.io',
          // };

          // String url =
          //     '${EnvInfo.connectionString}/v1/auth/protocol/openid-connect/logout${Uri(queryParameters: queryParameters)}';
          // html.window.open(url, '_self');

          return const OAuthState.logOut();
        }
        return OAuthState.failure(CacheFailureException());
      },
    );
  }

  Future<void> loginUser(
    String username,
    String password, {
    bool passwordFlow = false,
    Map? customParams,
  }) async {
    state = const OAuthState.loading();
    Map params = getUriParameters();

    OAuthParameters parameters = OAuthParameters.fromJson({
      'username': username,
      'password': password,
      ...params,
      ...?customParams,
    });

    // final getClientSecret = await userRepository.getOAuthCodeVerifier();

    // getClientSecret.fold((l) => null, (r) => parameters.clientSecret = r);

    final response = await authRepository.oAuthLoginUser(
      parameters,
    );

    state = await response.fold(
      (failure) {
        if (failure.message == PASSWORD_EXPIRED_MESSAGE) {
          return OAuthState.passwordExpired(data: failure);
        }
        return OAuthState.failure(failure);
      },
      (response) async {
        if (response.status == 'show_mfa_qr_code_and_ask_code') {
          return OAuthState.setupMFA(qr: response.url);
        }
        if (response.status == 'ask_code') {
          return const OAuthState.askTOTP();
        }

        // Archived implem for prompting update password on login
        if (response.status == 'redirect') {
          if (response.passwordExpiryDays != null) {
            if (response.passwordExpiryDays! <
                EmpAuth().remindDaysBeforePasswordExpiry) {
              return OAuthState.promptUpdatePassword(response: response);
            }
          }
        }
        return OAuthState.redirect(url: response.url);
      },
    );
  }

  Future<void> initOAuth() async {
    state = const OAuthState.loading();
    String codeVerifier = OAuthUtils.generateCodeVerifier();
    userRepository.saveOAuthCodeVerifier(codeVerifier);
    if (kDebugMode) {
      print('[DEBUG] AUTH CODE VERIFIER $codeVerifier');
    }
    OAuthAuthorizationRequestParameters params =
        OAuthAuthorizationRequestParameters.fromJson({
      "response_type": "code",
      "client_id": authInstance.clientId,
      "scope": "openid",
      "redirect_uri": "${Uri.base.path}Routes.oauthCallback.url",
      // "redirect_uri": "${window.location.origin}${Routes.oauthCallback.url}",
      "code_challenge": OAuthUtils.generateCodeChallenge(codeVerifier),
      "code_challenge_method": "S256"
    });

    params.clientSecret = authInstance.clientSecret;

    String oAuthState = await getAccessState();
    if (oAuthState != '') {
      params.state = await getAccessState();
    }

    final response = await authRepository.initOAuth(params);

    state = await response.fold(
      (failed) => OAuthState.failure(failed),
      (successful) async {
        // if (successful) {
        return OAuthState.successfulAuthorizationRequest(data: successful);
        // }
        // return OAuthState.failure(CacheFailureException());
      },
    );
  }

  Future<void> exchangeAuthCode({
    String? authState,
    String? authCode,
  }) async {
    //Save state
    if (authState != null) {
      userRepository.saveOAuthState(authState);
    }
    if (authCode != null) {
      userRepository.saveOAuthCode(authCode);
    }

    //Get authcode
    // String authCode = code ?? '';
    String codeVerifier = await getOAuthCodeVerifier();

    OAuthTokenParameters params = OAuthTokenParameters(
      grantType: 'authorization_code',
      code: authCode,
      codeVerifier: codeVerifier,
      clientSecret: authInstance.clientSecret,
      clientId: authInstance.clientId,
      scope: "openid",
    );

    final response = await authRepository.exchangeAuthCode(params);

    state = await response.fold(
      (failure) => OAuthState.failure(failure),
      (response) async {
        // if (response.statusCode == 200) {
        //   userRepository.clearOAuthCache();

        OAuthAccessTokenResponse result =
            OAuthAccessTokenResponse.fromJson(response.data['result']);
        //   result.createdAt = DateTime.now().toString();
        //   userRepository.saveOAuthToken(result);
        return OAuthState.successfulAuthentication(data: result);
        // }
        // return OAuthState.failure(CacheFailureException());
      },
    );
  }

  Future<void> oAuthPasswordLogin({
    String? username,
    String? password,
    Function(dynamic)? onSuccess,
  }) async {
    OAuthPasswordParameters params = OAuthPasswordParameters(
      grantType: 'password',
      clientSecret: authInstance.clientSecret,
      clientId: authInstance.clientId,
      username: username,
      password: password,
      scope: "openid",
    );

    final response = await authRepository.oAuthPasswordLogin(params);

    state = await response.fold(
      (failure) => OAuthState.failure(failure),
      (response) async {
        if (response.statusCode == 200) {
          userRepository.clearOAuthCache();

          OAuthAccessTokenResponse result =
              OAuthAccessTokenResponse.fromJson(response.data['result']);

          result.createdAt = DateTime.now().toString();
          userRepository.saveOAuthToken(result);
          if (onSuccess != null) onSuccess(result);
          return OAuthState.successfulAuthentication(data: result);
        }
        return OAuthState.failure(CacheFailureException());
      },
    );
  }

  Future<void> introspectOAuth() async {
    // var clientVerifierRepository = await userRepository.getOAuthCodeVerifier();
    var clientTokenRepository = await userRepository.getOAuthToken();

    OAuthIntrospectionParameters parameters = OAuthIntrospectionParameters(
      token: clientTokenRepository.fold((l) => '', (r) => r.accessToken),
      clientId: authInstance.clientId,
      clientSecret: authInstance.clientSecret,
    );

    final response = await authRepository.introspectionOAuth(
      parameters,
    );

    state = await response.fold(
      (failure) => OAuthState.failure(failure),
      (response) async {
        if (response.statusCode == 200) {
          WebEventUtil.dispatch(OAuthEvents.introspect);

          // js_util.setProperty(js_util.globalThis, 'authIntrospect',
          //     jsonEncode(response.data['result']));
          return OAuthState.success(data: response.data['result']);
        }
        return OAuthState.failure(CacheFailureException());
      },
    );
  }

  Future<void> refreshToken() async {
    var clientTokenRepository = await userRepository.getOAuthToken();

    OAuthRefreshTokenParameters parameters = OAuthRefreshTokenParameters(
      grantType: 'refresh_token',
      refreshToken:
          clientTokenRepository.fold((l) => '', (r) => r.refreshToken),
      clientId: authInstance.clientId,
      clientSecret: authInstance.clientSecret,
    );

    final response = await authRepository.refreshTokenOAuth(
      parameters,
    );

    state = await response.fold(
      (failure) => OAuthState.failure(failure),
      (response) async {
        if (response.statusCode == 200) {
          OAuthAccessTokenResponse result =
              OAuthAccessTokenResponse.fromJson(response.data['result']);

          result.createdAt = DateTime.now().toString();
          userRepository.saveOAuthToken(result);
          return OAuthState.successfulAuthentication(data: result);
        }
        return OAuthState.failure(CacheFailureException());
      },
    );
  }

  Future<void> setMfa(
    String verificationCode, {
    String? responseUrl,
  }) async {
    final response = await authRepository.setMfa(verificationCode);

    state = await response.fold(
      (failure) => OAuthState.failure(failure),
      (response) async {
        if (response.status == 'show_mfa_qr_code_and_ask_code') {
          return OAuthState.setupMFA(qr: response.url);
        }
        if (response.status == 'ask_code') {
          return const OAuthState.askTOTP();
        }
        return OAuthState.redirect(url: response.url);
      },
    );
  }

  Future<void> validateMfa(String verificationCode) async {
    state = const OAuthState.loading();
    final response = await authRepository.validateMfa(verificationCode);

    state = await response.fold(
      (failure) => OAuthState.failure(failure),
      (response) async {
        if (response.status == 'show_mfa_qr_code_and_ask_code') {
          return OAuthState.setupMFA(qr: response.url);
        }
        if (response.status == 'ask_code') {
          return const OAuthState.askTOTP();
        }
        return OAuthState.redirect(url: response.url);
      },
    );
  }

  Future<List> getPasswordPolicy() async {
    final response = await authRepository.getPasswordPolicy();

    List policy = await response.fold(
      (failure) => [],
      (response) async {
        return response.data['result'];
      },
    );

    return policy;
  }
}
