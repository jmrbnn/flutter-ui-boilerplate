import 'package:emp_ai_auth/core/shared/data/remote/remote.dart';
import 'package:emp_ai_auth/core/shared/data/remote/network_service.dart';
import 'package:emp_ai_auth/core/shared/domain/providers/dio_network_service_provider.dart';
import 'package:emp_ai_auth/features/authentication/data/data_source/authentication_data_source.dart';
import 'package:emp_ai_auth/features/authentication/data/data_source/authentication_remote_data_source_impl.dart';
import 'package:emp_ai_auth/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:emp_ai_auth/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationSourceProvider =
    Provider.family<AuthenticationDataSource, NetworkService>(
  (_, networkService) => AuthenticationRemoteDataSource(networkService),
);

final authenticationRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    final AuthenticationDataSource dataSource =
        ref.watch(authenticationSourceProvider(networkService));
    return AuthenticationRepositoryImpl(dataSource);
  },
);
