import 'package:emp_ai_auth/core/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:emp_ai_auth/features/set-password/domain/entities/set_password_parameters_model.dart';
import 'package:emp_ai_auth/features/set-password/domain/repositories/set_password_repository.dart';
import 'package:emp_ai_auth/features/set-password/presentation/providers/state/set_password_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SetPasswordVerificationType {
  link('link'),
  code('code');

  const SetPasswordVerificationType(this.label);
  final String label;
}

class SetPasswordNotifier extends StateNotifier<SetPasswordState> {
  final SetPasswordRepository setPasswordRepository;
  final UserRepository userRepository;

  SetPasswordNotifier({
    required this.setPasswordRepository,
    required this.userRepository,
  }) : super(const SetPasswordState.checkCode());

  Future<void> setPassword(password, code, {String? username}) async {
    state = const SetPasswordState.processing();
    SetPasswordParameters parameters = SetPasswordParameters(
      verificationType: SetPasswordVerificationType.link.label,
      code: code,
      username: username,
      password: password,
    );
    var response = await setPasswordRepository.setPassword(parameters);

    state = await response.fold(
      (failure) => SetPasswordState.failure(failure),
      (response) => SetPasswordState.success(data: response.data['result']),
    );
  }

  Future<void> checkCode(String code) async {
    state = const SetPasswordState.checkCode();

    var response = await setPasswordRepository.checkCode(code);

    Future.delayed(const Duration(seconds: 2), () async {
      state = await response.fold(
        (failure) => SetPasswordState.failure(failure),
        (response) => const SetPasswordState.idle(),
      );
    });
  }
}
