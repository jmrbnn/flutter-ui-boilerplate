import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/exceptions/http_exception.dart';

abstract class FirestoreDataSource {
  Future<Either<AppException, DocumentReference>> addData(
    String collectionsName,
    dynamic data,
  );

  Future<Either<AppException, QuerySnapshot>> readData(
    String collectionsName,
  );

  Future<Either<AppException, dynamic>> getMiniAppConfiguration(
    String identifier,
  );

  Future<Either<AppException, DocumentReference>> readDataWhere({
    required String collectionsName,
    required String identifier,
    required String key,
  });
}
