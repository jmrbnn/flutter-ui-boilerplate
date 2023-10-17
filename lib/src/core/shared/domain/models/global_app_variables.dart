class GlobalAppVariables {
  String? keycloakClientId;
  String? keycloakClientSecret;
  String? keycloakClientAuthUrl;
  String? keycloakClientUserUrl;
  String? appTag;
  late String authFlow;
  late bool isPopUp;
  late double keycloakDismissPopUpMs;

  GlobalAppVariables({
    this.keycloakClientId,
    this.keycloakClientSecret,
    this.keycloakClientAuthUrl,
    this.keycloakClientUserUrl,
    this.appTag,
    this.authFlow = 'authorization_code',
    this.isPopUp = true,
    this.keycloakDismissPopUpMs = 3000,
  });

  GlobalAppVariables.fromJson(Map<String, dynamic> json) {
    keycloakClientId = json['keycloak_client_id'];
    keycloakClientSecret = json['keycloak_client_secret'];
    keycloakClientAuthUrl = json['keycloak_client_auth_url'];
    keycloakClientUserUrl = json['keycloak_client_user_url'];
    appTag = json['app_tag'];
    authFlow = json['auth_flow'];
    isPopUp = json['is_popup'] ?? true;
    keycloakDismissPopUpMs = json['keycloak_dismiss_popup_ms'] is double
        ? json['keycloak_dismiss_popup_ms']
        : 3000;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['keycloak_client_id'] = keycloakClientId;
    data['keycloak_client_secret'] = keycloakClientSecret;
    data['keycloak_client_auth_url'] = keycloakClientAuthUrl;
    data['app_tag'] = appTag;
    data['auth_flow'] = authFlow;
    data['is_popup'] = isPopUp;
    data['keycloak_dismiss_popup_ms'] = keycloakDismissPopUpMs;
    return data;
  }
}
