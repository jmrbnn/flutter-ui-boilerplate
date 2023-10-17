import 'package:dartz/dartz.dart';
import 'package:emp_ai_auth/core/services/user_cache_service/data/datasource/user_local_datasource.dart';
import 'package:emp_ai_auth/core/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_access_token_response_model.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this.dataSource);

  final UserDataSource dataSource;

  @override
  Future<bool> deleteUser() {
    return dataSource.deleteUser();
  }

  // @override
  // Future<Either<AppException, User>> fetchUser() {
  //   return dataSource.fetchUser();
  // }

  // @override
  // Future<bool> saveUser({required User user}) {
  //   return dataSource.saveUser(user: user);
  // }

  @override
  Future<bool> hasUser() {
    return dataSource.hasUser();
  }

  @override
  Future<bool> saveOAuthCodeVerifier(String codeVerifier) {
    return dataSource.saveOAuthCodeVerifier(codeVerifier);
  }

  @override
  Future<bool> saveOAuthCode(String code) {
    return dataSource.saveOAuthCode(code);
  }

  @override
  Future<void> clearOAuthCache() {
    return dataSource.clearOAuthCache();
  }

  @override
  Future<bool> saveOAuthState(String state) {
    return dataSource.saveOAuthState(state);
  }

  @override
  Future<Either<AppException, String>> getOAuthCodeVerifier() {
    return dataSource.getOAuthCodeVerifier();
  }

  @override
  Future<Either<AppException, String>> getOAuthCode() {
    return dataSource.getOAuthCode();
  }

  @override
  Future<Either<AppException, String>> getOAuthState() {
    return dataSource.getOAuthState();
  }

  @override
  Future<bool> saveOAuthToken(OAuthAccessTokenResponse response) {
    return dataSource.saveOAuthToken(response);
  }

  @override
  Future<Either<AppException, OAuthAccessTokenResponse>> getOAuthToken() {
    return dataSource.getOAuthToken();
  }
}
