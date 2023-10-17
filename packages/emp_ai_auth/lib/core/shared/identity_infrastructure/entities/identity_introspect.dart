class IdentityInstrospect {
  int? exp;
  int? iat;
  String? jti;
  String? iss;
  dynamic aud;
  String? sub;
  String? typ;
  String? azp;
  String? sessionState;
  String? acr;
  RealmAccess? realmAccess;
  Map? resourceAccess;
  String? scope;
  String? sid;
  bool? emailVerified;
  String? name;
  String? preferredUsername;
  String? givenName;
  String? familyName;
  String? email;
  String? tenantId;

  IdentityInstrospect({
    this.exp,
    this.iat,
    this.jti,
    this.iss,
    this.aud,
    this.sub,
    this.typ,
    this.azp,
    this.sessionState,
    this.acr,
    this.realmAccess,
    this.resourceAccess,
    this.scope,
    this.sid,
    this.emailVerified,
    this.name,
    this.preferredUsername,
    this.givenName,
    this.familyName,
    this.email,
    this.tenantId,
  });

  IdentityInstrospect.fromJson(Map<String, dynamic> json) {
    exp = json['exp'];
    iat = json['iat'];
    jti = json['jti'];
    iss = json['iss'];
    aud = json['aud'];
    sub = json['sub'];
    typ = json['typ'];
    azp = json['azp'];
    sessionState = json['session_state'];
    acr = json['acr'];
    realmAccess = json['realm_access'] != null
        ? RealmAccess.fromJson(json['realm_access'])
        : null;
    resourceAccess = json['resource_access'];
    scope = json['scope'];
    sid = json['sid'];
    emailVerified = json['email_verified'];
    name = json['name'];
    preferredUsername = json['preferred_username'];
    givenName = json['given_name'];
    familyName = json['family_name'];
    email = json['email'];
    tenantId = json['tenantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exp'] = exp;
    data['iat'] = iat;
    data['jti'] = jti;
    data['iss'] = iss;
    data['aud'] = aud;
    data['sub'] = sub;
    data['typ'] = typ;
    data['azp'] = azp;
    data['session_state'] = sessionState;
    data['acr'] = acr;
    if (realmAccess != null) {
      data['realm_access'] = realmAccess!.toJson();
    }
    if (resourceAccess != null) {
      data['resource_access'] = resourceAccess;
    }
    data['scope'] = scope;
    data['sid'] = sid;
    data['email_verified'] = emailVerified;
    data['name'] = name;
    data['preferred_username'] = preferredUsername;
    data['given_name'] = givenName;
    data['family_name'] = familyName;
    data['email'] = email;
    data['tenantId'] = tenantId;
    return data;
  }
}

class RealmAccess {
  List<String>? roles;

  RealmAccess({this.roles});

  RealmAccess.fromJson(Map<String, dynamic> json) {
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roles'] = roles;
    return data;
  }
}

// class ResourceAccess {
//   RealmAccess? account;

//   ResourceAccess({this.account});

//   ResourceAccess.fromJson(Map<String, dynamic> json) {
//     account =
//         json['account'] != null ? RealmAccess.fromJson(json['account']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     if (account != null) {
//       data['account'] = account!.toJson();
//     }
//     return data;
//   }
// }
