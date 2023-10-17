import 'package:emp_ai_auth/core/shared/data/remote/network_service.dart';
import 'package:emp_ai_auth/core/shared/domain/providers/dio_network_service_provider.dart';
import 'package:emp_ai_auth/features/auth/data/datasource/oauth_data_source.dart';
import 'package:emp_ai_auth/features/auth/data/datasource/oauth_remote_data_source_impl.dart';
import 'package:emp_ai_auth/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:emp_ai_auth/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authDataSourceProvider =
    Provider.family<OAuthUserDataSource, NetworkService>(
  (_, networkService) => OAuthUserRemoteDataSource(networkService),
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    final OAuthUserDataSource dataSource =
        ref.watch(authDataSourceProvider(networkService));
    return AuthRepositoryImpl(dataSource);
  },
);
