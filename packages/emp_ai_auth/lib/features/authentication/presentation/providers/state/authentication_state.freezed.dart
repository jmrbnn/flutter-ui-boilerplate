// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkCode,
    required TResult Function() idle,
    required TResult Function() authorizing,
    required TResult Function() processing,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function() expired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkCode,
    TResult? Function()? idle,
    TResult? Function()? authorizing,
    TResult? Function()? processing,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function()? expired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkCode,
    TResult Function()? idle,
    TResult Function()? authorizing,
    TResult Function()? processing,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function()? expired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckingCode value) checkCode,
    required TResult Function(Idle value) idle,
    required TResult Function(Authorizing value) authorizing,
    required TResult Function(Processing value) processing,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Expired value) expired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckingCode value)? checkCode,
    TResult? Function(Idle value)? idle,
    TResult? Function(Authorizing value)? authorizing,
    TResult? Function(Processing value)? processing,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(Expired value)? expired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckingCode value)? checkCode,
    TResult Function(Idle value)? idle,
    TResult Function(Authorizing value)? authorizing,
    TResult Function(Processing value)? processing,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Expired value)? expired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckingCodeCopyWith<$Res> {
  factory _$$CheckingCodeCopyWith(
          _$CheckingCode value, $Res Function(_$CheckingCode) then) =
      __$$CheckingCodeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckingCodeCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$CheckingCode>
    implements _$$CheckingCodeCopyWith<$Res> {
  __$$CheckingCodeCopyWithImpl(
      _$CheckingCode _value, $Res Function(_$CheckingCode) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckingCode implements CheckingCode {
  const _$CheckingCode();

  @override
  String toString() {
    return 'AuthenticationState.checkCode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckingCode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkCode,
    required TResult Function() idle,
    required TResult Function() authorizing,
    required TResult Function() processing,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function() expired,
  }) {
    return checkCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkCode,
    TResult? Function()? idle,
    TResult? Function()? authorizing,
    TResult? Function()? processing,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function()? expired,
  }) {
    return checkCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkCode,
    TResult Function()? idle,
    TResult Function()? authorizing,
    TResult Function()? processing,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function()? expired,
    required TResult orElse(),
  }) {
    if (checkCode != null) {
      return checkCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckingCode value) checkCode,
    required TResult Function(Idle value) idle,
    required TResult Function(Authorizing value) authorizing,
    required TResult Function(Processing value) processing,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Expired value) expired,
  }) {
    return checkCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckingCode value)? checkCode,
    TResult? Function(Idle value)? idle,
    TResult? Function(Authorizing value)? authorizing,
    TResult? Function(Processing value)? processing,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(Expired value)? expired,
  }) {
    return checkCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckingCode value)? checkCode,
    TResult Function(Idle value)? idle,
    TResult Function(Authorizing value)? authorizing,
    TResult Function(Processing value)? processing,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Expired value)? expired,
    required TResult orElse(),
  }) {
    if (checkCode != null) {
      return checkCode(this);
    }
    return orElse();
  }
}

abstract class CheckingCode implements AuthenticationState {
  const factory CheckingCode() = _$CheckingCode;
}

/// @nodoc
abstract class _$$IdleCopyWith<$Res> {
  factory _$$IdleCopyWith(_$Idle value, $Res Function(_$Idle) then) =
      __$$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$Idle>
    implements _$$IdleCopyWith<$Res> {
  __$$IdleCopyWithImpl(_$Idle _value, $Res Function(_$Idle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Idle implements Idle {
  const _$Idle();

  @override
  String toString() {
    return 'AuthenticationState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkCode,
    required TResult Function() idle,
    required TResult Function() authorizing,
    required TResult Function() processing,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function() expired,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkCode,
    TResult? Function()? idle,
    TResult? Function()? authorizing,
    TResult? Function()? processing,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function()? expired,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkCode,
    TResult Function()? idle,
    TResult Function()? authorizing,
    TResult Function()? processing,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function()? expired,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckingCode value) checkCode,
    required TResult Function(Idle value) idle,
    required TResult Function(Authorizing value) authorizing,
    required TResult Function(Processing value) processing,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Expired value) expired,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckingCode value)? checkCode,
    TResult? Function(Idle value)? idle,
    TResult? Function(Authorizing value)? authorizing,
    TResult? Function(Processing value)? processing,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(Expired value)? expired,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckingCode value)? checkCode,
    TResult Function(Idle value)? idle,
    TResult Function(Authorizing value)? authorizing,
    TResult Function(Processing value)? processing,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Expired value)? expired,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements AuthenticationState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class _$$AuthorizingCopyWith<$Res> {
  factory _$$AuthorizingCopyWith(
          _$Authorizing value, $Res Function(_$Authorizing) then) =
      __$$AuthorizingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthorizingCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$Authorizing>
    implements _$$AuthorizingCopyWith<$Res> {
  __$$AuthorizingCopyWithImpl(
      _$Authorizing _value, $Res Function(_$Authorizing) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Authorizing implements Authorizing {
  const _$Authorizing();

  @override
  String toString() {
    return 'AuthenticationState.authorizing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Authorizing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkCode,
    required TResult Function() idle,
    required TResult Function() authorizing,
    required TResult Function() processing,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function() expired,
  }) {
    return authorizing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkCode,
    TResult? Function()? idle,
    TResult? Function()? authorizing,
    TResult? Function()? processing,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function()? expired,
  }) {
    return authorizing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkCode,
    TResult Function()? idle,
    TResult Function()? authorizing,
    TResult Function()? processing,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function()? expired,
    required TResult orElse(),
  }) {
    if (authorizing != null) {
      return authorizing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckingCode value) checkCode,
    required TResult Function(Idle value) idle,
    required TResult Function(Authorizing value) authorizing,
    required TResult Function(Processing value) processing,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Expired value) expired,
  }) {
    return authorizing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckingCode value)? checkCode,
    TResult? Function(Idle value)? idle,
    TResult? Function(Authorizing value)? authorizing,
    TResult? Function(Processing value)? processing,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(Expired value)? expired,
  }) {
    return authorizing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckingCode value)? checkCode,
    TResult Function(Idle value)? idle,
    TResult Function(Authorizing value)? authorizing,
    TResult Function(Processing value)? processing,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Expired value)? expired,
    required TResult orElse(),
  }) {
    if (authorizing != null) {
      return authorizing(this);
    }
    return orElse();
  }
}

abstract class Authorizing implements AuthenticationState {
  const factory Authorizing() = _$Authorizing;
}

/// @nodoc
abstract class _$$ProcessingCopyWith<$Res> {
  factory _$$ProcessingCopyWith(
          _$Processing value, $Res Function(_$Processing) then) =
      __$$ProcessingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessingCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$Processing>
    implements _$$ProcessingCopyWith<$Res> {
  __$$ProcessingCopyWithImpl(
      _$Processing _value, $Res Function(_$Processing) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Processing implements Processing {
  const _$Processing();

  @override
  String toString() {
    return 'AuthenticationState.processing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Processing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkCode,
    required TResult Function() idle,
    required TResult Function() authorizing,
    required TResult Function() processing,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function() expired,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkCode,
    TResult? Function()? idle,
    TResult? Function()? authorizing,
    TResult? Function()? processing,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function()? expired,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkCode,
    TResult Function()? idle,
    TResult Function()? authorizing,
    TResult Function()? processing,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function()? expired,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckingCode value) checkCode,
    required TResult Function(Idle value) idle,
    required TResult Function(Authorizing value) authorizing,
    required TResult Function(Processing value) processing,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Expired value) expired,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckingCode value)? checkCode,
    TResult? Function(Idle value)? idle,
    TResult? Function(Authorizing value)? authorizing,
    TResult? Function(Processing value)? processing,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(Expired value)? expired,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckingCode value)? checkCode,
    TResult Function(Idle value)? idle,
    TResult Function(Authorizing value)? authorizing,
    TResult Function(Processing value)? processing,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Expired value)? expired,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class Processing implements AuthenticationState {
  const factory Processing() = _$Processing;
}

/// @nodoc
abstract class _$$FailureCopyWith<$Res> {
  factory _$$FailureCopyWith(_$Failure value, $Res Function(_$Failure) then) =
      __$$FailureCopyWithImpl<$Res>;
  @useResult
  $Res call({AppException exception});
}

/// @nodoc
class __$$FailureCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$Failure>
    implements _$$FailureCopyWith<$Res> {
  __$$FailureCopyWithImpl(_$Failure _value, $Res Function(_$Failure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$Failure(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }
}

/// @nodoc

class _$Failure implements Failure {
  const _$Failure(this.exception);

  @override
  final AppException exception;

  @override
  String toString() {
    return 'AuthenticationState.failure(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Failure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureCopyWith<_$Failure> get copyWith =>
      __$$FailureCopyWithImpl<_$Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkCode,
    required TResult Function() idle,
    required TResult Function() authorizing,
    required TResult Function() processing,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function() expired,
  }) {
    return failure(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkCode,
    TResult? Function()? idle,
    TResult? Function()? authorizing,
    TResult? Function()? processing,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function()? expired,
  }) {
    return failure?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkCode,
    TResult Function()? idle,
    TResult Function()? authorizing,
    TResult Function()? processing,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function()? expired,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckingCode value) checkCode,
    required TResult Function(Idle value) idle,
    required TResult Function(Authorizing value) authorizing,
    required TResult Function(Processing value) processing,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Expired value) expired,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckingCode value)? checkCode,
    TResult? Function(Idle value)? idle,
    TResult? Function(Authorizing value)? authorizing,
    TResult? Function(Processing value)? processing,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(Expired value)? expired,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckingCode value)? checkCode,
    TResult Function(Idle value)? idle,
    TResult Function(Authorizing value)? authorizing,
    TResult Function(Processing value)? processing,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Expired value)? expired,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements AuthenticationState {
  const factory Failure(final AppException exception) = _$Failure;

  AppException get exception;
  @JsonKey(ignore: true)
  _$$FailureCopyWith<_$Failure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String statusCode, String? message});
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$Error>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = freezed,
  }) {
    return _then(_$Error(
      null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error(this.statusCode, this.message);

  @override
  final String statusCode;
  @override
  final String? message;

  @override
  String toString() {
    return 'AuthenticationState.error(statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkCode,
    required TResult Function() idle,
    required TResult Function() authorizing,
    required TResult Function() processing,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function() expired,
  }) {
    return error(statusCode, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkCode,
    TResult? Function()? idle,
    TResult? Function()? authorizing,
    TResult? Function()? processing,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function()? expired,
  }) {
    return error?.call(statusCode, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkCode,
    TResult Function()? idle,
    TResult Function()? authorizing,
    TResult Function()? processing,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function()? expired,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(statusCode, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckingCode value) checkCode,
    required TResult Function(Idle value) idle,
    required TResult Function(Authorizing value) authorizing,
    required TResult Function(Processing value) processing,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Expired value) expired,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckingCode value)? checkCode,
    TResult? Function(Idle value)? idle,
    TResult? Function(Authorizing value)? authorizing,
    TResult? Function(Processing value)? processing,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(Expired value)? expired,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckingCode value)? checkCode,
    TResult Function(Idle value)? idle,
    TResult Function(Authorizing value)? authorizing,
    TResult Function(Processing value)? processing,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Expired value)? expired,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements AuthenticationState {
  const factory Error(final String statusCode, final String? message) = _$Error;

  String get statusCode;
  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessCopyWith<$Res> {
  factory _$$SuccessCopyWith(_$Success value, $Res Function(_$Success) then) =
      __$$SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic data});
}

/// @nodoc
class __$$SuccessCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$Success>
    implements _$$SuccessCopyWith<$Res> {
  __$$SuccessCopyWithImpl(_$Success _value, $Res Function(_$Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Success(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$Success implements Success {
  const _$Success({this.data});

  @override
  final dynamic data;

  @override
  String toString() {
    return 'AuthenticationState.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessCopyWith<_$Success> get copyWith =>
      __$$SuccessCopyWithImpl<_$Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkCode,
    required TResult Function() idle,
    required TResult Function() authorizing,
    required TResult Function() processing,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function() expired,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkCode,
    TResult? Function()? idle,
    TResult? Function()? authorizing,
    TResult? Function()? processing,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function()? expired,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkCode,
    TResult Function()? idle,
    TResult Function()? authorizing,
    TResult Function()? processing,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function()? expired,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckingCode value) checkCode,
    required TResult Function(Idle value) idle,
    required TResult Function(Authorizing value) authorizing,
    required TResult Function(Processing value) processing,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Expired value) expired,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckingCode value)? checkCode,
    TResult? Function(Idle value)? idle,
    TResult? Function(Authorizing value)? authorizing,
    TResult? Function(Processing value)? processing,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(Expired value)? expired,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckingCode value)? checkCode,
    TResult Function(Idle value)? idle,
    TResult Function(Authorizing value)? authorizing,
    TResult Function(Processing value)? processing,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Expired value)? expired,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements AuthenticationState {
  const factory Success({final dynamic data}) = _$Success;

  dynamic get data;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<_$Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExpiredCopyWith<$Res> {
  factory _$$ExpiredCopyWith(_$Expired value, $Res Function(_$Expired) then) =
      __$$ExpiredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExpiredCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$Expired>
    implements _$$ExpiredCopyWith<$Res> {
  __$$ExpiredCopyWithImpl(_$Expired _value, $Res Function(_$Expired) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Expired implements Expired {
  const _$Expired();

  @override
  String toString() {
    return 'AuthenticationState.expired()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Expired);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkCode,
    required TResult Function() idle,
    required TResult Function() authorizing,
    required TResult Function() processing,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function() expired,
  }) {
    return expired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkCode,
    TResult? Function()? idle,
    TResult? Function()? authorizing,
    TResult? Function()? processing,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function()? expired,
  }) {
    return expired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkCode,
    TResult Function()? idle,
    TResult Function()? authorizing,
    TResult Function()? processing,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function()? expired,
    required TResult orElse(),
  }) {
    if (expired != null) {
      return expired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckingCode value) checkCode,
    required TResult Function(Idle value) idle,
    required TResult Function(Authorizing value) authorizing,
    required TResult Function(Processing value) processing,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(Expired value) expired,
  }) {
    return expired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckingCode value)? checkCode,
    TResult? Function(Idle value)? idle,
    TResult? Function(Authorizing value)? authorizing,
    TResult? Function(Processing value)? processing,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(Expired value)? expired,
  }) {
    return expired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckingCode value)? checkCode,
    TResult Function(Idle value)? idle,
    TResult Function(Authorizing value)? authorizing,
    TResult Function(Processing value)? processing,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(Expired value)? expired,
    required TResult orElse(),
  }) {
    if (expired != null) {
      return expired(this);
    }
    return orElse();
  }
}

abstract class Expired implements AuthenticationState {
  const factory Expired() = _$Expired;
}
