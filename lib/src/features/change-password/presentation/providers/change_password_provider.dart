import 'package:emp_ai_auth/core/shared/identity_infrastructure/credentials_storage/credentials_storage.dart';
import 'package:emp_ai_auth/features/auth/shared/auth_providers.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/change-password/domain/providers/change_password_provider.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/change-password/domain/repositories/change_password_repository.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/change-password/presentation/providers/state/change_password_notifier.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/change-password/presentation/providers/state/change_password_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final changePasswordProvider =
    StateNotifierProvider<ChangePasswordNotifier, ChangePasswordState>(
  (ref) {
    final ChangePasswordRepository changePasswordRepository =
        ref.watch(changePasswordRepositoryProvider);

    // final UserRepository userRepository =
    //     ref.watch(userLocalRepositoryProvider);

    final CredentialsStorage credentialsStorage =
        ref.watch(credentialsStorageProvider);
    return ChangePasswordNotifier(
      changePasswordRepository: changePasswordRepository,
      // userRepository: userRepository,
      credentialsStorage: credentialsStorage,
    );
  },
);
