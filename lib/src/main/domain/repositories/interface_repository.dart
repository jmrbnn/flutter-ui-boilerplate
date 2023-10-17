import 'package:dartz/dartz.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/exceptions/http_exception.dart';

abstract class InterfaceRepository {
  Future<Either<AppException, dynamic>> getAppConfiguration(
    String identifier,
  );
}
