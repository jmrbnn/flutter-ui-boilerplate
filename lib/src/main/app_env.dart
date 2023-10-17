// ignore_for_file: constant_identifier_names, use_setters_to_change_properties, avoid_classes_with_only_static_members
import 'package:emp_ai_flutter_boilerplate/src/main/env.dart';

enum AppEnvironment { DEV, STAGING, PROD }

abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.DEV;
  static String? _customkeycloakAuthenticationUrl;
  static String? _customkeycloakUserUrl;
  static String? _customKeyCloakClientSecret;
  static String? _customKeyCloakClientId;
  static String? _customAuthFlow;

  static void initialize(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  static void setKeycloakConfiguration({
    String? keycloakAuthenticationUrl,
    String? keycloakUserUrl,
    String? clientSecret,
    String? clientId,
    String? authFlow,
  }) {
    _customkeycloakAuthenticationUrl = keycloakAuthenticationUrl;
    _customkeycloakUserUrl = keycloakUserUrl;
    _customKeyCloakClientSecret = clientSecret;
    _customKeyCloakClientId = clientId;
    _customAuthFlow = authFlow;
  }

  static String get appName => _environment._appTitle;
  static String get envName => _environment._envName;
  static String get keycloakAuthenticationUrl =>
      _customkeycloakAuthenticationUrl ??
      _environment._keycloakAuthenticationUrl;
  static String get keycloakUserUrl =>
      _customkeycloakUserUrl ?? _environment._keycloakUserUrl;
  static String? get keyCloakClientSecret =>
      _customKeyCloakClientSecret ?? _environment._keyCloakClientSecret;
  static String? get msDocumentsUrl => _environment._msDocumentsUrl;
  static String? get msProfilesUrl => _environment._msProfilesUrl;
  static String? get msClientsUrl => _environment._msClientsUrl;
  static String? get msOpenAiWrapperUrl => _environment._msOpenAiWrapperUrl;
  static String? get kcAuthorizationUrl => _environment._kcAuthorizationUrl;
  static String? get keyCloakClientId =>
      _customKeyCloakClientId ?? _environment._keyCloakClientId;
  static String? get authFlow => _customAuthFlow ?? _environment._authFlow;
  static AppEnvironment get environment => _environment;
  static bool get isProduction => _environment == AppEnvironment.PROD;
}

extension _EnvProperties on AppEnvironment {
  static const _appTitles = {
    AppEnvironment.DEV: '[DEV Build] Flutter Boilerplate',
    AppEnvironment.STAGING: '[STG Build] Flutter Boilerplate',
    AppEnvironment.PROD: 'Flutter Boilerplate',
  };

  static final _keycloakAuthenticationUrls = {
    AppEnvironment.DEV: Env.kcAuthenticationUrl,
    AppEnvironment.STAGING: 'https://dummyjson.com',
    AppEnvironment.PROD: 'https://dummyjson.com',
  };

  static final _keycloakUserUrls = {
    AppEnvironment.DEV: Env.kcUserUrl,
    AppEnvironment.STAGING: 'https://dummyjson.com',
    AppEnvironment.PROD: 'https://dummyjson.com',
  };

  static final _keyCloakClientIds = {
    AppEnvironment.DEV: Env.kcClientId,
    AppEnvironment.STAGING: null,
    AppEnvironment.PROD: null,
  };

  static final _authFlows = {
    AppEnvironment.DEV: 'authorization_code',
    AppEnvironment.STAGING: 'authorization_code',
    AppEnvironment.PROD: 'authorization_code',
  };

  static final _keyCloakClientSecrets = {
    AppEnvironment.DEV: Env.kcClientSecret,
    AppEnvironment.STAGING: null,
    AppEnvironment.PROD: null,
  };

  static const _envs = {
    AppEnvironment.DEV: 'dev',
    AppEnvironment.STAGING: 'staging',
    AppEnvironment.PROD: 'prod',
  };

  String get _appTitle => _appTitles[this]!;
  String get _envName => _envs[this]!;
  String get _keycloakAuthenticationUrl => _keycloakAuthenticationUrls[this]!;
  String get _keycloakUserUrl => _keycloakUserUrls[this]!;
  String get _keyCloakClientId => _keyCloakClientIds[this]!;
  String get _keyCloakClientSecret => _keyCloakClientSecrets[this]!;
  String get _msDocumentsUrl => Env.msDocumentsUrl;
  String get _msProfilesUrl => Env.msProfilesUrl;
  String get _msClientsUrl => Env.msClientsUrl;
  String get _msOpenAiWrapperUrl => Env.msOpenAiWrapperUrl;
  String get _kcAuthorizationUrl => Env.kcAuthorizationUrl;
  String get _authFlow => _authFlows[this]!;
}
