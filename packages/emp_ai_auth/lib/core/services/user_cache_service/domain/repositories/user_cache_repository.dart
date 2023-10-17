import 'package:dartz/dartz.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_access_token_response_model.dart';

abstract class UserRepository {
  // Future<Either<AppException, User>> fetchUser();
  // Future<bool> saveUser({required User user});
  Future<bool> saveOAuthCode(String code);
  Future<bool> saveOAuthToken(OAuthAccessTokenResponse response);
  Future<bool> saveOAuthState(String state);
  Future<bool> deleteUser();
  Future<bool> hasUser();
  Future<void> clearOAuthCache();
  Future<bool> saveOAuthCodeVerifier(String codeVerifier);
  Future<Either<AppException, String>> getOAuthCodeVerifier();
  Future<Either<AppException, String>> getOAuthCode();
  Future<Either<AppException, String>> getOAuthState();
  Future<Either<AppException, OAuthAccessTokenResponse>> getOAuthToken();
}
