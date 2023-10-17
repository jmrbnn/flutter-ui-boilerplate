class OAuthMfaResponse {
  String? status;
  late String url;
  int? passwordExpiryDays;

  OAuthMfaResponse({this.status, this.url = '', this.passwordExpiryDays});

  OAuthMfaResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    url = json['url'] ?? '';
    passwordExpiryDays = json['passwordExpiryDays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['url'] = url;
    data['passwordExpiryDays'] = passwordExpiryDays;
    return data;
  }
}
