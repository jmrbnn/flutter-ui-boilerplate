import 'package:dartz/dartz.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/services/firestore_service/data/datasource/firestore_datasource.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_flutter_boilerplate/src/main/domain/repositories/interface_repository.dart';

class InterfaceRepositoryImpl extends InterfaceRepository {
  final FirestoreDataSource dataSource;

  InterfaceRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, dynamic>> getAppConfiguration(
      String identifier) async {
    return await dataSource.getMiniAppConfiguration(identifier);
  }
}
