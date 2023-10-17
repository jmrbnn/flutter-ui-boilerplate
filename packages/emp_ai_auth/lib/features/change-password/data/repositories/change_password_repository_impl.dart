import 'package:dartz/dartz.dart';
import 'package:emp_ai_auth/core/shared/domain/models/response.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/features/auth/data/datasource/oauth_data_source.dart';
import 'package:emp_ai_auth/features/change-password/domain/entities/change_password_parameters_model.dart';
import 'package:emp_ai_auth/features/change-password/domain/repositories/change_password_repository.dart';

class ChangePasswordRepositoryImpl extends ChangePasswordRepository {
  final OAuthUserDataSource dataSource;

  ChangePasswordRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, Response>> changePassword(
      ChangePasswordParameters parameters) {
    return dataSource.changePassword(parameters);
  }
}
