import 'package:emp_ai_auth/core/shared/data/remote/remote.dart';
import 'package:emp_ai_auth/core/shared/data/remote/network_service.dart';
import 'package:emp_ai_auth/core/shared/domain/providers/dio_network_service_provider.dart';
import 'package:emp_ai_auth/features/auth/data/datasource/oauth_data_source.dart';
import 'package:emp_ai_auth/features/auth/data/datasource/oauth_remote_data_source_impl.dart';
import 'package:emp_ai_auth/features/set-password/data/repositories/set_password_repository_impl.dart';
import 'package:emp_ai_auth/features/set-password/domain/repositories/set_password_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final setPassworddataSourceProvider =
    Provider.family<OAuthUserDataSource, NetworkService>(
  (_, networkService) => OAuthUserRemoteDataSource(networkService),
);

final setPasswordRepositoryProvider = Provider<SetPasswordRepository>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    final OAuthUserDataSource dataSource =
        ref.watch(setPassworddataSourceProvider(networkService));
    return SetPasswordRepositoryImpl(dataSource);
  },
);
