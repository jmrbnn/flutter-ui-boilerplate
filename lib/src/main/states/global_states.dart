// ignore_for_file: depend_on_referenced_packages

import 'package:emp_ai_flutter_boilerplate/src/core/shared/exceptions/http_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_states.freezed.dart';

@freezed
abstract class GlobalAppState with _$GlobalAppState {
  const factory GlobalAppState.idle() = Idle;
  const factory GlobalAppState.initial() = Initial;
  const factory GlobalAppState.loading() = Loading;
  const factory GlobalAppState.failure(AppException exception) = Failure;
  const factory GlobalAppState.success({dynamic data}) = Success;
}
