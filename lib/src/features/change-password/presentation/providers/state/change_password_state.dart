// ignore_for_file: depend_on_referenced_packages

import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_state.freezed.dart';

@freezed
abstract class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState.idle() = Idle;
  const factory ChangePasswordState.processing() = Processing;
  const factory ChangePasswordState.failure(AppException exception) = Failure;
  const factory ChangePasswordState.error(String statusCode, String? message) =
      Error;
  const factory ChangePasswordState.success({dynamic data}) = Success;
  const factory ChangePasswordState.expired() = Expired;
}
