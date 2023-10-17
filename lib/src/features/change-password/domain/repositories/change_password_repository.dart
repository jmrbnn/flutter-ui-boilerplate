import 'package:dartz/dartz.dart';
import 'package:emp_ai_auth/core/shared/domain/models/response.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/features/change-password/domain/entities/change_password_parameters_model.dart';

abstract class ChangePasswordRepository {
  Future<Either<AppException, Response>> changePassword(
      ChangePasswordParameters parameters);
}
