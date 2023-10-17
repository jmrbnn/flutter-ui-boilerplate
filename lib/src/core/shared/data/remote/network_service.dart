import 'package:dartz/dartz.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/domain/models/response.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/exceptions/http_exception.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<bool, bool>> openUrl(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, Response>> post(
    String endpoint, {
    dynamic data,
  });

  Future<Either<AppException, Response>> patch(
    String endpoint, {
    dynamic data,
  });

  Future<Either<AppException, Response>> put(
    String endpoint, {
    dynamic data,
  });

  Future<Either<AppException, Response>> delete(
    String endpoint, {
    Map<String, dynamic> data,
  });
}
