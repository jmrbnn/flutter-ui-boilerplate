import 'package:dartz/dartz.dart';
import 'package:emp_ai_auth/core/shared/domain/models/response.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/features/auth/data/datasource/oauth_data_source.dart';
import 'package:emp_ai_auth/features/set-password/domain/entities/set_password_parameters_model.dart';
import 'package:emp_ai_auth/features/set-password/domain/repositories/set_password_repository.dart';

class SetPasswordRepositoryImpl extends SetPasswordRepository {
  final OAuthUserDataSource dataSource;

  SetPasswordRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, Response>> setPassword(
      SetPasswordParameters parameters) {
    return dataSource.setPassword(parameters);
  }

  @override
  Future<Either<AppException, Response>> checkCode(String code) {
    return dataSource.checkCode(code);
  }
}
