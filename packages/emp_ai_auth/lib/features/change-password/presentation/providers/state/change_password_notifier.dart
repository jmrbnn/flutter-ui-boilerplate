import 'package:emp_ai_auth/core/shared/identity_infrastructure/credentials_storage/credentials_storage.dart';
import 'package:emp_ai_auth/features/change-password/domain/entities/change_password_parameters_model.dart';
import 'package:emp_ai_auth/features/change-password/domain/repositories/change_password_repository.dart';
import 'package:emp_ai_auth/features/change-password/presentation/providers/state/change_password_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauth2/oauth2.dart';

class ChangePasswordNotifier extends StateNotifier<ChangePasswordState> {
  final ChangePasswordRepository changePasswordRepository;
  // final UserRepository userRepository;
  final CredentialsStorage credentialsStorage;

  ChangePasswordNotifier({
    required this.changePasswordRepository,
    // required this.userRepository,
    required this.credentialsStorage,
  }) : super(const ChangePasswordState.idle());

  Future<void> changePassword(password, newPassword, {String? username}) async {
    state = const ChangePasswordState.processing();

    Credentials? creds = await credentialsStorage.read();
    ChangePasswordParameters parameters = ChangePasswordParameters(
      username: username,
      currentPassword: password,
      password: newPassword,
      accessToken: creds?.accessToken,
    );
    var response = await changePasswordRepository.changePassword(parameters);

    state = await response.fold(
      (failure) => ChangePasswordState.failure(failure),
      (response) => ChangePasswordState.success(data: response.data['result']),
    );
  }
}
