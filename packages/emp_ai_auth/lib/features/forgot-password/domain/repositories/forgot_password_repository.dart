import 'package:dartz/dartz.dart';
import 'package:emp_ai_auth/core/shared/domain/models/response.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/entities/forgot_password_parameters_model.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/entities/forgot_password_set_password_parameters.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/entities/forgot_password_verify_code_parameters.dart';

abstract class ForgotPasswordRepository {
  Future<Either<AppException, Response>> forgotPassword(
    ForgotPasswordParameter parameters,
  );
  Future<Either<AppException, Response>> verifyForgotPasswordCode(
    ForgotPasswordVerifyCodeParameter parameters,
  );
  Future<Either<AppException, Response>> resetPassword(
    ForgotPasswordSetPasswordParameters parameters,
  );
}
