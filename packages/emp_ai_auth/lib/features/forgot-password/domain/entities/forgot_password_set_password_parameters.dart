class ForgotPasswordSetPasswordParameters {
  String? code;
  String? username;
  String? password;

  ForgotPasswordSetPasswordParameters({
    this.code,
    this.username,
    this.password,
  });

  ForgotPasswordSetPasswordParameters.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
