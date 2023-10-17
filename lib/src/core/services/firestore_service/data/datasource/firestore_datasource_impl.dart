import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/services/firestore_service/data/datasource/firestore_datasource.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/data/remote/firestore_service.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/exceptions/http_exception.dart';

class FirestoreDataSourceImpl extends FirestoreDataSource {
  FirestoreDataSourceImpl(this.firestoreService);

  final FirestoreService firestoreService;

  @override
  Future<Either<AppException, DocumentReference>> addData(
      String collectionsName, data) async {
    await firestoreService.db
        .collection(collectionsName)
        .add(data)
        .then((DocumentReference doc) {
      return Right(doc);
    });

    return Left(AppException(
        message: 'Couldn\'t save entry to $collectionsName',
        statusCode: 400,
        identifier: 'FirestoreDataSource.addData'));
  }

  @override
  Future<Either<AppException, QuerySnapshot>> readData(
      String collectionsName) async {
    await firestoreService.db.collection(collectionsName).get().then((event) {
      return Right(event);
    });

    return Left(AppException(
        message: 'Couldn\'t read $collectionsName',
        statusCode: 400,
        identifier: 'FirestoreDataSource.readData'));
  }

  @override
  Future<Either<AppException, DocumentReference<Object?>>> readDataWhere({
    required String collectionsName,
    required dynamic identifier,
    required String key,
  }) async {
    await firestoreService.db
        .collection(collectionsName)
        .where(key, isEqualTo: identifier)
        .get()
        .then((event) {
      return Right(event);
    });

    return Left(AppException(
        message: 'Couldn\'t read $collectionsName',
        statusCode: 400,
        identifier: 'FirestoreDataSource.readData'));
  }

  @override
  Future<Either<AppException, dynamic>> getMiniAppConfiguration(
      String identifier) async {
    String collectionsName = 'configurations';
    return await firestoreService.db
        .collection(collectionsName)
        .doc(identifier)
        .get()
        .then((event) {
      return Right(event.data());
    });

    // return Left(AppException(
    //     message: 'Couldn\'t read $collectionsName',
    //     statusCode: 400,
    //     identifier: 'FirestoreDataSource.getMiniAppConfiguration'));
  }
}
