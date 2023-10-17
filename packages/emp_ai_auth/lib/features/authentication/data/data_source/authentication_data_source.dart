import 'package:dartz/dartz.dart';
import 'package:emp_ai_auth/core/shared/domain/models/response.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/features/authentication/domain/entities/authentication_parameters_model.dart';

abstract class AuthenticationDataSource {
  Future<Either<AppException, Response>> login(
    AuthenticationParameters parameters,
  );
}
