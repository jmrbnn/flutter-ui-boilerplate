import 'package:emp_ai_auth/core/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:emp_ai_auth/core/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/providers/forgot_password_provider.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/repositories/forgot_password_repository.dart';
import 'package:emp_ai_auth/features/forgot-password/presentation/providers/state/forgot_password_notifier.dart';
import 'package:emp_ai_auth/features/forgot-password/presentation/providers/state/forgot_password_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final forgotPasswordProvider =
    StateNotifierProvider<ForgotPasswordNotifier, ForgotPasswordState>(
  (ref) {
    final ForgotPasswordRepository forgotPasswordRepository =
        ref.watch(forgotPasswordRepositoryProvider);

    final UserRepository userRepository =
        ref.watch(userLocalRepositoryProvider);
    return ForgotPasswordNotifier(
      forgotPasswordRepository: forgotPasswordRepository,
      userRepository: userRepository,
    );
  },
);
