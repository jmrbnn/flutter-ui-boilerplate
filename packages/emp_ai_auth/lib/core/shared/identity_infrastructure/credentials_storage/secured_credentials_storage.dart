import 'dart:convert';

import 'package:emp_ai_auth/core/shared/identity_infrastructure/credentials_storage/credentials_storage.dart';
import 'package:emp_ai_auth/core/shared/identity_infrastructure/entities/identity_introspect.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:oauth2/oauth2.dart';

class SecuredCredentialsStorage implements CredentialsStorage {
  final FlutterSecureStorage _storage;

  SecuredCredentialsStorage(this._storage);

  static const _key = 'oauth2_credentials';
  static const _keyIdentity = 'oauth2_identity';
  static const _keyVerifier = 'oauth2_verifier';

  Credentials? _cachedCredentials;
  IdentityInstrospect? _cachedIdentity;

  @override
  Future<void> clear() {
    _cachedCredentials = null;
    _cachedIdentity = null;
    _storage.delete(key: _keyVerifier);
    _storage.delete(key: _keyIdentity);
    _storage.delete(key: 'active_tenant');
    _storage.delete(key: 'session_state');
    _storage.delete(key: 'tenants');
    return _storage.delete(key: _key);
  }

  @override
  Future<Credentials?> read() async {
    if (_cachedCredentials != null) {
      return _cachedCredentials;
    }

    final json = await _storage.read(key: _key);
    if (json == null) return null;

    try {
      return _cachedCredentials = Credentials.fromJson(json);
    } on FormatException {
      return null;
    }
  }

  @override
  Future<IdentityInstrospect?> readIdentity() async {
    if (_cachedIdentity != null) {
      return _cachedIdentity;
    }

    final json = await _storage.read(key: _keyIdentity);
    if (json == null) return null;

    try {
      return _cachedIdentity = IdentityInstrospect.fromJson(jsonDecode(json));
    } on FormatException {
      return null;
    }
  }

  @override
  Future<void> save(Credentials credentials) {
    _cachedCredentials = credentials;
    return _storage.write(key: _key, value: credentials.toJson());
  }

  @override
  Future<void> saveIdentity(IdentityInstrospect identity) {
    _cachedIdentity = identity;
    return _storage.write(
        key: _keyIdentity, value: jsonEncode(identity.toJson()));
  }

  @override
  Future<void> saveVerifier(String verifier) {
    return _storage.write(key: _keyVerifier, value: verifier);
  }

  @override
  Future<String?> readVerifier() async {
    final verifier = await _storage.read(key: _keyVerifier);
    if (verifier == null) return null;
    return verifier;
  }

  @override
  Future<dynamic> get(String key) async {
    final value = await _storage.read(key: key);
    return value;
  }

  @override
  Future<void> put(String key, dynamic value) async {
    await _storage.write(key: key, value: value);
  }
}
