class KeycloakConfig {
  final String? keycloakAuthenticationUrl;
  final String? keycloakUserUrl;
  final String? keyCloakClientSecret;
  final String? keyCloakClientId;
  final String? authFlow;
  final String? redirectUrl;

  KeycloakConfig({
    this.keycloakAuthenticationUrl,
    this.keycloakUserUrl,
    this.keyCloakClientSecret,
    this.keyCloakClientId,
    this.authFlow,
    this.redirectUrl,
  });
}
