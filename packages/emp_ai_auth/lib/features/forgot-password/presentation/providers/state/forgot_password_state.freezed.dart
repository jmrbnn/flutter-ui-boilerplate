// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForgotPasswordState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppException? exception, bool? isLoading) idle,
    required TResult Function(
            String username, AppException? exception, bool? isLoading)
        inputCode,
    required TResult Function(AppException? exception) verifyCode,
    required TResult Function(String code, String username,
            AppException? exception, bool? isLoading)
        inputPasswords,
    required TResult Function() processing,
    required TResult Function(dynamic data) success,
    required TResult Function(AppException exception) failure,
    required TResult Function() expired,
    required TResult Function(String statusCode, String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppException? exception, bool? isLoading)? idle,
    TResult? Function(
            String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult? Function(AppException? exception)? verifyCode,
    TResult? Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult? Function()? processing,
    TResult? Function(dynamic data)? success,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? expired,
    TResult? Function(String statusCode, String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppException? exception, bool? isLoading)? idle,
    TResult Function(String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult Function(AppException? exception)? verifyCode,
    TResult Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult Function()? processing,
    TResult Function(dynamic data)? success,
    TResult Function(AppException exception)? failure,
    TResult Function()? expired,
    TResult Function(String statusCode, String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(InputCode value) inputCode,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(InputPasswords value) inputPasswords,
    required TResult Function(Processing value) processing,
    required TResult Function(Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(Expired value) expired,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(InputCode value)? inputCode,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(InputPasswords value)? inputPasswords,
    TResult? Function(Processing value)? processing,
    TResult? Function(Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(Expired value)? expired,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(InputCode value)? inputCode,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(InputPasswords value)? inputPasswords,
    TResult Function(Processing value)? processing,
    TResult Function(Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(Expired value)? expired,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
          ForgotPasswordState value, $Res Function(ForgotPasswordState) then) =
      _$ForgotPasswordStateCopyWithImpl<$Res, ForgotPasswordState>;
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res, $Val extends ForgotPasswordState>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleCopyWith<$Res> {
  factory _$$IdleCopyWith(_$Idle value, $Res Function(_$Idle) then) =
      __$$IdleCopyWithImpl<$Res>;
  @useResult
  $Res call({AppException? exception, bool? isLoading});
}

/// @nodoc
class __$$IdleCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$Idle>
    implements _$$IdleCopyWith<$Res> {
  __$$IdleCopyWithImpl(_$Idle _value, $Res Function(_$Idle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$Idle(
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException?,
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$Idle implements Idle {
  const _$Idle({this.exception, this.isLoading});

  @override
  final AppException? exception;
  @override
  final bool? isLoading;

  @override
  String toString() {
    return 'ForgotPasswordState.idle(exception: $exception, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Idle &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdleCopyWith<_$Idle> get copyWith =>
      __$$IdleCopyWithImpl<_$Idle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppException? exception, bool? isLoading) idle,
    required TResult Function(
            String username, AppException? exception, bool? isLoading)
        inputCode,
    required TResult Function(AppException? exception) verifyCode,
    required TResult Function(String code, String username,
            AppException? exception, bool? isLoading)
        inputPasswords,
    required TResult Function() processing,
    required TResult Function(dynamic data) success,
    required TResult Function(AppException exception) failure,
    required TResult Function() expired,
    required TResult Function(String statusCode, String? message) error,
  }) {
    return idle(exception, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppException? exception, bool? isLoading)? idle,
    TResult? Function(
            String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult? Function(AppException? exception)? verifyCode,
    TResult? Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult? Function()? processing,
    TResult? Function(dynamic data)? success,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? expired,
    TResult? Function(String statusCode, String? message)? error,
  }) {
    return idle?.call(exception, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppException? exception, bool? isLoading)? idle,
    TResult Function(String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult Function(AppException? exception)? verifyCode,
    TResult Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult Function()? processing,
    TResult Function(dynamic data)? success,
    TResult Function(AppException exception)? failure,
    TResult Function()? expired,
    TResult Function(String statusCode, String? message)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(exception, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(InputCode value) inputCode,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(InputPasswords value) inputPasswords,
    required TResult Function(Processing value) processing,
    required TResult Function(Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(Expired value) expired,
    required TResult Function(Error value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(InputCode value)? inputCode,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(InputPasswords value)? inputPasswords,
    TResult? Function(Processing value)? processing,
    TResult? Function(Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(Expired value)? expired,
    TResult? Function(Error value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(InputCode value)? inputCode,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(InputPasswords value)? inputPasswords,
    TResult Function(Processing value)? processing,
    TResult Function(Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(Expired value)? expired,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements ForgotPasswordState {
  const factory Idle({final AppException? exception, final bool? isLoading}) =
      _$Idle;

  AppException? get exception;
  bool? get isLoading;
  @JsonKey(ignore: true)
  _$$IdleCopyWith<_$Idle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InputCodeCopyWith<$Res> {
  factory _$$InputCodeCopyWith(
          _$InputCode value, $Res Function(_$InputCode) then) =
      __$$InputCodeCopyWithImpl<$Res>;
  @useResult
  $Res call({String username, AppException? exception, bool? isLoading});
}

/// @nodoc
class __$$InputCodeCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$InputCode>
    implements _$$InputCodeCopyWith<$Res> {
  __$$InputCodeCopyWithImpl(
      _$InputCode _value, $Res Function(_$InputCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? exception = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$InputCode(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException?,
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$InputCode implements InputCode {
  const _$InputCode({required this.username, this.exception, this.isLoading});

  @override
  final String username;
  @override
  final AppException? exception;
  @override
  final bool? isLoading;

  @override
  String toString() {
    return 'ForgotPasswordState.inputCode(username: $username, exception: $exception, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputCode &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, exception, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InputCodeCopyWith<_$InputCode> get copyWith =>
      __$$InputCodeCopyWithImpl<_$InputCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppException? exception, bool? isLoading) idle,
    required TResult Function(
            String username, AppException? exception, bool? isLoading)
        inputCode,
    required TResult Function(AppException? exception) verifyCode,
    required TResult Function(String code, String username,
            AppException? exception, bool? isLoading)
        inputPasswords,
    required TResult Function() processing,
    required TResult Function(dynamic data) success,
    required TResult Function(AppException exception) failure,
    required TResult Function() expired,
    required TResult Function(String statusCode, String? message) error,
  }) {
    return inputCode(username, exception, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppException? exception, bool? isLoading)? idle,
    TResult? Function(
            String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult? Function(AppException? exception)? verifyCode,
    TResult? Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult? Function()? processing,
    TResult? Function(dynamic data)? success,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? expired,
    TResult? Function(String statusCode, String? message)? error,
  }) {
    return inputCode?.call(username, exception, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppException? exception, bool? isLoading)? idle,
    TResult Function(String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult Function(AppException? exception)? verifyCode,
    TResult Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult Function()? processing,
    TResult Function(dynamic data)? success,
    TResult Function(AppException exception)? failure,
    TResult Function()? expired,
    TResult Function(String statusCode, String? message)? error,
    required TResult orElse(),
  }) {
    if (inputCode != null) {
      return inputCode(username, exception, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(InputCode value) inputCode,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(InputPasswords value) inputPasswords,
    required TResult Function(Processing value) processing,
    required TResult Function(Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(Expired value) expired,
    required TResult Function(Error value) error,
  }) {
    return inputCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(InputCode value)? inputCode,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(InputPasswords value)? inputPasswords,
    TResult? Function(Processing value)? processing,
    TResult? Function(Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(Expired value)? expired,
    TResult? Function(Error value)? error,
  }) {
    return inputCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(InputCode value)? inputCode,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(InputPasswords value)? inputPasswords,
    TResult Function(Processing value)? processing,
    TResult Function(Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(Expired value)? expired,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (inputCode != null) {
      return inputCode(this);
    }
    return orElse();
  }
}

abstract class InputCode implements ForgotPasswordState {
  const factory InputCode(
      {required final String username,
      final AppException? exception,
      final bool? isLoading}) = _$InputCode;

  String get username;
  AppException? get exception;
  bool? get isLoading;
  @JsonKey(ignore: true)
  _$$InputCodeCopyWith<_$InputCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyCodeCopyWith<$Res> {
  factory _$$VerifyCodeCopyWith(
          _$VerifyCode value, $Res Function(_$VerifyCode) then) =
      __$$VerifyCodeCopyWithImpl<$Res>;
  @useResult
  $Res call({AppException? exception});
}

/// @nodoc
class __$$VerifyCodeCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$VerifyCode>
    implements _$$VerifyCodeCopyWith<$Res> {
  __$$VerifyCodeCopyWithImpl(
      _$VerifyCode _value, $Res Function(_$VerifyCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_$VerifyCode(
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException?,
    ));
  }
}

/// @nodoc

class _$VerifyCode implements VerifyCode {
  const _$VerifyCode({this.exception});

  @override
  final AppException? exception;

  @override
  String toString() {
    return 'ForgotPasswordState.verifyCode(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyCode &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyCodeCopyWith<_$VerifyCode> get copyWith =>
      __$$VerifyCodeCopyWithImpl<_$VerifyCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppException? exception, bool? isLoading) idle,
    required TResult Function(
            String username, AppException? exception, bool? isLoading)
        inputCode,
    required TResult Function(AppException? exception) verifyCode,
    required TResult Function(String code, String username,
            AppException? exception, bool? isLoading)
        inputPasswords,
    required TResult Function() processing,
    required TResult Function(dynamic data) success,
    required TResult Function(AppException exception) failure,
    required TResult Function() expired,
    required TResult Function(String statusCode, String? message) error,
  }) {
    return verifyCode(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppException? exception, bool? isLoading)? idle,
    TResult? Function(
            String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult? Function(AppException? exception)? verifyCode,
    TResult? Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult? Function()? processing,
    TResult? Function(dynamic data)? success,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? expired,
    TResult? Function(String statusCode, String? message)? error,
  }) {
    return verifyCode?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppException? exception, bool? isLoading)? idle,
    TResult Function(String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult Function(AppException? exception)? verifyCode,
    TResult Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult Function()? processing,
    TResult Function(dynamic data)? success,
    TResult Function(AppException exception)? failure,
    TResult Function()? expired,
    TResult Function(String statusCode, String? message)? error,
    required TResult orElse(),
  }) {
    if (verifyCode != null) {
      return verifyCode(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(InputCode value) inputCode,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(InputPasswords value) inputPasswords,
    required TResult Function(Processing value) processing,
    required TResult Function(Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(Expired value) expired,
    required TResult Function(Error value) error,
  }) {
    return verifyCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(InputCode value)? inputCode,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(InputPasswords value)? inputPasswords,
    TResult? Function(Processing value)? processing,
    TResult? Function(Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(Expired value)? expired,
    TResult? Function(Error value)? error,
  }) {
    return verifyCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(InputCode value)? inputCode,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(InputPasswords value)? inputPasswords,
    TResult Function(Processing value)? processing,
    TResult Function(Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(Expired value)? expired,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (verifyCode != null) {
      return verifyCode(this);
    }
    return orElse();
  }
}

abstract class VerifyCode implements ForgotPasswordState {
  const factory VerifyCode({final AppException? exception}) = _$VerifyCode;

  AppException? get exception;
  @JsonKey(ignore: true)
  _$$VerifyCodeCopyWith<_$VerifyCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InputPasswordsCopyWith<$Res> {
  factory _$$InputPasswordsCopyWith(
          _$InputPasswords value, $Res Function(_$InputPasswords) then) =
      __$$InputPasswordsCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String code, String username, AppException? exception, bool? isLoading});
}

/// @nodoc
class __$$InputPasswordsCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$InputPasswords>
    implements _$$InputPasswordsCopyWith<$Res> {
  __$$InputPasswordsCopyWithImpl(
      _$InputPasswords _value, $Res Function(_$InputPasswords) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? username = null,
    Object? exception = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$InputPasswords(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException?,
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$InputPasswords implements InputPasswords {
  const _$InputPasswords(
      {required this.code,
      required this.username,
      this.exception,
      this.isLoading});

  @override
  final String code;
  @override
  final String username;
  @override
  final AppException? exception;
  @override
  final bool? isLoading;

  @override
  String toString() {
    return 'ForgotPasswordState.inputPasswords(code: $code, username: $username, exception: $exception, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputPasswords &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, code, username, exception, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InputPasswordsCopyWith<_$InputPasswords> get copyWith =>
      __$$InputPasswordsCopyWithImpl<_$InputPasswords>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppException? exception, bool? isLoading) idle,
    required TResult Function(
            String username, AppException? exception, bool? isLoading)
        inputCode,
    required TResult Function(AppException? exception) verifyCode,
    required TResult Function(String code, String username,
            AppException? exception, bool? isLoading)
        inputPasswords,
    required TResult Function() processing,
    required TResult Function(dynamic data) success,
    required TResult Function(AppException exception) failure,
    required TResult Function() expired,
    required TResult Function(String statusCode, String? message) error,
  }) {
    return inputPasswords(code, username, exception, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppException? exception, bool? isLoading)? idle,
    TResult? Function(
            String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult? Function(AppException? exception)? verifyCode,
    TResult? Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult? Function()? processing,
    TResult? Function(dynamic data)? success,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? expired,
    TResult? Function(String statusCode, String? message)? error,
  }) {
    return inputPasswords?.call(code, username, exception, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppException? exception, bool? isLoading)? idle,
    TResult Function(String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult Function(AppException? exception)? verifyCode,
    TResult Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult Function()? processing,
    TResult Function(dynamic data)? success,
    TResult Function(AppException exception)? failure,
    TResult Function()? expired,
    TResult Function(String statusCode, String? message)? error,
    required TResult orElse(),
  }) {
    if (inputPasswords != null) {
      return inputPasswords(code, username, exception, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(InputCode value) inputCode,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(InputPasswords value) inputPasswords,
    required TResult Function(Processing value) processing,
    required TResult Function(Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(Expired value) expired,
    required TResult Function(Error value) error,
  }) {
    return inputPasswords(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(InputCode value)? inputCode,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(InputPasswords value)? inputPasswords,
    TResult? Function(Processing value)? processing,
    TResult? Function(Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(Expired value)? expired,
    TResult? Function(Error value)? error,
  }) {
    return inputPasswords?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(InputCode value)? inputCode,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(InputPasswords value)? inputPasswords,
    TResult Function(Processing value)? processing,
    TResult Function(Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(Expired value)? expired,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (inputPasswords != null) {
      return inputPasswords(this);
    }
    return orElse();
  }
}

abstract class InputPasswords implements ForgotPasswordState {
  const factory InputPasswords(
      {required final String code,
      required final String username,
      final AppException? exception,
      final bool? isLoading}) = _$InputPasswords;

  String get code;
  String get username;
  AppException? get exception;
  bool? get isLoading;
  @JsonKey(ignore: true)
  _$$InputPasswordsCopyWith<_$InputPasswords> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcessingCopyWith<$Res> {
  factory _$$ProcessingCopyWith(
          _$Processing value, $Res Function(_$Processing) then) =
      __$$ProcessingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessingCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$Processing>
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
    return 'ForgotPasswordState.processing()';
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
    required TResult Function(AppException? exception, bool? isLoading) idle,
    required TResult Function(
            String username, AppException? exception, bool? isLoading)
        inputCode,
    required TResult Function(AppException? exception) verifyCode,
    required TResult Function(String code, String username,
            AppException? exception, bool? isLoading)
        inputPasswords,
    required TResult Function() processing,
    required TResult Function(dynamic data) success,
    required TResult Function(AppException exception) failure,
    required TResult Function() expired,
    required TResult Function(String statusCode, String? message) error,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppException? exception, bool? isLoading)? idle,
    TResult? Function(
            String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult? Function(AppException? exception)? verifyCode,
    TResult? Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult? Function()? processing,
    TResult? Function(dynamic data)? success,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? expired,
    TResult? Function(String statusCode, String? message)? error,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppException? exception, bool? isLoading)? idle,
    TResult Function(String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult Function(AppException? exception)? verifyCode,
    TResult Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult Function()? processing,
    TResult Function(dynamic data)? success,
    TResult Function(AppException exception)? failure,
    TResult Function()? expired,
    TResult Function(String statusCode, String? message)? error,
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
    required TResult Function(Idle value) idle,
    required TResult Function(InputCode value) inputCode,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(InputPasswords value) inputPasswords,
    required TResult Function(Processing value) processing,
    required TResult Function(Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(Expired value) expired,
    required TResult Function(Error value) error,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(InputCode value)? inputCode,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(InputPasswords value)? inputPasswords,
    TResult? Function(Processing value)? processing,
    TResult? Function(Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(Expired value)? expired,
    TResult? Function(Error value)? error,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(InputCode value)? inputCode,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(InputPasswords value)? inputPasswords,
    TResult Function(Processing value)? processing,
    TResult Function(Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(Expired value)? expired,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class Processing implements ForgotPasswordState {
  const factory Processing() = _$Processing;
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
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$Success>
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
    return 'ForgotPasswordState.success(data: $data)';
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
    required TResult Function(AppException? exception, bool? isLoading) idle,
    required TResult Function(
            String username, AppException? exception, bool? isLoading)
        inputCode,
    required TResult Function(AppException? exception) verifyCode,
    required TResult Function(String code, String username,
            AppException? exception, bool? isLoading)
        inputPasswords,
    required TResult Function() processing,
    required TResult Function(dynamic data) success,
    required TResult Function(AppException exception) failure,
    required TResult Function() expired,
    required TResult Function(String statusCode, String? message) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppException? exception, bool? isLoading)? idle,
    TResult? Function(
            String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult? Function(AppException? exception)? verifyCode,
    TResult? Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult? Function()? processing,
    TResult? Function(dynamic data)? success,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? expired,
    TResult? Function(String statusCode, String? message)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppException? exception, bool? isLoading)? idle,
    TResult Function(String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult Function(AppException? exception)? verifyCode,
    TResult Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult Function()? processing,
    TResult Function(dynamic data)? success,
    TResult Function(AppException exception)? failure,
    TResult Function()? expired,
    TResult Function(String statusCode, String? message)? error,
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
    required TResult Function(Idle value) idle,
    required TResult Function(InputCode value) inputCode,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(InputPasswords value) inputPasswords,
    required TResult Function(Processing value) processing,
    required TResult Function(Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(Expired value) expired,
    required TResult Function(Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(InputCode value)? inputCode,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(InputPasswords value)? inputPasswords,
    TResult? Function(Processing value)? processing,
    TResult? Function(Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(Expired value)? expired,
    TResult? Function(Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(InputCode value)? inputCode,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(InputPasswords value)? inputPasswords,
    TResult Function(Processing value)? processing,
    TResult Function(Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(Expired value)? expired,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements ForgotPasswordState {
  const factory Success({final dynamic data}) = _$Success;

  dynamic get data;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<_$Success> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$Failure>
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
    return 'ForgotPasswordState.failure(exception: $exception)';
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
    required TResult Function(AppException? exception, bool? isLoading) idle,
    required TResult Function(
            String username, AppException? exception, bool? isLoading)
        inputCode,
    required TResult Function(AppException? exception) verifyCode,
    required TResult Function(String code, String username,
            AppException? exception, bool? isLoading)
        inputPasswords,
    required TResult Function() processing,
    required TResult Function(dynamic data) success,
    required TResult Function(AppException exception) failure,
    required TResult Function() expired,
    required TResult Function(String statusCode, String? message) error,
  }) {
    return failure(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppException? exception, bool? isLoading)? idle,
    TResult? Function(
            String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult? Function(AppException? exception)? verifyCode,
    TResult? Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult? Function()? processing,
    TResult? Function(dynamic data)? success,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? expired,
    TResult? Function(String statusCode, String? message)? error,
  }) {
    return failure?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppException? exception, bool? isLoading)? idle,
    TResult Function(String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult Function(AppException? exception)? verifyCode,
    TResult Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult Function()? processing,
    TResult Function(dynamic data)? success,
    TResult Function(AppException exception)? failure,
    TResult Function()? expired,
    TResult Function(String statusCode, String? message)? error,
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
    required TResult Function(Idle value) idle,
    required TResult Function(InputCode value) inputCode,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(InputPasswords value) inputPasswords,
    required TResult Function(Processing value) processing,
    required TResult Function(Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(Expired value) expired,
    required TResult Function(Error value) error,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(InputCode value)? inputCode,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(InputPasswords value)? inputPasswords,
    TResult? Function(Processing value)? processing,
    TResult? Function(Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(Expired value)? expired,
    TResult? Function(Error value)? error,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(InputCode value)? inputCode,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(InputPasswords value)? inputPasswords,
    TResult Function(Processing value)? processing,
    TResult Function(Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(Expired value)? expired,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements ForgotPasswordState {
  const factory Failure(final AppException exception) = _$Failure;

  AppException get exception;
  @JsonKey(ignore: true)
  _$$FailureCopyWith<_$Failure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExpiredCopyWith<$Res> {
  factory _$$ExpiredCopyWith(_$Expired value, $Res Function(_$Expired) then) =
      __$$ExpiredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExpiredCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$Expired>
    implements _$$ExpiredCopyWith<$Res> {
  __$$ExpiredCopyWithImpl(_$Expired _value, $Res Function(_$Expired) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Expired implements Expired {
  const _$Expired();

  @override
  String toString() {
    return 'ForgotPasswordState.expired()';
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
    required TResult Function(AppException? exception, bool? isLoading) idle,
    required TResult Function(
            String username, AppException? exception, bool? isLoading)
        inputCode,
    required TResult Function(AppException? exception) verifyCode,
    required TResult Function(String code, String username,
            AppException? exception, bool? isLoading)
        inputPasswords,
    required TResult Function() processing,
    required TResult Function(dynamic data) success,
    required TResult Function(AppException exception) failure,
    required TResult Function() expired,
    required TResult Function(String statusCode, String? message) error,
  }) {
    return expired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppException? exception, bool? isLoading)? idle,
    TResult? Function(
            String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult? Function(AppException? exception)? verifyCode,
    TResult? Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult? Function()? processing,
    TResult? Function(dynamic data)? success,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? expired,
    TResult? Function(String statusCode, String? message)? error,
  }) {
    return expired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppException? exception, bool? isLoading)? idle,
    TResult Function(String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult Function(AppException? exception)? verifyCode,
    TResult Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult Function()? processing,
    TResult Function(dynamic data)? success,
    TResult Function(AppException exception)? failure,
    TResult Function()? expired,
    TResult Function(String statusCode, String? message)? error,
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
    required TResult Function(Idle value) idle,
    required TResult Function(InputCode value) inputCode,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(InputPasswords value) inputPasswords,
    required TResult Function(Processing value) processing,
    required TResult Function(Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(Expired value) expired,
    required TResult Function(Error value) error,
  }) {
    return expired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(InputCode value)? inputCode,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(InputPasswords value)? inputPasswords,
    TResult? Function(Processing value)? processing,
    TResult? Function(Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(Expired value)? expired,
    TResult? Function(Error value)? error,
  }) {
    return expired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(InputCode value)? inputCode,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(InputPasswords value)? inputPasswords,
    TResult Function(Processing value)? processing,
    TResult Function(Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(Expired value)? expired,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (expired != null) {
      return expired(this);
    }
    return orElse();
  }
}

abstract class Expired implements ForgotPasswordState {
  const factory Expired() = _$Expired;
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
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$Error>
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
    return 'ForgotPasswordState.error(statusCode: $statusCode, message: $message)';
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
    required TResult Function(AppException? exception, bool? isLoading) idle,
    required TResult Function(
            String username, AppException? exception, bool? isLoading)
        inputCode,
    required TResult Function(AppException? exception) verifyCode,
    required TResult Function(String code, String username,
            AppException? exception, bool? isLoading)
        inputPasswords,
    required TResult Function() processing,
    required TResult Function(dynamic data) success,
    required TResult Function(AppException exception) failure,
    required TResult Function() expired,
    required TResult Function(String statusCode, String? message) error,
  }) {
    return error(statusCode, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppException? exception, bool? isLoading)? idle,
    TResult? Function(
            String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult? Function(AppException? exception)? verifyCode,
    TResult? Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult? Function()? processing,
    TResult? Function(dynamic data)? success,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? expired,
    TResult? Function(String statusCode, String? message)? error,
  }) {
    return error?.call(statusCode, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppException? exception, bool? isLoading)? idle,
    TResult Function(String username, AppException? exception, bool? isLoading)?
        inputCode,
    TResult Function(AppException? exception)? verifyCode,
    TResult Function(String code, String username, AppException? exception,
            bool? isLoading)?
        inputPasswords,
    TResult Function()? processing,
    TResult Function(dynamic data)? success,
    TResult Function(AppException exception)? failure,
    TResult Function()? expired,
    TResult Function(String statusCode, String? message)? error,
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
    required TResult Function(Idle value) idle,
    required TResult Function(InputCode value) inputCode,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(InputPasswords value) inputPasswords,
    required TResult Function(Processing value) processing,
    required TResult Function(Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(Expired value) expired,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(InputCode value)? inputCode,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(InputPasswords value)? inputPasswords,
    TResult? Function(Processing value)? processing,
    TResult? Function(Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(Expired value)? expired,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(InputCode value)? inputCode,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(InputPasswords value)? inputPasswords,
    TResult Function(Processing value)? processing,
    TResult Function(Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(Expired value)? expired,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ForgotPasswordState {
  const factory Error(final String statusCode, final String? message) = _$Error;

  String get statusCode;
  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}
