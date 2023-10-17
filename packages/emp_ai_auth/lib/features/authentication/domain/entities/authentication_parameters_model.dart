class AuthenticationParameters {
  String? verificationType;
  String? code;
  String? username;
  String? password;

  AuthenticationParameters(
      {this.verificationType, this.code, this.username, this.password});

  AuthenticationParameters.fromJson(Map<String, dynamic> json) {
    verificationType = json['verificationType'];
    code = json['code'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['verificationType'] = verificationType;
    data['code'] = code;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
