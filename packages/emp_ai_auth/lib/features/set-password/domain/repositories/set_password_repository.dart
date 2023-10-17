import 'package:dartz/dartz.dart';
import 'package:emp_ai_auth/core/shared/domain/models/response.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/features/set-password/domain/entities/set_password_parameters_model.dart';

abstract class SetPasswordRepository {
  Future<Either<AppException, Response>> setPassword(
      SetPasswordParameters parameters);
  Future<Either<AppException, Response>> checkCode(String code);
}
