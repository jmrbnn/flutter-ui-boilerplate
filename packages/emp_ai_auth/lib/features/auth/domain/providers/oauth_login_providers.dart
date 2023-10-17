import 'package:emp_ai_auth/core/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:emp_ai_auth/core/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:emp_ai_auth/core/shared/data/remote/network_service.dart';
import 'package:emp_ai_auth/core/shared/domain/providers/dio_network_service_provider.dart';
import 'package:emp_ai_auth/features/auth/data/datasource/oauth_data_source.dart';
import 'package:emp_ai_auth/features/auth/data/datasource/oauth_remote_data_source_impl.dart';
import 'package:emp_ai_auth/features/auth/data/repositories/oauth_repository_impl.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_notifier.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_state.dart';
import 'package:emp_ai_auth/features/auth/domain/repositories/oauth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Map<String, String> getUriParameters() {
  final uri = Uri.dataFromString(Uri.base.toString());
  return uri.queryParameters;
}

final oAuthdataSourceProvider =
    Provider.family<OAuthUserDataSource, NetworkService>(
  (_, networkService) => OAuthUserRemoteDataSource(networkService),
);

final oAuthRepositoryProvider = Provider<OAuthenticationRepository>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    final OAuthUserDataSource dataSource =
        ref.watch(oAuthdataSourceProvider(networkService));
    return OAuthenticationRepositoryImpl(dataSource);
  },
);

final oAuthStateNotifierProvider =
    StateNotifierProvider<OAuthNotifier, OAuthState>(
  (ref) {
    final OAuthenticationRepository authenticationRepository =
        ref.watch(oAuthRepositoryProvider);
    final UserRepository userRepository =
        ref.watch(userLocalRepositoryProvider);
    return OAuthNotifier(
      authRepository: authenticationRepository,
      userRepository: userRepository,
    );
  },
);
