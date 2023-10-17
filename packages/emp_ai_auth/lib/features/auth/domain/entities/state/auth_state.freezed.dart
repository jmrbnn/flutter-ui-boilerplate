// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorizing,
    required TResult Function() unauthenticated,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(IdentityInstrospect? identity) authenticated,
    required TResult Function(AuthFailure? failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authorizing,
    TResult? Function()? unauthenticated,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(IdentityInstrospect? identity)? authenticated,
    TResult? Function(AuthFailure? failure)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorizing,
    TResult Function()? unauthenticated,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(IdentityInstrospect? identity)? authenticated,
    TResult Function(AuthFailure? failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Authorizing value) authorizing,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Error value) error,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Authorizing value)? authorizing,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Error value)? error,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Authorizing value)? authorizing,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Error value)? error,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorizing,
    required TResult Function() unauthenticated,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(IdentityInstrospect? identity) authenticated,
    required TResult Function(AuthFailure? failure) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authorizing,
    TResult? Function()? unauthenticated,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(IdentityInstrospect? identity)? authenticated,
    TResult? Function(AuthFailure? failure)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorizing,
    TResult Function()? unauthenticated,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(IdentityInstrospect? identity)? authenticated,
    TResult Function(AuthFailure? failure)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Authorizing value) authorizing,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Error value) error,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Authorizing value)? authorizing,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Error value)? error,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Authorizing value)? authorizing,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Error value)? error,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements AuthState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$AuthorizingCopyWith<$Res> {
  factory _$$AuthorizingCopyWith(
          _$Authorizing value, $Res Function(_$Authorizing) then) =
      __$$AuthorizingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthorizingCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Authorizing>
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
    return 'AuthState.authorizing()';
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
    required TResult Function() initial,
    required TResult Function() authorizing,
    required TResult Function() unauthenticated,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(IdentityInstrospect? identity) authenticated,
    required TResult Function(AuthFailure? failure) failed,
  }) {
    return authorizing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authorizing,
    TResult? Function()? unauthenticated,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(IdentityInstrospect? identity)? authenticated,
    TResult? Function(AuthFailure? failure)? failed,
  }) {
    return authorizing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorizing,
    TResult Function()? unauthenticated,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(IdentityInstrospect? identity)? authenticated,
    TResult Function(AuthFailure? failure)? failed,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Authorizing value) authorizing,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Error value) error,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Failed value) failed,
  }) {
    return authorizing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Authorizing value)? authorizing,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Error value)? error,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Failed value)? failed,
  }) {
    return authorizing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Authorizing value)? authorizing,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Error value)? error,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (authorizing != null) {
      return authorizing(this);
    }
    return orElse();
  }
}

abstract class Authorizing implements AuthState {
  const factory Authorizing() = _$Authorizing;
}

/// @nodoc
abstract class _$$UnauthenticatedCopyWith<$Res> {
  factory _$$UnauthenticatedCopyWith(
          _$Unauthenticated value, $Res Function(_$Unauthenticated) then) =
      __$$UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Unauthenticated>
    implements _$$UnauthenticatedCopyWith<$Res> {
  __$$UnauthenticatedCopyWithImpl(
      _$Unauthenticated _value, $Res Function(_$Unauthenticated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Unauthenticated implements Unauthenticated {
  const _$Unauthenticated();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorizing,
    required TResult Function() unauthenticated,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(IdentityInstrospect? identity) authenticated,
    required TResult Function(AuthFailure? failure) failed,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authorizing,
    TResult? Function()? unauthenticated,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(IdentityInstrospect? identity)? authenticated,
    TResult? Function(AuthFailure? failure)? failed,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorizing,
    TResult Function()? unauthenticated,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(IdentityInstrospect? identity)? authenticated,
    TResult Function(AuthFailure? failure)? failed,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Authorizing value) authorizing,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Error value) error,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Failed value) failed,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Authorizing value)? authorizing,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Error value)? error,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Failed value)? failed,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Authorizing value)? authorizing,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Error value)? error,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements AuthState {
  const factory Unauthenticated() = _$Unauthenticated;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String statusCode, String? message});
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res, _$Error>
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
    return 'AuthState.error(statusCode: $statusCode, message: $message)';
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
    required TResult Function() initial,
    required TResult Function() authorizing,
    required TResult Function() unauthenticated,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(IdentityInstrospect? identity) authenticated,
    required TResult Function(AuthFailure? failure) failed,
  }) {
    return error(statusCode, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authorizing,
    TResult? Function()? unauthenticated,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(IdentityInstrospect? identity)? authenticated,
    TResult? Function(AuthFailure? failure)? failed,
  }) {
    return error?.call(statusCode, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorizing,
    TResult Function()? unauthenticated,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(IdentityInstrospect? identity)? authenticated,
    TResult Function(AuthFailure? failure)? failed,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Authorizing value) authorizing,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Error value) error,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Failed value) failed,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Authorizing value)? authorizing,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Error value)? error,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Failed value)? failed,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Authorizing value)? authorizing,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Error value)? error,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements AuthState {
  const factory Error(final String statusCode, final String? message) = _$Error;

  String get statusCode;
  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticatedCopyWith<$Res> {
  factory _$$AuthenticatedCopyWith(
          _$Authenticated value, $Res Function(_$Authenticated) then) =
      __$$AuthenticatedCopyWithImpl<$Res>;
  @useResult
  $Res call({IdentityInstrospect? identity});
}

/// @nodoc
class __$$AuthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Authenticated>
    implements _$$AuthenticatedCopyWith<$Res> {
  __$$AuthenticatedCopyWithImpl(
      _$Authenticated _value, $Res Function(_$Authenticated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identity = freezed,
  }) {
    return _then(_$Authenticated(
      freezed == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as IdentityInstrospect?,
    ));
  }
}

/// @nodoc

class _$Authenticated implements Authenticated {
  const _$Authenticated(this.identity);

  @override
  final IdentityInstrospect? identity;

  @override
  String toString() {
    return 'AuthState.authenticated(identity: $identity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Authenticated &&
            (identical(other.identity, identity) ||
                other.identity == identity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedCopyWith<_$Authenticated> get copyWith =>
      __$$AuthenticatedCopyWithImpl<_$Authenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorizing,
    required TResult Function() unauthenticated,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(IdentityInstrospect? identity) authenticated,
    required TResult Function(AuthFailure? failure) failed,
  }) {
    return authenticated(identity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authorizing,
    TResult? Function()? unauthenticated,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(IdentityInstrospect? identity)? authenticated,
    TResult? Function(AuthFailure? failure)? failed,
  }) {
    return authenticated?.call(identity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorizing,
    TResult Function()? unauthenticated,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(IdentityInstrospect? identity)? authenticated,
    TResult Function(AuthFailure? failure)? failed,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(identity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Authorizing value) authorizing,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Error value) error,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Failed value) failed,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Authorizing value)? authorizing,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Error value)? error,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Failed value)? failed,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Authorizing value)? authorizing,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Error value)? error,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthState {
  const factory Authenticated(final IdentityInstrospect? identity) =
      _$Authenticated;

  IdentityInstrospect? get identity;
  @JsonKey(ignore: true)
  _$$AuthenticatedCopyWith<_$Authenticated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedCopyWith<$Res> {
  factory _$$FailedCopyWith(_$Failed value, $Res Function(_$Failed) then) =
      __$$FailedCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthFailure? failure});

  $AuthFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$FailedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Failed>
    implements _$$FailedCopyWith<$Res> {
  __$$FailedCopyWithImpl(_$Failed _value, $Res Function(_$Failed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$Failed(
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as AuthFailure?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthFailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $AuthFailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$Failed implements Failed {
  const _$Failed({required this.failure});

  @override
  final AuthFailure? failure;

  @override
  String toString() {
    return 'AuthState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Failed &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedCopyWith<_$Failed> get copyWith =>
      __$$FailedCopyWithImpl<_$Failed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorizing,
    required TResult Function() unauthenticated,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(IdentityInstrospect? identity) authenticated,
    required TResult Function(AuthFailure? failure) failed,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authorizing,
    TResult? Function()? unauthenticated,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(IdentityInstrospect? identity)? authenticated,
    TResult? Function(AuthFailure? failure)? failed,
  }) {
    return failed?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorizing,
    TResult Function()? unauthenticated,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(IdentityInstrospect? identity)? authenticated,
    TResult Function(AuthFailure? failure)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Authorizing value) authorizing,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Error value) error,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Authorizing value)? authorizing,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Error value)? error,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Authorizing value)? authorizing,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Error value)? error,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class Failed implements AuthState {
  const factory Failed({required final AuthFailure? failure}) = _$Failed;

  AuthFailure? get failure;
  @JsonKey(ignore: true)
  _$$FailedCopyWith<_$Failed> get copyWith =>
      throw _privateConstructorUsedError;
}
