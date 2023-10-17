// ignore_for_file: depend_on_referenced_packages

import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_password_state.freezed.dart';

@freezed
abstract class SetPasswordState with _$SetPasswordState {
  const factory SetPasswordState.checkCode() = CheckingCode;
  const factory SetPasswordState.idle() = Idle;
  const factory SetPasswordState.processing() = Processing;
  const factory SetPasswordState.failure(AppException exception) = Failure;
  const factory SetPasswordState.error(String statusCode, String? message) =
      Error;
  const factory SetPasswordState.success({dynamic data}) = Success;
  const factory SetPasswordState.expired() = Expired;
}
