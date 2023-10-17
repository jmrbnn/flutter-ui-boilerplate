class ForgotPasswordVerifyCodeParameter {
  String? code;
  String? username;

  ForgotPasswordVerifyCodeParameter({this.code, this.username});

  ForgotPasswordVerifyCodeParameter.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['username'] = username;
    return data;
  }
}
