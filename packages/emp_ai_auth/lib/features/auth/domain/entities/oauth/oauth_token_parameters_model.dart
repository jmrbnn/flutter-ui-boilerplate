class OAuthTokenParameters {
  String? grantType;
  String? code;
  String? codeVerifier;
  String? clientId;
  String? clientSecret;
  String? refreshToken;
  String? username;
  String? password;
  String? scope;

  OAuthTokenParameters(
      {this.grantType,
      this.code,
      this.codeVerifier,
      this.clientId,
      this.clientSecret,
      this.refreshToken,
      this.username,
      this.password,
      this.scope});

  OAuthTokenParameters.fromJson(Map<String, dynamic> json) {
    grantType = json['grant_type'];
    code = json['code'];
    codeVerifier = json['code_verifier'];
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
    refreshToken = json['refresh_token'];
    username = json['username'];
    password = json['password'];
    scope = json['scope'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grant_type'] = grantType;
    data['code'] = code;
    data['code_verifier'] = codeVerifier;
    data['client_id'] = clientId;
    data['client_secret'] = clientSecret;
    data['refresh_token'] = refreshToken;
    data['username'] = username;
    data['password'] = password;
    data['scope'] = scope;
    return data;
  }
}
