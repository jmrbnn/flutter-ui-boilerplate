import 'package:emp_ai_auth/core/shared/identity_infrastructure/entities/identity_introspect.dart';
import 'package:oauth2/oauth2.dart';

abstract class CredentialsStorage {
  Future<Credentials?> read();
  Future<IdentityInstrospect?> readIdentity();
  Future<void> save(Credentials credentials);
  Future<void> saveIdentity(IdentityInstrospect credentials);
  Future<void> saveVerifier(String verifier);
  Future<void> put(String key, dynamic value);
  Future<dynamic> get(String key);
  Future<String?> readVerifier();
  Future<void> clear();
}
