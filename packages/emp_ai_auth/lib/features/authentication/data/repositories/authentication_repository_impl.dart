import 'package:dartz/dartz.dart';
import 'package:emp_ai_auth/core/shared/domain/models/response.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/features/authentication/data/data_source/authentication_data_source.dart';
import 'package:emp_ai_auth/features/authentication/domain/entities/authentication_parameters_model.dart';
import 'package:emp_ai_auth/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationDataSource dataSource;

  AuthenticationRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, Response>> login(
      AuthenticationParameters parameters) {
    return dataSource.login(parameters);
  }
}
