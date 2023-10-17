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
import 'package:emp_ai_auth/features/change-password/domain/entities/change_password_parameters_model.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/entities/forgot_password_parameters_model.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/entities/forgot_password_set_password_parameters.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/entities/forgot_password_verify_code_parameters.dart';
import 'package:emp_ai_auth/features/set-password/domain/entities/set_password_parameters_model.dart';

abstract class OAuthUserDataSource {
  Future<Either<AppException, OAuthMfaResponse>> oAuthLoginUser(
    OAuthParameters parameters,
  );
  Future<Either<AppException, Uri>> initOAuth(
    OAuthAuthorizationRequestParameters parameters,
  );
  Future<Either<AppException, Response>> introspectionOAuth(
    OAuthIntrospectionParameters parameters,
  );
  Future<Either<AppException, Response>> exchangeAuthCode(
    OAuthTokenParameters parameters,
  );
  Future<Either<AppException, Response>> refreshTokenOAuth(
    OAuthRefreshTokenParameters parameters,
  );
  Future<Either<AppException, Response>> oAuthPasswordLogin(
    OAuthPasswordParameters parameters,
  );
  Future<Either<AppException, Response>> oAuthLogoutUser();
  Future<Either<AppException, Response>> setPassword(
    SetPasswordParameters parameters,
  );
  Future<Either<AppException, Response>> checkCode(
    String code,
  );
  Future<Either<AppException, Response>> changePassword(
    ChangePasswordParameters parameters,
  );
  Future<Either<AppException, Response>> forgotPassword(
    ForgotPasswordParameter parameter,
  );
  Future<Either<AppException, Response>> verifyForgotPasswordCode(
    ForgotPasswordVerifyCodeParameter parameter,
  );
  Future<Either<AppException, Response>> resetPassword(
    ForgotPasswordSetPasswordParameters parameter,
  );
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
