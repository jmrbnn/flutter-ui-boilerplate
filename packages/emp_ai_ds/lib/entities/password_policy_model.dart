class PasswordPolicy {
  int? specialChars;
  int? upperCase;
  int? lowerCase;
  int? digits;
  bool? notEmail;
  bool? notUsername;
  int? length;
  int? maxLength;
  String? hashAlgorithm;
  int? hashIterations;
  int? forceExpiredPasswordChange;

  PasswordPolicy(
      {this.specialChars,
      this.upperCase,
      this.lowerCase,
      this.digits,
      this.notEmail,
      this.notUsername,
      this.length,
      this.maxLength,
      this.hashAlgorithm,
      this.hashIterations,
      this.forceExpiredPasswordChange});

  PasswordPolicy.fromJson(Map<String, dynamic> json) {
    specialChars = json['specialChars'];
    upperCase = json['upperCase'];
    lowerCase = json['lowerCase'];
    digits = json['digits'];
    notEmail = json['notEmail'];
    notUsername = json['notUsername'];
    length = json['length'];
    maxLength = json['maxLength'];
    hashAlgorithm = json['hashAlgorithm'];
    hashIterations = json['hashIterations'];
    forceExpiredPasswordChange = json['forceExpiredPasswordChange'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['specialChars'] = specialChars;
    data['upperCase'] = upperCase;
    data['lowerCase'] = lowerCase;
    data['digits'] = digits;
    data['notEmail'] = notEmail;
    data['notUsername'] = notUsername;
    data['length'] = length;
    data['maxLength'] = maxLength;
    data['hashAlgorithm'] = hashAlgorithm;
    data['hashIterations'] = hashIterations;
    data['forceExpiredPasswordChange'] = forceExpiredPasswordChange;
    return data;
  }
}
