class OAuthIntrospectionParameters {
  String? token;
  String? clientId;
  String? clientSecret;

  OAuthIntrospectionParameters({this.token, this.clientId, this.clientSecret});

  OAuthIntrospectionParameters.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['client_id'] = clientId;
    data['client_secret'] = clientSecret;
    return data;
  }
}
