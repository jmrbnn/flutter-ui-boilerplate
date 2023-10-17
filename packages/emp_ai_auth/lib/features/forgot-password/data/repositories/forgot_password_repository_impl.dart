import 'package:dartz/dartz.dart';
import 'package:emp_ai_auth/core/shared/domain/models/response.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/features/auth/data/datasource/oauth_data_source.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/entities/forgot_password_parameters_model.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/entities/forgot_password_set_password_parameters.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/entities/forgot_password_verify_code_parameters.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/repositories/forgot_password_repository.dart';

class ForgotPasswordRepositoryImpl extends ForgotPasswordRepository {
  final OAuthUserDataSource dataSource;

  ForgotPasswordRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, Response>> forgotPassword(
    ForgotPasswordParameter parameters,
  ) {
    return dataSource.forgotPassword(parameters);
  }

  @override
  Future<Either<AppException, Response>> verifyForgotPasswordCode(
    ForgotPasswordVerifyCodeParameter parameters,
  ) {
    return dataSource.verifyForgotPasswordCode(parameters);
  }

  @override
  Future<Either<AppException, Response>> resetPassword(
    ForgotPasswordSetPasswordParameters parameters,
  ) {
    return dataSource.resetPassword(parameters);
  }
}
