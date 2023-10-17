import 'package:emp_ai_auth/core/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:emp_ai_auth/core/shared/domain/models/response.dart';
import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/entities/forgot_password_parameters_model.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/entities/forgot_password_set_password_parameters.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/entities/forgot_password_verify_code_parameters.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/repositories/forgot_password_repository.dart';
import 'package:emp_ai_auth/features/forgot-password/presentation/providers/state/forgot_password_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordNotifier extends StateNotifier<ForgotPasswordState> {
  final ForgotPasswordRepository forgotPasswordRepository;
  final UserRepository userRepository;

  ForgotPasswordNotifier({
    required this.forgotPasswordRepository,
    required this.userRepository,
  }) : super(const ForgotPasswordState.idle());

  final authInstance = EmpAuth.instance;

  void reset() {
    state = const ForgotPasswordState.idle();
  }

  Future<void> forgotPassword(
    String username,
    Function(Response response) onSuccess,
  ) async {
    // state = const ForgotPasswordState.processing();
    ForgotPasswordParameter parameters = ForgotPasswordParameter(
      clientId: authInstance.clientId,
      username: username,
    );
    var response = await forgotPasswordRepository.forgotPassword(parameters);

    state = await response.fold(
      (failure) {
        GeneralUtils.isolateDebug(state is Idle);
        return state is Idle
            ? ForgotPasswordState.idle(
                exception: failure,
              )
            : ForgotPasswordState.failure(failure);
      },
      (response) => ForgotPasswordState.inputCode(username: username),
    );
  }

  Future<void> verifyCode(
    String code,
    String username,
  ) async {
    // state = const ForgotPasswordState.processing();
    ForgotPasswordVerifyCodeParameter parameters =
        ForgotPasswordVerifyCodeParameter(
      code: code,
      username: username,
    );
    var response =
        await forgotPasswordRepository.verifyForgotPasswordCode(parameters);

    state = await response.fold(
      (failure) {
        GeneralUtils.isolateDebug(state is InputCode);
        return state is InputCode
            ? ForgotPasswordState.inputCode(
                username: username,
                exception: failure,
              )
            : ForgotPasswordState.failure(failure);
      },
      (response) => ForgotPasswordState.inputPasswords(
        username: username,
        code: code,
      ),
    );
  }

  Future<void> resetPassword(
    String code,
    String username,
    String password,
  ) async {
    // state = const ForgotPasswordState.processing();
    ForgotPasswordSetPasswordParameters parameters =
        ForgotPasswordSetPasswordParameters(
      code: code,
      username: username,
      password: password,
    );
    var response = await forgotPasswordRepository.resetPassword(parameters);

    state = await response.fold(
      (failure) {
        GeneralUtils.isolateDebug(state is InputPasswords);
        return state is InputPasswords
            ? ForgotPasswordState.inputPasswords(
                code: code,
                username: username,
                exception: failure,
              )
            : ForgotPasswordState.failure(failure);
      },
      (response) => ForgotPasswordState.success(data: response.data),
    );
  }
}
