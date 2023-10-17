import 'package:emp_ai_auth/core/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:emp_ai_auth/core/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:emp_ai_auth/features/authentication/domain/providers/authentication_provider.dart';
import 'package:emp_ai_auth/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:emp_ai_auth/features/authentication/presentation/providers/state/authentication_notifier.dart';
import 'package:emp_ai_auth/features/authentication/presentation/providers/state/authentication_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationProvider =
    StateNotifierProvider<AuthenticationNotifier, AuthenticationState>(
  (ref) {
    final AuthenticationRepository authenticationRepository =
        ref.watch(authenticationRepositoryProvider);

    final UserRepository userRepository =
        ref.watch(userLocalRepositoryProvider);
    return AuthenticationNotifier(
      authenticationRepository: authenticationRepository,
      userRepository: userRepository,
    );
  },
);
