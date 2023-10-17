// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_refresh_token_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/repositories/oauth_repository.dart';
import 'package:emp_ai_auth/core/shared/domain/providers/keycloak/keycloak_config.dart';
import 'package:emp_ai_auth/core/shared/identity_infrastructure/credentials_storage/credentials_storage.dart';
import 'package:emp_ai_auth/core/shared/identity_infrastructure/entities/identity_introspect.dart';
import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/core/shared/utils/oauth_utils.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/failure/auth_failure.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_access_token_response_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_authorization_request_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_introspection_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_password_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_token_parameters_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:oauth2/oauth2.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher_string.dart';
import 'package:uuid/uuid.dart';

class IdentityOAuthHttpClient extends http.BaseClient {
  final httpClient = http.Client();
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Accept'] = 'application/json';
    return httpClient.send(request);
  }
}

final authInstance = EmpAuth.instance;

class IdentityAuthenticator {
  final OAuthenticationRepository _authRepository;
  final CredentialsStorage _credentialsStorage;
  // final Dio _dio;

  IdentityAuthenticator(
    this._credentialsStorage,
    // this._dio,
    this._authRepository,
  );

  // Identity URLs
  Uri authenticationUrl = Uri.parse(
      '${authInstance.kcAuthenticationUrl}/v1/auth/protocol/openid-connect/auth');
  Uri silentLoginUrl = Uri.parse(
      '${authInstance.kcAuthenticationUrl}/v1/auth/protocol/openid-connect/silent-login');
  Uri tokenEndpoint = Uri.parse(
      '${authInstance.kcAuthenticationUrl}/v1/auth/protocol/openid-connect/token');
  Uri revocationEndpointPost =
      Uri.parse('${authInstance.kcAuthenticationUrl}/v1/logout');
  Uri revocationEndpointGet = Uri.parse(
      '${authInstance.kcAuthenticationUrl}/v1/auth/protocol/openid-connect/logout');
  Uri redirectUrl = Uri.parse(authInstance.redirectUrl);
  // Uri redirectUrl = Uri.parse('${Uri.base.origin}/#${Routes.callback.url}');

  // Credentials
  String clientId = authInstance.clientId;
  String? clientSecret = authInstance.clientSecret;
  static const scopes = ['openid'];

  Future<Credentials?> getSignedInCredentials() async {
    try {
      final storedCredentials = await _credentialsStorage.read();

      if (storedCredentials != null) {
        if (isAboutToExpire(
            DateTime.parse(storedCredentials.expiration.toString()), 120)) {
          final failureOrCredentials = await refresh(
              credentials: storedCredentials,
              refreshToken: storedCredentials.refreshToken);
          return failureOrCredentials.fold((l) => null, (r) => r);
        }
      }
      if (storedCredentials == null ||
          (!storedCredentials.canRefresh || storedCredentials.isExpired)) {
        GeneralUtils.isolateDebug(
            'storedCredentials.canRefresh: ${storedCredentials?.canRefresh}');
        GeneralUtils.isolateDebug(
            'storedCredentials.isExpired: ${storedCredentials?.isExpired}');
        GeneralUtils.isolateDebug(
            'storedCredentials: ${storedCredentials?.toJson()}');
        // signOut(hasExpired: true);
      }

      return storedCredentials;
    } on PlatformException {
      return null;
    }
  }

  bool isAboutToExpire(DateTime targetTime, double seconds) {
    DateTime currentTime = DateTime.now().toLocal();

    GeneralUtils.isolateDebug(
        'sessionTime (Will expire in): ${targetTime.toLocal().toString()}');
    GeneralUtils.isolateDebug(
        'sessionTime (Current time): ${currentTime.toLocal().toString()}');
    int timeDifferenceInSeconds =
        targetTime.toLocal().difference(currentTime).inSeconds;

    GeneralUtils.isolateDebug(
        'sessionTime (Session will expire in $timeDifferenceInSeconds seconds)');
    return timeDifferenceInSeconds <= seconds;
  }

  Future<bool> isSignedIn() =>
      getSignedInCredentials().then((credentials) => credentials != null);

  String _createCodeVerifier() {
    String verifier_ = OAuthUtils.generateCodeVerifier();
    _credentialsStorage.saveVerifier(verifier_);
    return verifier_;
  }

  Future<Either<Unit, Unit>> silentLogin(AuthorizationCodeGrant grant,
      {KeycloakConfig? customConfig}) async {
    OAuthAuthorizationRequestParameters params =
        OAuthAuthorizationRequestParameters.fromJson({
      "response_type": "code",
      "client_id": grant.identifier,
      "scope": "openid",
      "redirect_uri": customConfig?.redirectUrl ?? redirectUrl.toString(),
      "code_challenge": OAuthUtils.generateCodeChallenge(_createCodeVerifier()),
      "code_challenge_method": "S256",
      // "state":
      //     await _credentialsStorage.get('session_state') ?? const Uuid().v4(),
    });
    GeneralUtils.isolateDebug(params.toJson());
    if (clientSecret != null) {
      params.clientSecret = clientSecret;
    }

    String query =
        Uri(queryParameters: GeneralUtils.cleanMap(params.toJson())).query;

    // HeadlessInAppWebView headlessWebView = HeadlessInAppWebView(
    //     initialUrlRequest: URLRequest(
    //       url: Uri.parse('${authenticationUrl.toString()}?$query'),
    //     ),
    //     onLoadStop: (controller, url) {
    //       GeneralUtils.isolateDebug(url);
    //     });

    // headlessWebView.run();
    GeneralUtils.isolateDebug('${silentLoginUrl.toString()}?$query');

    var passOrFail = await _authRepository
        .silentLogin('${silentLoginUrl.toString()}?$query');

    return passOrFail.fold((l) => left(unit), (r) async {
      if (r.statusCode == 200) {
        GeneralUtils.isolateDebug('SILENTLOGIN R: ${r.data['result']['url']}');
        Uri callbackUrl = Uri.parse(r.data['result']['url']);
        GeneralUtils.isolateDebug(
            'SILENTLOGIN R: ${callbackUrl.origin}?${GeneralUtils.fixQueryParam(r.data['result']['url'])}');

        Map params = Uri.dataFromString(
                '${callbackUrl.origin}?${GeneralUtils.fixQueryParam(r.data['result']['url'])}')
            .queryParameters;

        GeneralUtils.isolateDebug('SILENTLOGIN R: $params');
        if (params.containsKey('state') && params.containsKey('code')) {
          final response = await exchangeAuthCode(params);

          OAuthAccessTokenResponse? resp = response.fold(
            (l) => null,
            (r) => r,
          );

          if (resp != null) {
            Credentials creds = Credentials(
              resp.accessToken ?? '',
              refreshToken: resp.refreshToken,
              idToken: resp.idToken,
              tokenEndpoint: tokenEndpoint,
              scopes: scopes,
              expiration: DateTime.now().add(
                Duration(seconds: resp.expiresIn ?? 0),
              ),
            );

            EmpAuth().setCredentials(creds);
            // await _credentialsStorage.clear();
            await _credentialsStorage.save(creds);

            if (kIsWeb) {
              launchUrlString(
                customConfig?.redirectUrl ?? callbackUrl.origin,
                mode: LaunchMode.inAppWebView,
                webOnlyWindowName: '_self',
              );
            }

            if (EmpAuth().onSuccessfulAuthentication != null) {
              EmpAuth().onSuccessfulAuthentication!(creds);
            }
          }
        } else {
          await _credentialsStorage.clear();
          return left(unit);
        }
      }
      return right(unit);
    });
  }

  AuthorizationCodeGrant createGrant({KeycloakConfig? customConfig}) {
    if (customConfig != null) {
      if (customConfig.keyCloakClientId != null) {
        clientId = customConfig.keyCloakClientId ?? '';
      }
      if (customConfig.keyCloakClientSecret != null) {
        clientSecret = customConfig.keyCloakClientSecret ?? '';
      }
      // if (customConfig.keycloakAuthenticationUrl != null) {
      //   authenticationUrl =
      //       Uri.parse(customConfig.keycloakAuthenticationUrl ?? '');
      // }
    }

    return AuthorizationCodeGrant(
      clientId,
      authenticationUrl,
      tokenEndpoint,
      secret: clientSecret,
    );
  }

  Future<Uri> getAuthorizationUrl(AuthorizationCodeGrant grant,
      {String? customRedirectUrl}) async {
    // Not passing the client_secret, had to do it manually
    // return grant.getAuthorizationUrl(
    //   redirectUrl,
    //   scopes: scopes,
    // );

    OAuthAuthorizationRequestParameters params =
        OAuthAuthorizationRequestParameters.fromJson({
      "response_type": "code",
      "client_id": grant.identifier,
      "scope": "openid",
      "redirect_uri": customRedirectUrl ?? redirectUrl.toString(),
      "code_challenge": OAuthUtils.generateCodeChallenge(_createCodeVerifier()),
      "code_challenge_method": "S256",
      "state": await _credentialsStorage.get('session_state'),
    });
    GeneralUtils.isolateDebug(params.toJson());
    if (clientSecret != null) {
      params.clientSecret = clientSecret;
    }

    final response = await _authRepository.initOAuth(params);

    return response.fold((l) => Uri(), (r) => r);
  }

  Future<Either<AuthFailure, OAuthAccessTokenResponse>>
      handleAuthorizationResponse(
    AuthorizationCodeGrant grant,
    Map<String, String> queryParams,
  ) async {
    final codeVerifier = await _credentialsStorage
        .readVerifier()
        .then((codeverifier_) => codeverifier_);
    try {
      OAuthTokenParameters params = OAuthTokenParameters(
        grantType: 'authorization_code',
        code: queryParams['code'],
        codeVerifier: codeVerifier,
        clientSecret: clientSecret,
        clientId: clientId,
        scope: "openid",
      );

      final response = await _authRepository.exchangeAuthCode(params);

      OAuthAccessTokenResponse resp = OAuthAccessTokenResponse.fromJson(
          response.fold((l) => throw left(const AuthFailure.server('Invalid')),
              (r) => r.data['result']));

      Credentials creds = Credentials(
        resp.accessToken ?? '',
        refreshToken: resp.refreshToken,
        idToken: resp.idToken,
        tokenEndpoint: tokenEndpoint,
        scopes: scopes,
        expiration: DateTime.now().add(
          Duration(seconds: resp.expiresIn ?? 0),
        ),
      );

      EmpAuth().setCredentials(creds);
      // await _credentialsStorage.clear();
      await _credentialsStorage.save(creds);

      // final httpClient = await grant.handleAuthorizationResponse(queryParams);
      // await _credentialsStorage.save(httpClient.credentials);

      return right(resp);
    } on FormatException catch (e) {
      return left(AuthFailure.server(e.message));
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure?, OAuthAccessTokenResponse>> exchangeAuthCode(
      Map payload) async {
    final codeVerifier = await _credentialsStorage
        .readVerifier()
        .then((codeverifier_) => codeverifier_);

    try {
      OAuthTokenParameters params = OAuthTokenParameters(
        grantType: 'authorization_code',
        code: Uri.decodeFull(payload['code']),
        codeVerifier: codeVerifier,
        clientSecret: clientSecret,
        clientId: clientId,
        scope: "openid",
      );

      final response = await _authRepository.exchangeAuthCode(params);

      var resultMap = response.fold((l) => null, (r) => r.data['result']);

      if (resultMap != null) {
        OAuthAccessTokenResponse resp =
            OAuthAccessTokenResponse.fromJson(resultMap);

        Credentials creds = Credentials(
          resp.accessToken ?? '',
          refreshToken: resp.refreshToken,
          idToken: resp.idToken,
          tokenEndpoint: tokenEndpoint,
          scopes: scopes,
          expiration: DateTime.now().add(
            Duration(seconds: resp.expiresIn ?? 0),
          ),
        );

        EmpAuth().setCredentials(creds);
        // Save credentials
        await _credentialsStorage.save(creds);

        // Save state
        await _credentialsStorage.put('session_state', payload['state']);

        // final httpClient = await grant.handleAuthorizationResponse(queryParams);
        // await _credentialsStorage.save(httpClient.credentials);

        return right(resp);
      } else {
        return left(null);
      }
    } on FormatException catch (e) {
      return left(AuthFailure.server(e.message));
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Unit>> signInViaPassword(
    String username,
    String password,
  ) async {
    try {
      OAuthPasswordParameters params = OAuthPasswordParameters(
        grantType: 'password',
        clientSecret: authInstance.clientSecret,
        clientId: authInstance.clientId,
        username: username,
        password: password,
        scope: "openid",
      );

      final response = await _authRepository.oAuthPasswordLogin(params);

      OAuthAccessTokenResponse resp =
          OAuthAccessTokenResponse.fromJson(response.fold((l) {
        throw const FormatException('Invalid user credentials');
      }, (r) => r.data['result']));

      Credentials creds = Credentials(
        resp.accessToken ?? '',
        refreshToken: resp.refreshToken,
        idToken: resp.idToken,
        tokenEndpoint: tokenEndpoint,
        scopes: scopes,
        expiration: DateTime.now().add(
          Duration(seconds: resp.expiresIn ?? 0),
        ),
      );
      EmpAuth().setCredentials(creds);
      // await _credentialsStorage.clear();
      await _credentialsStorage.save(creds);

      // final httpClient = await grant.handleAuthorizationResponse(queryParams);
      // await _credentialsStorage.save(httpClient.credentials);

      return right(unit);
    } on FormatException catch (e) {
      return left(AuthFailure.server(e.message));
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Unit>> signOut(
      {hasExpired = false, String? logoutRedirectUrl}) async {
    try {
      if (!hasExpired) {
        await _authRepository.oAuthLogoutUser();

        await _credentialsStorage.put('session_state', const Uuid().v4());
        await _credentialsStorage.clear();

        if (kIsWeb) {
          launchUrlString(
            '${logoutRedirectUrl ?? EmpAuth().logoutUrl}',
            mode: LaunchMode.inAppWebView,
            webOnlyWindowName: '_self',
          );
        }

        if (EmpAuth.instance.onSuccessfulLogout != null) {
          EmpAuth.instance.onSuccessfulLogout!();
        }

        // Deprecated handling for GET logout endpoint
        // String query = Uri(
        //     queryParameters: GeneralUtils.cleanMap({
        //   'client_id': clientId,
        //   'client_secret': clientSecret,
        //   'redirect_uri': EmpAuth().logoutUrl,
        // })).query;

        // if (!kIsWeb) {
        //   HeadlessInAppWebView headlessWebView = HeadlessInAppWebView(
        //       initialUrlRequest: URLRequest(
        //         url: Uri.parse('${revocationEndpointGet.toString()}?$query'),
        //       ),
        //       onLoadStop: (controller, url) {});

        //   headlessWebView
        //       .run()
        //       .then((value) async => await _credentialsStorage.clear());
        // } else {
        //   launchUrlString(
        //     '${revocationEndpointGet.toString()}?$query',
        //     mode: LaunchMode.inAppWebView,
        //     webOnlyWindowName: '_self',
        //   );
        // }
      }

      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, IdentityInstrospect?>> introspect() async {
    final storedCredentials = await _credentialsStorage.read();
    if (storedCredentials?.accessToken != null) {
      EmpAuth().setCredentials(storedCredentials);
      OAuthIntrospectionParameters parameters = OAuthIntrospectionParameters(
        token: storedCredentials?.accessToken,
        clientId: clientId,
        clientSecret: clientSecret,
      );

      final resp_ = await _authRepository.introspectionOAuth(
        parameters,
      );

      return resp_.fold(
        (failure) => left(const AuthFailure.server()),
        (response) async {
          if (response.statusCode == 200) {
            // if (!(response.data['result']['active'])) {
            //   signOut(hasExpired: true);
            //   return right(false);
            // }

            IdentityInstrospect identity =
                IdentityInstrospect.fromJson(response.data['result']);
            EmpAuth().setIdentity(identity);

            await _credentialsStorage.saveIdentity(identity);
            return right(identity);
          }
          // signOut(hasExpired: true);
          return right(null);
        },
      );
    } else {
      // signOut(hasExpired: true);
      return right(null);
    }
  }

  Future<Either<AppException, Credentials>> refresh({
    Credentials? credentials,
    String? refreshToken,
  }) async {
    var eitherType =
        await _authRepository.refreshTokenOAuth(OAuthRefreshTokenParameters(
      grantType: 'refresh_token',
      clientId: clientId,
      clientSecret: clientSecret,
      refreshToken: refreshToken ?? credentials?.refreshToken,
      scope: "openid",
    ));

    return eitherType.fold(
      (exception) {
        return Left(exception);
      },
      (response) async {
        OAuthAccessTokenResponse resp =
            OAuthAccessTokenResponse.fromJson(response.data['result']);
        Credentials creds = Credentials(
          resp.accessToken ?? '',
          refreshToken: resp.refreshToken,
          idToken: resp.idToken,
          tokenEndpoint: tokenEndpoint,
          scopes: scopes,
          expiration: DateTime.now().add(
            Duration(seconds: resp.expiresIn ?? 0),
          ),
        );
        await _credentialsStorage.save(creds);
        if (EmpAuth().onSuccessfulRefresh != null) {
          EmpAuth().onSuccessfulRefresh!(creds);
        }
        return Right(creds);
      },
    );
  }

  Future<Either<AuthFailure, Response>> setMfa(
    String verificationCode,
  ) async {
    final resp_ = await _authRepository.setMfa(
      verificationCode,
    );

    return resp_.fold(
      (fail) {
        return Left(AuthFailure.server('${fail.statusCode}: ${fail.message}'));
      },
      (response) {
        return Right(response as Response);
      },
    );
  }

  Future<Either<AuthFailure, Response>> validateMfa(
    String verificationCode,
  ) async {
    final resp_ = await _authRepository.validateMfa(
      verificationCode,
    );
    return resp_.fold(
      (fail) {
        return Left(AuthFailure.server('${fail.statusCode}: ${fail.message}'));
      },
      (response) {
        return Right(response as Response);
      },
    );
  }

  Future<Either<AuthFailure, String?>> getTenantIdByClientId() async {
    final resp_ = await _authRepository.getTenantIdByClientId();
    return resp_.fold(
      (fail) {
        return Left(AuthFailure.server('${fail.statusCode}: ${fail.message}'));
      },
      (response) {
        return Right(response.data['result']['id']);
      },
    );
  }
}
