// ignore_for_file: depend_on_referenced_packages

import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

@freezed
abstract class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.checkCode() = CheckingCode;
  const factory AuthenticationState.idle() = Idle;
  const factory AuthenticationState.authorizing() = Authorizing;
  const factory AuthenticationState.processing() = Processing;
  const factory AuthenticationState.failure(AppException exception) = Failure;
  const factory AuthenticationState.error(String statusCode, String? message) =
      Error;
  const factory AuthenticationState.success({dynamic data}) = Success;
  const factory AuthenticationState.expired() = Expired;
}
