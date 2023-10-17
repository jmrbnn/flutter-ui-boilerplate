class OAuthPasswordParameters {
  String? grantType;
  String? clientId;
  String? clientSecret;
  String? username;
  String? password;
  String? scope;

  OAuthPasswordParameters(
      {this.grantType,
      this.clientId,
      this.clientSecret,
      this.username,
      this.password,
      this.scope});

  OAuthPasswordParameters.fromJson(Map<String, dynamic> json) {
    grantType = json['grant_type'];
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
    username = json['username'];
    password = json['password'];
    scope = json['scope'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grant_type'] = grantType;
    data['client_id'] = clientId;
    data['client_secret'] = clientSecret;
    data['username'] = username;
    data['password'] = password;
    data['scope'] = scope;
    return data;
  }
}
