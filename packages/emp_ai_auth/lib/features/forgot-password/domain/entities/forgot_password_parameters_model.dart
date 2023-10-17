class ForgotPasswordParameter {
  String? clientId;
  String? username;
  String? redirectUri;

  ForgotPasswordParameter({this.clientId, this.username});

  ForgotPasswordParameter.fromJson(Map<String, dynamic> json) {
    clientId = json['clientId'];
    username = json['username'];
    redirectUri = json['redirect_uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clientId'] = clientId;
    data['username'] = username;
    data['redirect_uri'] = redirectUri;
    return data;
  }
}
