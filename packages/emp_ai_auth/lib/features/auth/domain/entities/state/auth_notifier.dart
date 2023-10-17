import 'package:emp_ai_auth/core/shared/domain/providers/keycloak/keycloak_config.dart';
import 'package:emp_ai_auth/core/shared/identity_infrastructure/credentials_storage/credentials_storage.dart';
import 'package:emp_ai_auth/core/shared/identity_infrastructure/entities/identity_introspect.dart';
import 'package:emp_ai_auth/core/shared/identity_infrastructure/identity_authenticator.dart';
import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_access_token_response_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/state/auth_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauth2/oauth2.dart';

typedef AuthUriCallBack = Future<Uri> Function(Uri authorizationUrl);

class AuthResponse {
  final OAuthAccessTokenResponse token;
  final IdentityInstrospect? identity;

  AuthResponse(this.token, this.identity);
}

typedef AuthSuccessCallBack = Future Function(
    OAuthAccessTokenResponse response, IdentityInstrospect identity);

class AuthNotifier extends StateNotifier<AuthState> {
  final IdentityAuthenticator authenticator;
  final CredentialsStorage _credentialsStorage;

  AuthNotifier(
    this.authenticator,
    this._credentialsStorage,
  ) : super(const AuthState.initial());

  IdentityInstrospect? identity;
  Credentials? credentials;

  Future<IdentityInstrospect?> getIdentity() async {
    IdentityInstrospect? cachedIdentity =
        await _credentialsStorage.readIdentity();

    if (cachedIdentity == null) {
      identity = await introspect();
    } else {
      identity = cachedIdentity;
    }
    return identity;
  }

  Future<Credentials?> getCredentials() async {
    Credentials? cachedCredentials = await _credentialsStorage.read();

    if (cachedCredentials == null) {
      credentials = await getSignedInCredentials();
    } else {
      credentials = cachedCredentials;
    }
    return credentials;
  }

  Future<bool> isSignedIn() {
    return authenticator.isSignedIn();
  }

  Future<Credentials?> getSignedInCredentials() {
    return authenticator.getSignedInCredentials();
  }

  Future<void> checkAndUpdateAuthStatus() async {
    if (kDebugMode) {
      print('isSignedIn: ${await authenticator.isSignedIn()}');
    }
    bool isLoggedIn = await authenticator.isSignedIn();
    // if (isLoggedIn) await introspect();

    state = (isLoggedIn)
        ? AuthState.authenticated(identity)
        : const AuthState.unauthenticated();
  }

  Future<void> signIn({
    required AuthUriCallBack authorizationCallback,
    required Function(dynamic) onSuccess,
    KeycloakConfig? customKeycloakConfig,
  }) async {
    // if (customKeycloakConfig != null) {
    //   EnvInfo.setKeycloakConfiguration(
    //     clientId: customKeycloakConfig.keyCloakClientId,
    //     clientSecret: customKeycloakConfig.keyCloakClientSecret,
    //     keycloakAuthenticationUrl:
    //         customKeycloakConfig.keycloakAuthenticationUrl,
    //     keycloakUserUrl: customKeycloakConfig.keycloakUserUrl,
    //   );
    // }
    state = const AuthState.authorizing();
    final AuthorizationCodeGrant grant =
        authenticator.createGrant(customConfig: customKeycloakConfig);

    final redirectUrl = await authorizationCallback(
      await authenticator.getAuthorizationUrl(grant),
    );

    final failureOrSuccess = await authenticator.handleAuthorizationResponse(
      grant,
      redirectUrl.queryParameters,
    );
    await introspect();
    state = failureOrSuccess.fold((l) => AuthState.failed(failure: l), (r) {
      onSuccess({'identity': identity, 'auth': r});

      return AuthState.authenticated(identity);
    });

    grant.close();
  }

  Future<Uri> getAuthorization({KeycloakConfig? customConfig}) async {
    // Create code verifier and code challenge
    final AuthorizationCodeGrant grant =
        authenticator.createGrant(customConfig: customConfig);

    // Get redirect url
    Uri authorizationUrl = await authenticator.getAuthorizationUrl(
      grant,
      customRedirectUrl: customConfig?.redirectUrl,
    );

    // final failureOrSuccess = await authenticator.handleAuthorizationResponse(
    //   grant,
    //   redirectUrl.queryParameters,
    // );
    // await introspect();
    // state = failureOrSuccess.fold((l) => AuthState.failed(failure: l), (r) {
    //   onSuccess({'identity': identity, 'auth': r});

    //   return AuthState.authenticated(identity);
    // });

    grant.close();
    return authorizationUrl;
  }

  Future<void> silentLogin({KeycloakConfig? customConfig}) async {
    // Create code verifier and code challenge
    final AuthorizationCodeGrant grant =
        authenticator.createGrant(customConfig: customConfig);

    state = const AuthState.authorizing();

    // Call silent login and check if logged in,
    // Exchange authcode automatically if logged in, else,
    // proceed with the usual authentication flow
    var passOrFail =
        await authenticator.silentLogin(grant, customConfig: customConfig);

    state = passOrFail.fold(
      (l) => const AuthState.unauthenticated(),
      (r) => const AuthState.authenticated(null),
    );
  }

  Future<void> exchangeAuthCode({
    required Map payload,
    required Function(AuthResponse) onSuccess,
    required Function(dynamic) onFailure,
  }) async {
    final failureOrSuccess = await authenticator.exchangeAuthCode(payload);

    await introspect();
    state = failureOrSuccess.fold(
      (l) {
        onFailure(l);
        return AuthState.failed(failure: l);
      },
      (r) {
        onSuccess(AuthResponse(r, identity));
        return AuthState.authenticated(identity);
      },
    );
  }

  Future<void> signInViaPassword({
    required Function() onSuccess,
    required String username,
    required String password,
  }) async {
    final failureOrSuccess = await authenticator.signInViaPassword(
      username,
      password,
    );
    await introspect();
    state = failureOrSuccess.fold(
      (l) => AuthState.failed(failure: l),
      (r) {
        onSuccess();
        return AuthState.authenticated(identity);
      },
    );
  }

  Future<void> signOut({String? logoutRedirectUrl}) async {
    final failureOrSuccess =
        await authenticator.signOut(logoutRedirectUrl: logoutRedirectUrl);
    state = failureOrSuccess.fold(
      (l) => AuthState.failed(failure: l),
      (r) {
        // GoRouter.of(context).push(Routes.auth.url);
        if (EmpAuth().onSuccessfulLogout != null) {
          EmpAuth().onSuccessfulLogout!();
        }
        return const AuthState.unauthenticated();
      },
    );
  }

  Future<IdentityInstrospect?> introspect() async {
    final failureOrSuccess = await authenticator.introspect();
    state = await failureOrSuccess.fold(
      (l) {
        // Sign out if introspect fails
        // signOut();
        return AuthState.failed(failure: l);
      },
      (identity_) {
        identity = identity_;
        if (identity_ == null) {
          return const AuthState.unauthenticated();
        }

        return AuthState.authenticated(identity_);
      },
    );
    return identity;
  }

  Future<void> refresh({String? refreshToken}) async {
    await authenticator.refresh(refreshToken: refreshToken);
  }

  Future<String?> getTenantId() async {
    String? tenantId;
    final failureOrSuccess = await authenticator.getTenantIdByClientId();
    failureOrSuccess.fold(
      (l) {
        tenantId = null;
      },
      (tenantId_) {
        tenantId = tenantId_;
      },
    );

    return tenantId;
  }
}

final identityProvider =
    StateNotifierProvider<IdentityIntrospectNotifier, IdentityInstrospect?>(
  (ref) => IdentityIntrospectNotifier(null),
);

class IdentityIntrospectNotifier extends StateNotifier<IdentityInstrospect?> {
  IdentityIntrospectNotifier(IdentityInstrospect? identity) : super(null);

  void update(IdentityInstrospect? identity) {
    state = identity;
  }
}
