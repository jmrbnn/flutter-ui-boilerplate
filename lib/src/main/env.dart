import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'KEYCLOAK_CLIENT_ID', defaultValue: 'EMAPTA')
  static String kcClientId = _Env.kcClientId;

  @EnviedField(varName: 'KEYCLOAK_CLIENT_SECRET', defaultValue: '')
  static String kcClientSecret = _Env.kcClientSecret;

  @EnviedField(
      varName: 'KEYCLOAK_AUTHENTICATION_URL',
      defaultValue: 'https://ai.playground.emaptagtsrnd.xyz/auth')
  static String kcAuthenticationUrl = _Env.kcAuthenticationUrl;

  @EnviedField(
      varName: 'KEYCLOAK_USER_URL',
      defaultValue: 'https://ai.playground.emaptagtsrnd.xyz/user')
  static String kcUserUrl = _Env.kcUserUrl;

  @EnviedField(
      varName: 'KEYCLOAK_AUTHORIZATION_URL',
      defaultValue: 'https://ai.playground.emaptagtsrnd.xyz/authorization')
  static String kcAuthorizationUrl = _Env.kcAuthorizationUrl;

  @EnviedField(
      varName: 'UI_IDENTITY_URL',
      defaultValue:
          'https://emp-identity-management.playground.emaptagtsrnd.xyz/#/')
  static String uiIdentityURl = _Env.uiIdentityURl;

  @EnviedField(
      varName: 'MS_DOCUMENTS_URL',
      defaultValue: 'https://ai.playground.emaptagtsrnd.xyz/document')
  static String msDocumentsUrl = _Env.msDocumentsUrl;

  @EnviedField(
      varName: 'MS_PROFILES_URL',
      defaultValue: 'https://ai.playground.emaptagtsrnd.xyz/profile')
  static String msProfilesUrl = _Env.msProfilesUrl;

  @EnviedField(
      varName: 'MS_CLIENTS_URL',
      defaultValue: 'https://ai.playground.emaptagtsrnd.xyz/client')
  static String msClientsUrl = _Env.msClientsUrl;

  @EnviedField(
      varName: 'MS_OPEN_AI_WRAPPER_URL',
      defaultValue: 'https://ai.playground.emaptagtsrnd.xyz')
  static String msOpenAiWrapperUrl = _Env.msOpenAiWrapperUrl;
}
