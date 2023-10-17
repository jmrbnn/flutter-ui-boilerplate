import 'package:dartz/dartz.dart';
import 'package:emp_ai_auth/core/shared/domain/models/response.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/features/auth/data/datasource/oauth_data_source.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_authorization_request_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_introspection_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_mfa_response_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_password_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_refresh_token_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_token_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/repositories/oauth_repository.dart';

class OAuthenticationRepositoryImpl extends OAuthenticationRepository {
  final OAuthUserDataSource dataSource;

  OAuthenticationRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, OAuthMfaResponse>> oAuthLoginUser(
      OAuthParameters parameters) {
    return dataSource.oAuthLoginUser(parameters);
  }

  @override
  Future<Either<AppException, Uri>> initOAuth(
    OAuthAuthorizationRequestParameters parameters,
  ) {
    return dataSource.initOAuth(parameters);
  }

  @override
  Future<Either<AppException, Response>> introspectionOAuth(
    OAuthIntrospectionParameters parameters,
  ) {
    return dataSource.introspectionOAuth(parameters);
  }

  @override
  Future<Either<AppException, Response>> exchangeAuthCode(
      OAuthTokenParameters parameters) {
    return dataSource.exchangeAuthCode(parameters);
  }

  @override
  Future<Either<AppException, Response>> refreshTokenOAuth(
      OAuthRefreshTokenParameters parameters) {
    return dataSource.refreshTokenOAuth(parameters);
  }

  @override
  Future<Either<AppException, Response>> oAuthPasswordLogin(
      OAuthPasswordParameters parameters) {
    return dataSource.oAuthPasswordLogin(parameters);
  }

  @override
  Future<Either<AppException, Response>> oAuthLogoutUser() {
    return dataSource.oAuthLogoutUser();
  }

  @override
  Future<Either<AppException, OAuthMfaResponse>> setMfa(String code) {
    return dataSource.setMfa(code);
  }

  @override
  Future<Either<AppException, OAuthMfaResponse>> validateMfa(String code) {
    return dataSource.validateMfa(code);
  }

  @override
  Future<Either<AppException, Response>> getPasswordPolicy() {
    return dataSource.getPasswordPolicy();
  }

  @override
  Future<Either<AppException, Response>> getTenantIdByClientId() {
    return dataSource.getTenantIdByClientId();
  }

  @override
  Future<Either<AppException, Response>> silentLogin(String url) {
    return dataSource.silentLogin(url);
  }
}
