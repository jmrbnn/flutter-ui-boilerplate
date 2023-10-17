class OAuthAuthorizationRequestParameters {
  String? responseType;
  String? clientId;
  String? clientSecret;
  String? redirectUri;
  String? scope;
  String? state;
  String? codeChallenge;
  String? codeChallengeMethod;

  OAuthAuthorizationRequestParameters(
      {this.responseType,
      this.clientId,
      this.clientSecret,
      this.redirectUri,
      this.scope,
      this.state,
      this.codeChallenge,
      this.codeChallengeMethod});

  OAuthAuthorizationRequestParameters.fromJson(Map<String, dynamic> json) {
    responseType = json['response_type'];
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
    redirectUri = json['redirect_uri'];
    scope = json['scope'];
    state = json['state'];
    codeChallenge = json['code_challenge'];
    codeChallengeMethod = json['code_challenge_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_type'] = responseType;
    data['client_id'] = clientId;
    data['client_secret'] = clientSecret;
    data['redirect_uri'] = redirectUri;
    data['scope'] = scope;
    data['state'] = state;
    data['code_challenge'] = codeChallenge;
    data['code_challenge_method'] = codeChallengeMethod;
    return data;
  }
}
