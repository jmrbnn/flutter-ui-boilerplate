library emp_ai_auth;

import 'dart:async';
import 'dart:typed_data';

import 'package:emp_ai_auth/core/shared/domain/providers/keycloak/keycloak_config.dart';
import 'package:emp_ai_auth/core/shared/identity_infrastructure/entities/identity_introspect.dart';
import 'package:emp_ai_auth/core/shared/utils/emp_app_browser.dart';
import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/state/auth_notifier.dart';
import 'package:emp_ai_auth/features/auth/presentation/widgets/render_webview.dart';
import 'package:emp_ai_auth/features/auth/shared/auth_providers.dart';
import 'package:emp_ai_auth/features/authentication/presentation/widgets/authentication_app.dart';
import 'package:emp_ai_auth/features/authentication/presentation/widgets/in_app_browser.dart';
import 'package:emp_ai_auth/renderer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:oauth2/oauth2.dart';

import 'features/auth/presentation/widgets/render_step.dart';

class EmpAuth {
  String _clientId = "";
  String? _clientSecret;
  String _kcAuthenticationUrl = "";
  String _kcAuthorizationUrl = "";
  String _kcUserUrl = "";
  String _redirectUrl = "";
  int _remindDaysBeforePasswordExpiry = 15;
  String? _logoutUrl = "";
  Credentials? _credentials;
  IdentityInstrospect? _identity;
  Function(dynamic)? _onSuccessfulAuthentication;
  Function()? _onSuccessfulLogout;
  Function()? _onPasswordChangeOptIn;
  Function(Credentials)? _onSuccessfulRefresh;
  Function(Uint8List?)? _onDownloadMfaQr;
  CookieManager? _cookieManager;

  Widget? _loginHeader;
  String? _loginButtonText;
  Widget? _loginFooter;
  Widget? _setupMfaHeader;
  Widget? _verifyMfaHeader;

  final SessionConfig _sessionConfig = SessionConfig(
    // invalidateSessionForAppLostFocus: const Duration(seconds: 3),
    invalidateSessionForUserInactivity: const Duration(minutes: 3),
  );

  // Service methods
  // Function(dynamic)? _getAuthorization;

  void initialize({
    required String clientId,
    String? clientSecret,
    required String kcAuthenticationUrl,
    required String kcAuthorizationUrl,
    required String kcUserUrl,
    String? redirectUrl,
    int remindDaysBeforePasswordExpiry = 15,
    String? logoutUrl,
    Function(dynamic)? onSuccessfulAuthentication,
    Function()? onPasswordChangeOptIn,
    Function()? onSuccessfulLogout,
    Function(Credentials)? onSuccessfulRefresh,
    Function(Uint8List?)? onDownloadMfaQr,
    CookieManager? cookieManager,
    Widget? loginHeader,
    String? loginButtonText,
    Widget? loginFooter,
    Widget? setupMfaHeader,
    Widget? verifyMfaHeader,
    // required Function(dynamic)? getAuthorization,
  }) {
    _clientId = clientId;
    _clientSecret = clientSecret;
    _kcAuthenticationUrl = kcAuthenticationUrl;
    _kcAuthorizationUrl = kcAuthorizationUrl;
    _kcUserUrl = kcUserUrl;
    _redirectUrl = redirectUrl ?? '${Uri.base.origin}/#/callback';
    _remindDaysBeforePasswordExpiry = remindDaysBeforePasswordExpiry;
    _logoutUrl = logoutUrl ?? Uri.base.origin;
    _onSuccessfulAuthentication = onSuccessfulAuthentication;
    _onSuccessfulLogout = onSuccessfulLogout;
    _onPasswordChangeOptIn = onPasswordChangeOptIn;
    _onSuccessfulRefresh = onSuccessfulRefresh;
    _onDownloadMfaQr = onDownloadMfaQr;
    _cookieManager = cookieManager;

    _loginHeader = loginHeader;
    _loginButtonText = loginButtonText;
    _loginFooter = loginFooter;
    _setupMfaHeader = setupMfaHeader;
    _verifyMfaHeader = verifyMfaHeader;
    // _getAuthorization = getAuthorization;
  }

  void setClientCredentials({
    required String clientId,
    String? clientSecret,
  }) {
    _clientId = clientId;
    _clientSecret = clientSecret;
  }

  void setCredentials(Credentials? credentials) {
    _credentials = credentials;
  }

  void setIdentity(IdentityInstrospect? identity) {
    _identity = identity;
  }

  /// Singleton factory
  static final EmpAuth instance = EmpAuth._internal();

  factory EmpAuth() {
    return instance;
  }

  String get clientId => _clientId;
  String? get clientSecret => _clientSecret;
  String get kcAuthenticationUrl => _kcAuthenticationUrl;
  String get kcAuthorizationUrl => _kcAuthorizationUrl;
  String get kcUserUrl => _kcUserUrl;
  String get redirectUrl => _redirectUrl;
  int get remindDaysBeforePasswordExpiry => _remindDaysBeforePasswordExpiry;
  String? get logoutUrl => _logoutUrl;
  Credentials? get credentials => _credentials;
  IdentityInstrospect? get identity => _identity;
  SessionConfig? get sessionConfig => _sessionConfig;
  Function(Uint8List?)? get onDownloadMfaQr => _onDownloadMfaQr;

  Set<StreamSubscription<SessionTimeoutState>> Function({
    required Function onAppFocusTimeout,
    required Function onUserInactivityTimeout,
  }) get initializeTimeoutListener => ({
        required Function onUserInactivityTimeout,
        required Function onAppFocusTimeout,
      }) =>
          {
            _sessionConfig.stream.listen((SessionTimeoutState timeoutEvent) {
              if (timeoutEvent == SessionTimeoutState.userInactivityTimeout) {
                onUserInactivityTimeout();
              } else if (timeoutEvent == SessionTimeoutState.appFocusTimeout) {
                onAppFocusTimeout();
              }
            }, onError: (e, stack) {
              GeneralUtils.isolateDebug(e.toString());
            })
          };

  // Service methods
  // Step 1: Get Authorization url for the code and state
  Function(WidgetRef ref, {KeycloakConfig? customConfig})?
      get getAuthorization => (ref, {KeycloakConfig? customConfig}) async {
            return await ref
                .watch(authNotifierProvider.notifier)
                .getAuthorization(customConfig: customConfig);
          };

  // Step 2: Facilitate the authorization part by launching a
  // web browser on behalf of the developer
  EmpAppBrowser? browser;
  ChromeSafariBrowser? browserCs;
  Function({
    required String url,
    required Function(dynamic) onBrowserClose,
    required Function(dynamic) onRedirect,
    bool hideUrlBarIos,
    bool hideToolbarTopIos,
    bool hideTitleBarAndroid,
    bool shouldCloseOnBackButtonPressedAndroid,
  })? get launchUrl => ({
        required String url,
        required Function(dynamic) onBrowserClose,
        required Function(dynamic) onRedirect,
        bool hideUrlBarIos = true,
        bool hideToolbarTopIos = true,
        bool hideTitleBarAndroid = true,
        bool shouldCloseOnBackButtonPressedAndroid = false,
      }) async {
        browser = EmpAppBrowser(
          onRedirect: onRedirect,
          onBrowserClose: (e) {
            onBrowserClose(e);
          },
        );

        var options = InAppBrowserClassSettings(
            webViewSettings: InAppWebViewSettings(
              sharedCookiesEnabled: true,
              thirdPartyCookiesEnabled: true,
            ),
            browserSettings: InAppBrowserSettings(
              toolbarBottomTranslucent: false,
              toolbarTopTranslucent: false,
              presentationStyle: ModalPresentationStyle.FULL_SCREEN,
              toolbarBottomBackgroundColor: Colors.white,
            )
            // crossPlatform: InAppBrowserOptions(
            //   hideUrlBar: hideUrlBarIos,
            //   hideToolbarTop: hideToolbarTopIos,
            //   toolbarTopBackgroundColor: Colors.white,
            // ),
            // android: AndroidInAppBrowserOptions(
            //   hideTitleBar: hideTitleBarAndroid,
            //   shouldCloseOnBackButtonPressed:
            //       shouldCloseOnBackButtonPressedAndroid,
            // ),
            // ios: IOSInAppBrowserOptions(
            //   presentationStyle: IOSUIModalPresentationStyle.FORM_SHEET,
            //   hideToolbarBottom: false,
            //   toolbarBottomTranslucent: false,
            //   toolbarBottomBackgroundColor: Colors.white,
            // ),
            // inAppWebViewGroupOptions: InAppWebViewGroupOptions(
            //   crossPlatform: InAppWebViewOptions(
            //     transparentBackground: false,
            //     javaScriptCanOpenWindowsAutomatically: true,
            //     javaScriptEnabled: true,
            //   ),
            // ),
            );

        return browser?.openUrlRequest(
          urlRequest: URLRequest(url: WebUri(url)),
          settings: options,
        );
      };

  Function({
    required String url,
  })? get launchUrlChromeSafari => ({
        required String url,
      }) async {
        browserCs = ChromeSafariBrowser();

        return browserCs?.open(
          url: WebUri(url),
          settings: ChromeSafariBrowserSettings(
            showTitle: false,
            enableUrlBarHiding: true,
            keepAliveEnabled: true,
          ),
        );
      };

  Function(
    BuildContext context, {
    required String url,
    required void Function(
            InAppWebViewController controller, Uri? url, bool? androidIsReload)?
        onUpdateVisitedHistory,
  })? get launchCustomInAppBrowser => (
        BuildContext context, {
        required String url,
        required void Function(InAppWebViewController controller, Uri? url,
                bool? androidIsReload)?
            onUpdateVisitedHistory,
      }) async {
        showGeneralDialog(
          context: context,
          barrierColor: Colors.black12.withOpacity(0.6), // Background color
          barrierDismissible: false,
          barrierLabel: 'Dialog',

          transitionDuration: const Duration(milliseconds: 400),
          pageBuilder: (_, __, ___) {
            return CustomInAppBrowser(
              url: url,
              onUpdateVisitedHistory: onUpdateVisitedHistory,
            );
          },
        );
      };

  Function()? get closeBrowser {
    if (browser!.isOpened()) browser?.close();
    if (browserCs!.isOpened()) browserCs?.close();
    return null;
  }

  // Step 3: Exchange state and auth code for access token
  Function({
    required WidgetRef ref,
    required Map? payload,
    required Function(AuthResponse) onSuccess,
    required Function(dynamic) onFailure,
  })? get exchangeCodeForToken => ({
        required WidgetRef ref,
        required Map? payload,
        required Function(AuthResponse) onSuccess,
        required Function(dynamic) onFailure,
      }) async {
        return await ref.watch(authNotifierProvider.notifier).exchangeAuthCode(
              payload: payload ?? {},
              onSuccess: onSuccess,
              onFailure: onFailure,
            );
      };

  Widget Function({
    required WebUri url,
    required Function(dynamic) onSubmitResponse,
  }) get renderForm => ({
        required WebUri url,
        required Function(dynamic) onSubmitResponse,
      }) {
        return MiniAppManager(
          child: RenderStep(
            onSubmitResponse: onSubmitResponse,
            url: url,
          ),
        );
      };

  Widget Function({
    required Uri url,
    required Function(dynamic) onSubmitResponse,
  }) get renderWebView => ({
        required Uri url,
        required Function(dynamic) onSubmitResponse,
      }) {
        return RenderWebview(uri: url.toString());
      };

  Widget get login => _login;
  Function(WidgetRef, {String? logoutRedirectUrl}) get logout => _logout;

  Function(dynamic)? get onSuccessfulAuthentication =>
      _onSuccessfulAuthentication;
  Function()? get onSuccessfulLogout => _onSuccessfulLogout;
  Function()? get onPasswordChangeOptIn => _onPasswordChangeOptIn;
  Future<bool> Function(WidgetRef ref) get isSignedIn => _isSignedIn;
  Future<void> Function(WidgetRef ref, {String? redirectUrl}) get silentLogin =>
      _silentLogin;
  Future<void> Function(WidgetRef ref) get checkAndUpdateAuthStatus =>
      _checkAndUpdateAuthStatus;
  Function(Credentials)? get onSuccessfulRefresh => _onSuccessfulRefresh;
  Future<void> Function(WidgetRef ref, {String? refreshToken})
      get refreshToken => _refreshToken;
  CookieManager? get cookieManager =>
      _cookieManager ?? CookieManager.instance();

  Widget? get loginHeader => _loginHeader;
  String? get loginButtonText => _loginButtonText;
  Widget? get loginFooter => _loginFooter;
  Widget? get setupMfaHeader => _setupMfaHeader;
  Widget? get verifyMfaHeader => _verifyMfaHeader;

  Future<Credentials?> Function(WidgetRef ref) get getCredentialsSignedIn =>
      _getCredentialsSignedIn;

  EmpAuth._internal();

  final Widget _login = const MiniAppManager(
    // child: AuthScreen(),
    child: AuthenticationApp(),
  );

  Function(WidgetRef, {String? logoutRedirectUrl}) get _logout =>
      (WidgetRef ref, {String? logoutRedirectUrl}) async {
        await ref.watch(authNotifierProvider.notifier).signOut(
              logoutRedirectUrl: logoutRedirectUrl,
            );
      };

  Future<bool> Function(WidgetRef ref) get _isSignedIn =>
      (WidgetRef ref) async =>
          await ref.watch(authNotifierProvider.notifier).isSignedIn();

  Future<void> Function(WidgetRef ref, {String? redirectUrl})
      get _silentLogin => (WidgetRef ref, {String? redirectUrl}) async => ref
          .watch(authNotifierProvider.notifier)
          .silentLogin(customConfig: KeycloakConfig(redirectUrl: redirectUrl));

  Future<void> Function(WidgetRef ref) get _checkAndUpdateAuthStatus =>
      (WidgetRef ref) async => await ref
          .watch(authNotifierProvider.notifier)
          .checkAndUpdateAuthStatus();

  Future<void> Function(WidgetRef ref, {String? refreshToken})
      get _refreshToken =>
          (WidgetRef ref, {String? refreshToken}) async => await ref
              .watch(authNotifierProvider.notifier)
              .refresh(refreshToken: refreshToken);

  Future<Credentials?> Function(WidgetRef ref) get _getCredentialsSignedIn =>
      (WidgetRef ref) async {
        return ref
            .watch(authNotifierProvider.notifier)
            .getSignedInCredentials();
      };

  Function(WidgetRef ref)? get getTenantId => (ref) async {
        String? tenantId =
            await ref.watch(authNotifierProvider.notifier).getTenantId();

        return tenantId;
      };
}
