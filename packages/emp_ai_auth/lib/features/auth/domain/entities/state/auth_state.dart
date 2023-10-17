// ignore_for_file: depend_on_referenced_packages

import 'package:emp_ai_auth/core/shared/identity_infrastructure/entities/identity_introspect.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/failure/auth_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  // const factory AuthState.loading() = Loading;
  const factory AuthState.authorizing() = Authorizing;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.error(String statusCode, String? message) = Error;
  const factory AuthState.authenticated(IdentityInstrospect? identity) =
      Authenticated;
  const factory AuthState.failed({required AuthFailure? failure}) = Failed;
}
