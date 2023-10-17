import 'package:emp_ai_flutter_boilerplate/src/core/services/firestore_service/data/datasource/firestore_datasource_impl.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/data/remote/firestore_service.dart';
import 'package:emp_ai_flutter_boilerplate/src/main/data/repositories/interface_repository.dart';
import 'package:emp_ai_flutter_boilerplate/src/main/domain/repositories/interface_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FirestoreService firestoreService = FirestoreService();
final fireSourceProvider = FirestoreDataSourceImpl(firestoreService);

final interfaceRepositoryProvider = Provider<InterfaceRepository>(
  (ref) {
    return InterfaceRepositoryImpl(fireSourceProvider);
  },
);
