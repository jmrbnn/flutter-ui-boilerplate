class OAuthParameters {
  String? username;
  String? password;
  String? responseType;
  String? clientId;
  String? clientSecret;
  String? scope;
  String? redirectUri;
  String? codeChallengeMethod;
  String? codeChallenge;

  OAuthParameters({
    this.responseType,
    this.clientId,
    this.username,
    this.password,
    this.clientSecret,
    this.scope,
    this.redirectUri,
    this.codeChallengeMethod,
    this.codeChallenge,
  });

  OAuthParameters.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    responseType = json['response_type'];
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
    scope = json['scope'];
    redirectUri = json['redirect_uri'];
    codeChallengeMethod = json['code_challenge_method'];
    codeChallenge = json['code_challenge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = Uri.decodeFull(username ?? '');
    data['password'] = Uri.decodeFull(password ?? '');
    data['response_type'] = Uri.decodeFull(responseType ?? '');
    data['client_id'] = Uri.decodeFull(clientId ?? '');
    data['client_secret'] = Uri.decodeFull(clientSecret ?? '');
    data['scope'] = Uri.decodeFull(scope ?? '');
    data['redirect_uri'] = Uri.decodeFull(redirectUri ?? '');
    data['code_challenge_method'] = Uri.decodeFull(codeChallengeMethod ?? '');
    data['code_challenge'] = Uri.decodeFull(codeChallenge ?? '');
    return data;
  }
}
