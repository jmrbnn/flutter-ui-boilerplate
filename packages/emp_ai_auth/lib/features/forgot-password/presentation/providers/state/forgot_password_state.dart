// ignore_for_file: depend_on_referenced_packages

import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';

@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.idle({
    AppException? exception,
    bool? isLoading,
  }) = Idle;

  const factory ForgotPasswordState.inputCode({
    required String username,
    AppException? exception,
    bool? isLoading,
  }) = InputCode;
  const factory ForgotPasswordState.verifyCode({AppException? exception}) =
      VerifyCode;
  const factory ForgotPasswordState.inputPasswords({
    required String code,
    required String username,
    AppException? exception,
    bool? isLoading,
  }) = InputPasswords;

  const factory ForgotPasswordState.processing() = Processing;

  const factory ForgotPasswordState.success({dynamic data}) = Success;
  const factory ForgotPasswordState.failure(AppException exception) = Failure;

  const factory ForgotPasswordState.expired() = Expired;
  const factory ForgotPasswordState.error(String statusCode, String? message) =
      Error;
}
