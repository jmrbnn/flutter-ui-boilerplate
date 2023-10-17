import 'package:emp_ai_auth/core/shared/data/remote/network_service.dart';
import 'package:emp_ai_auth/core/shared/domain/providers/dio_network_service_provider.dart';
import 'package:emp_ai_auth/features/auth/data/datasource/oauth_data_source.dart';
import 'package:emp_ai_auth/features/auth/data/datasource/oauth_remote_data_source_impl.dart';
import 'package:emp_ai_auth/features/change-password/data/repositories/change_password_repository_impl.dart';
import 'package:emp_ai_auth/features/change-password/domain/repositories/change_password_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final changePasswordDataSourceProvider =
    Provider.family<OAuthUserDataSource, NetworkService>(
  (_, networkService) => OAuthUserRemoteDataSource(networkService),
);

final changePasswordRepositoryProvider = Provider<ChangePasswordRepository>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    final OAuthUserDataSource dataSource =
        ref.watch(changePasswordDataSourceProvider(networkService));
    return ChangePasswordRepositoryImpl(dataSource);
  },
);
