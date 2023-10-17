import 'package:emp_ai_auth/core/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:emp_ai_auth/core/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:emp_ai_auth/features/set-password/domain/providers/set_password_provider.dart';
import 'package:emp_ai_auth/features/set-password/domain/repositories/set_password_repository.dart';
import 'package:emp_ai_auth/features/set-password/presentation/providers/state/set_password_notifier.dart';
import 'package:emp_ai_auth/features/set-password/presentation/providers/state/set_password_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final setPasswordProvider =
    StateNotifierProvider<SetPasswordNotifier, SetPasswordState>(
  (ref) {
    final SetPasswordRepository setPasswordRepository =
        ref.watch(setPasswordRepositoryProvider);

    final UserRepository userRepository =
        ref.watch(userLocalRepositoryProvider);
    return SetPasswordNotifier(
      setPasswordRepository: setPasswordRepository,
      userRepository: userRepository,
    );
  },
);
