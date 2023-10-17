class OAuthRefreshTokenParameters {
  String? grantType;
  String? clientId;
  String? clientSecret;
  String? refreshToken;
  String? scope;

  OAuthRefreshTokenParameters(
      {this.grantType,
      this.clientId,
      this.clientSecret,
      this.refreshToken,
      this.scope});

  OAuthRefreshTokenParameters.fromJson(Map<String, dynamic> json) {
    grantType = json['grant_type'];
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
    refreshToken = json['refresh_token'];
    scope = json['scope'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grant_type'] = grantType;
    data['client_id'] = clientId;
    data['client_secret'] = clientSecret;
    data['refresh_token'] = refreshToken;
    data['scope'] = scope;
    return data;
  }
}
