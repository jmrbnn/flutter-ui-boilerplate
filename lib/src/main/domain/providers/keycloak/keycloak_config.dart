class KeycloakConfig {
  final String? keycloakAuthenticationUrl;
  final String? keycloakUserUrl;
  final String? keyCloakClientSecret;
  final String? keyCloakClientId;
  final String? authFlow;

  KeycloakConfig({
    this.keycloakAuthenticationUrl,
    this.keycloakUserUrl,
    this.keyCloakClientSecret,
    this.keyCloakClientId,
    this.authFlow,
  });
}
