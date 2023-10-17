class ChangePasswordParameters {
  String? username;
  String? code;
  String? currentPassword;
  String? password;
  String? accessToken;

  ChangePasswordParameters(
      {this.username,
      this.code,
      this.currentPassword,
      this.password,
      this.accessToken});

  ChangePasswordParameters.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    code = json['code'];
    currentPassword = json['currentPassword'];
    password = json['password'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['code'] = code;
    data['currentPassword'] = currentPassword;
    data['password'] = password;
    data['accessToken'] = accessToken;
    return data;
  }
}
