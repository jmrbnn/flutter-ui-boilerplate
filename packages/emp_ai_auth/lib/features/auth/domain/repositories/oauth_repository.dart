import 'package:dartz/dartz.dart';
import 'package:emp_ai_auth/core/shared/domain/models/response.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_authorization_request_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_introspection_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_mfa_response_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_password_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_refresh_token_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_token_parameters_model.dart';

abstract class OAuthenticationRepository {
  Future<Either<AppException, OAuthMfaResponse>> oAuthLoginUser(
    OAuthParameters parameters,
  );
  Future<Either<AppException, Uri>> initOAuth(
    OAuthAuthorizationRequestParameters parameters,
  );
  Future<Either<AppException, Response>> introspectionOAuth(
    OAuthIntrospectionParameters parameters,
  );
  Future<Either<AppException, Response>> refreshTokenOAuth(
    OAuthRefreshTokenParameters parameters,
  );
  Future<Either<AppException, Response>> exchangeAuthCode(
    OAuthTokenParameters parameters,
  );
  Future<Either<AppException, Response>> oAuthPasswordLogin(
    OAuthPasswordParameters parameters,
  );
  Future<Either<AppException, Response>> oAuthLogoutUser();
  Future<Either<AppException, OAuthMfaResponse>> setMfa(
    String code,
  );
  Future<Either<AppException, OAuthMfaResponse>> validateMfa(
    String code,
  );
  Future<Either<AppException, Response>> getPasswordPolicy();
  Future<Either<AppException, Response>> getTenantIdByClientId();
  Future<Either<AppException, Response>> silentLogin(String url);
}
