// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oauth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OAuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OAuthStateCopyWith<$Res> {
  factory $OAuthStateCopyWith(
          OAuthState value, $Res Function(OAuthState) then) =
      _$OAuthStateCopyWithImpl<$Res, OAuthState>;
}

/// @nodoc
class _$OAuthStateCopyWithImpl<$Res, $Val extends OAuthState>
    implements $OAuthStateCopyWith<$Res> {
  _$OAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleCopyWith<$Res> {
  factory _$$IdleCopyWith(_$Idle value, $Res Function(_$Idle) then) =
      __$$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleCopyWithImpl<$Res> extends _$OAuthStateCopyWithImpl<$Res, _$Idle>
    implements _$$IdleCopyWith<$Res> {
  __$$IdleCopyWithImpl(_$Idle _value, $Res Function(_$Idle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Idle implements Idle {
  const _$Idle();

  @override
  String toString() {
    return 'OAuthState.idle()';
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
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
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
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements OAuthState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$OAuthStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'OAuthState.initial()';
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
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
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
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements OAuthState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$OAuthStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'OAuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements OAuthState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$GettingAuthRequestCopyWith<$Res> {
  factory _$$GettingAuthRequestCopyWith(_$GettingAuthRequest value,
          $Res Function(_$GettingAuthRequest) then) =
      __$$GettingAuthRequestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GettingAuthRequestCopyWithImpl<$Res>
    extends _$OAuthStateCopyWithImpl<$Res, _$GettingAuthRequest>
    implements _$$GettingAuthRequestCopyWith<$Res> {
  __$$GettingAuthRequestCopyWithImpl(
      _$GettingAuthRequest _value, $Res Function(_$GettingAuthRequest) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GettingAuthRequest implements GettingAuthRequest {
  const _$GettingAuthRequest();

  @override
  String toString() {
    return 'OAuthState.getAuthRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GettingAuthRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return getAuthRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return getAuthRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (getAuthRequest != null) {
      return getAuthRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return getAuthRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return getAuthRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (getAuthRequest != null) {
      return getAuthRequest(this);
    }
    return orElse();
  }
}

abstract class GettingAuthRequest implements OAuthState {
  const factory GettingAuthRequest() = _$GettingAuthRequest;
}

/// @nodoc
abstract class _$$WaitingAuthCodeCopyWith<$Res> {
  factory _$$WaitingAuthCodeCopyWith(
          _$WaitingAuthCode value, $Res Function(_$WaitingAuthCode) then) =
      __$$WaitingAuthCodeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WaitingAuthCodeCopyWithImpl<$Res>
    extends _$OAuthStateCopyWithImpl<$Res, _$WaitingAuthCode>
    implements _$$WaitingAuthCodeCopyWith<$Res> {
  __$$WaitingAuthCodeCopyWithImpl(
      _$WaitingAuthCode _value, $Res Function(_$WaitingAuthCode) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WaitingAuthCode implements WaitingAuthCode {
  const _$WaitingAuthCode();

  @override
  String toString() {
    return 'OAuthState.waitAuthCode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WaitingAuthCode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return waitAuthCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return waitAuthCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (waitAuthCode != null) {
      return waitAuthCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return waitAuthCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return waitAuthCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (waitAuthCode != null) {
      return waitAuthCode(this);
    }
    return orElse();
  }
}

abstract class WaitingAuthCode implements OAuthState {
  const factory WaitingAuthCode() = _$WaitingAuthCode;
}

/// @nodoc
abstract class _$$ExchangingAuthCodeCopyWith<$Res> {
  factory _$$ExchangingAuthCodeCopyWith(_$ExchangingAuthCode value,
          $Res Function(_$ExchangingAuthCode) then) =
      __$$ExchangingAuthCodeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExchangingAuthCodeCopyWithImpl<$Res>
    extends _$OAuthStateCopyWithImpl<$Res, _$ExchangingAuthCode>
    implements _$$ExchangingAuthCodeCopyWith<$Res> {
  __$$ExchangingAuthCodeCopyWithImpl(
      _$ExchangingAuthCode _value, $Res Function(_$ExchangingAuthCode) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ExchangingAuthCode implements ExchangingAuthCode {
  const _$ExchangingAuthCode();

  @override
  String toString() {
    return 'OAuthState.exchangeAuthCode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExchangingAuthCode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return exchangeAuthCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return exchangeAuthCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (exchangeAuthCode != null) {
      return exchangeAuthCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return exchangeAuthCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return exchangeAuthCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (exchangeAuthCode != null) {
      return exchangeAuthCode(this);
    }
    return orElse();
  }
}

abstract class ExchangingAuthCode implements OAuthState {
  const factory ExchangingAuthCode() = _$ExchangingAuthCode;
}

/// @nodoc
abstract class _$$SetupMfaCopyWith<$Res> {
  factory _$$SetupMfaCopyWith(
          _$SetupMfa value, $Res Function(_$SetupMfa) then) =
      __$$SetupMfaCopyWithImpl<$Res>;
  @useResult
  $Res call({String? qr});
}

/// @nodoc
class __$$SetupMfaCopyWithImpl<$Res>
    extends _$OAuthStateCopyWithImpl<$Res, _$SetupMfa>
    implements _$$SetupMfaCopyWith<$Res> {
  __$$SetupMfaCopyWithImpl(_$SetupMfa _value, $Res Function(_$SetupMfa) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qr = freezed,
  }) {
    return _then(_$SetupMfa(
      qr: freezed == qr
          ? _value.qr
          : qr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SetupMfa implements SetupMfa {
  const _$SetupMfa({this.qr});

  @override
  final String? qr;

  @override
  String toString() {
    return 'OAuthState.setupMFA(qr: $qr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetupMfa &&
            (identical(other.qr, qr) || other.qr == qr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetupMfaCopyWith<_$SetupMfa> get copyWith =>
      __$$SetupMfaCopyWithImpl<_$SetupMfa>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return setupMFA(qr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return setupMFA?.call(qr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (setupMFA != null) {
      return setupMFA(qr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return setupMFA(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return setupMFA?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (setupMFA != null) {
      return setupMFA(this);
    }
    return orElse();
  }
}

abstract class SetupMfa implements OAuthState {
  const factory SetupMfa({final String? qr}) = _$SetupMfa;

  String? get qr;
  @JsonKey(ignore: true)
  _$$SetupMfaCopyWith<_$SetupMfa> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AskTOTPCopyWith<$Res> {
  factory _$$AskTOTPCopyWith(_$AskTOTP value, $Res Function(_$AskTOTP) then) =
      __$$AskTOTPCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AskTOTPCopyWithImpl<$Res>
    extends _$OAuthStateCopyWithImpl<$Res, _$AskTOTP>
    implements _$$AskTOTPCopyWith<$Res> {
  __$$AskTOTPCopyWithImpl(_$AskTOTP _value, $Res Function(_$AskTOTP) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AskTOTP implements AskTOTP {
  const _$AskTOTP();

  @override
  String toString() {
    return 'OAuthState.askTOTP()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AskTOTP);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return askTOTP();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return askTOTP?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (askTOTP != null) {
      return askTOTP();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return askTOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return askTOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (askTOTP != null) {
      return askTOTP(this);
    }
    return orElse();
  }
}

abstract class AskTOTP implements OAuthState {
  const factory AskTOTP() = _$AskTOTP;
}

/// @nodoc
abstract class _$$RedirectCopyWith<$Res> {
  factory _$$RedirectCopyWith(
          _$Redirect value, $Res Function(_$Redirect) then) =
      __$$RedirectCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$RedirectCopyWithImpl<$Res>
    extends _$OAuthStateCopyWithImpl<$Res, _$Redirect>
    implements _$$RedirectCopyWith<$Res> {
  __$$RedirectCopyWithImpl(_$Redirect _value, $Res Function(_$Redirect) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$Redirect(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Redirect implements Redirect {
  const _$Redirect({required this.url});

  @override
  final String url;

  @override
  String toString() {
    return 'OAuthState.redirect(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Redirect &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RedirectCopyWith<_$Redirect> get copyWith =>
      __$$RedirectCopyWithImpl<_$Redirect>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return redirect(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return redirect?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (redirect != null) {
      return redirect(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return redirect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return redirect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (redirect != null) {
      return redirect(this);
    }
    return orElse();
  }
}

abstract class Redirect implements OAuthState {
  const factory Redirect({required final String url}) = _$Redirect;

  String get url;
  @JsonKey(ignore: true)
  _$$RedirectCopyWith<_$Redirect> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PromptUpdatePasswordCopyWith<$Res> {
  factory _$$PromptUpdatePasswordCopyWith(_$PromptUpdatePassword value,
          $Res Function(_$PromptUpdatePassword) then) =
      __$$PromptUpdatePasswordCopyWithImpl<$Res>;
  @useResult
  $Res call({OAuthMfaResponse response});
}

/// @nodoc
class __$$PromptUpdatePasswordCopyWithImpl<$Res>
    extends _$OAuthStateCopyWithImpl<$Res, _$PromptUpdatePassword>
    implements _$$PromptUpdatePasswordCopyWith<$Res> {
  __$$PromptUpdatePasswordCopyWithImpl(_$PromptUpdatePassword _value,
      $Res Function(_$PromptUpdatePassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$PromptUpdatePassword(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as OAuthMfaResponse,
    ));
  }
}

/// @nodoc

class _$PromptUpdatePassword implements PromptUpdatePassword {
  const _$PromptUpdatePassword({required this.response});

  @override
  final OAuthMfaResponse response;

  @override
  String toString() {
    return 'OAuthState.promptUpdatePassword(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromptUpdatePassword &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromptUpdatePasswordCopyWith<_$PromptUpdatePassword> get copyWith =>
      __$$PromptUpdatePasswordCopyWithImpl<_$PromptUpdatePassword>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return promptUpdatePassword(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return promptUpdatePassword?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (promptUpdatePassword != null) {
      return promptUpdatePassword(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return promptUpdatePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return promptUpdatePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (promptUpdatePassword != null) {
      return promptUpdatePassword(this);
    }
    return orElse();
  }
}

abstract class PromptUpdatePassword implements OAuthState {
  const factory PromptUpdatePassword(
      {required final OAuthMfaResponse response}) = _$PromptUpdatePassword;

  OAuthMfaResponse get response;
  @JsonKey(ignore: true)
  _$$PromptUpdatePasswordCopyWith<_$PromptUpdatePassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordExpiredCopyWith<$Res> {
  factory _$$PasswordExpiredCopyWith(
          _$PasswordExpired value, $Res Function(_$PasswordExpired) then) =
      __$$PasswordExpiredCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic data});
}

/// @nodoc
class __$$PasswordExpiredCopyWithImpl<$Res>
    extends _$OAuthStateCopyWithImpl<$Res, _$PasswordExpired>
    implements _$$PasswordExpiredCopyWith<$Res> {
  __$$PasswordExpiredCopyWithImpl(
      _$PasswordExpired _value, $Res Function(_$PasswordExpired) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$PasswordExpired(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$PasswordExpired implements PasswordExpired {
  const _$PasswordExpired({required this.data});

  @override
  final dynamic data;

  @override
  String toString() {
    return 'OAuthState.passwordExpired(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordExpired &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordExpiredCopyWith<_$PasswordExpired> get copyWith =>
      __$$PasswordExpiredCopyWithImpl<_$PasswordExpired>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return passwordExpired(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return passwordExpired?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (passwordExpired != null) {
      return passwordExpired(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return passwordExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return passwordExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (passwordExpired != null) {
      return passwordExpired(this);
    }
    return orElse();
  }
}

abstract class PasswordExpired implements OAuthState {
  const factory PasswordExpired({required final dynamic data}) =
      _$PasswordExpired;

  dynamic get data;
  @JsonKey(ignore: true)
  _$$PasswordExpiredCopyWith<_$PasswordExpired> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangePasswordCopyWith<$Res> {
  factory _$$ChangePasswordCopyWith(
          _$ChangePassword value, $Res Function(_$ChangePassword) then) =
      __$$ChangePasswordCopyWithImpl<$Res>;
  @useResult
  $Res call({OAuthMfaResponse response, String username});
}

/// @nodoc
class __$$ChangePasswordCopyWithImpl<$Res>
    extends _$OAuthStateCopyWithImpl<$Res, _$ChangePassword>
    implements _$$ChangePasswordCopyWith<$Res> {
  __$$ChangePasswordCopyWithImpl(
      _$ChangePassword _value, $Res Function(_$ChangePassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? username = null,
  }) {
    return _then(_$ChangePassword(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as OAuthMfaResponse,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangePassword implements ChangePassword {
  const _$ChangePassword({required this.response, required this.username});

  @override
  final OAuthMfaResponse response;
  @override
  final String username;

  @override
  String toString() {
    return 'OAuthState.changePassword(response: $response, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePassword &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordCopyWith<_$ChangePassword> get copyWith =>
      __$$ChangePasswordCopyWithImpl<_$ChangePassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return changePassword(response, username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return changePassword?.call(response, username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(response, username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return changePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class ChangePassword implements OAuthState {
  const factory ChangePassword(
      {required final OAuthMfaResponse response,
      required final String username}) = _$ChangePassword;

  OAuthMfaResponse get response;
  String get username;
  @JsonKey(ignore: true)
  _$$ChangePasswordCopyWith<_$ChangePassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IntrospectingCopyWith<$Res> {
  factory _$$IntrospectingCopyWith(
          _$Introspecting value, $Res Function(_$Introspecting) then) =
      __$$IntrospectingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IntrospectingCopyWithImpl<$Res>
    extends _$OAuthStateCopyWithImpl<$Res, _$Introspecting>
    implements _$$IntrospectingCopyWith<$Res> {
  __$$IntrospectingCopyWithImpl(
      _$Introspecting _value, $Res Function(_$Introspecting) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Introspecting implements Introspecting {
  const _$Introspecting();

  @override
  String toString() {
    return 'OAuthState.introspect()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Introspecting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return introspect();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return introspect?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (introspect != null) {
      return introspect();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return introspect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return introspect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (introspect != null) {
      return introspect(this);
    }
    return orElse();
  }
}

abstract class Introspecting implements OAuthState {
  const factory Introspecting() = _$Introspecting;
}

/// @nodoc
abstract class _$$ExpiredCopyWith<$Res> {
  factory _$$ExpiredCopyWith(_$Expired value, $Res Function(_$Expired) then) =
      __$$ExpiredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExpiredCopyWithImpl<$Res>
    extends _$OAuthStateCopyWithImpl<$Res, _$Expired>
    implements _$$ExpiredCopyWith<$Res> {
  __$$ExpiredCopyWithImpl(_$Expired _value, $Res Function(_$Expired) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Expired implements Expired {
  const _$Expired();

  @override
  String toString() {
    return 'OAuthState.expired()';
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
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return expired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return expired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return expired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return expired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (expired != null) {
      return expired(this);
    }
    return orElse();
  }
}

abstract class Expired implements OAuthState {
  const factory Expired() = _$Expired;
}

/// @nodoc
abstract class _$$LoggedOutCopyWith<$Res> {
  factory _$$LoggedOutCopyWith(
          _$LoggedOut value, $Res Function(_$LoggedOut) then) =
      __$$LoggedOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoggedOutCopyWithImpl<$Res>
    extends _$OAuthStateCopyWithImpl<$Res, _$LoggedOut>
    implements _$$LoggedOutCopyWith<$Res> {
  __$$LoggedOutCopyWithImpl(
      _$LoggedOut _value, $Res Function(_$LoggedOut) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoggedOut implements LoggedOut {
  const _$LoggedOut();

  @override
  String toString() {
    return 'OAuthState.logOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoggedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return logOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return logOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return logOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }
}

abstract class LoggedOut implements OAuthState {
  const factory LoggedOut() = _$LoggedOut;
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
    extends _$OAuthStateCopyWithImpl<$Res, _$Failure>
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
    return 'OAuthState.failure(exception: $exception)';
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
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return failure(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return failure?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements OAuthState {
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
    extends _$OAuthStateCopyWithImpl<$Res, _$Error>
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
    return 'OAuthState.error(statusCode: $statusCode, message: $message)';
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
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return error(statusCode, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return error?.call(statusCode, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements OAuthState {
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
    extends _$OAuthStateCopyWithImpl<$Res, _$Success>
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
    return 'OAuthState.success(data: $data)';
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
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements OAuthState {
  const factory Success({final dynamic data}) = _$Success;

  dynamic get data;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<_$Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessfulAuthorizationCopyWith<$Res> {
  factory _$$SuccessfulAuthorizationCopyWith(_$SuccessfulAuthorization value,
          $Res Function(_$SuccessfulAuthorization) then) =
      __$$SuccessfulAuthorizationCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic data});
}

/// @nodoc
class __$$SuccessfulAuthorizationCopyWithImpl<$Res>
    extends _$OAuthStateCopyWithImpl<$Res, _$SuccessfulAuthorization>
    implements _$$SuccessfulAuthorizationCopyWith<$Res> {
  __$$SuccessfulAuthorizationCopyWithImpl(_$SuccessfulAuthorization _value,
      $Res Function(_$SuccessfulAuthorization) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessfulAuthorization(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$SuccessfulAuthorization implements SuccessfulAuthorization {
  const _$SuccessfulAuthorization({this.data});

  @override
  final dynamic data;

  @override
  String toString() {
    return 'OAuthState.successfulAuthorizationRequest(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessfulAuthorization &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessfulAuthorizationCopyWith<_$SuccessfulAuthorization> get copyWith =>
      __$$SuccessfulAuthorizationCopyWithImpl<_$SuccessfulAuthorization>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return successfulAuthorizationRequest(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return successfulAuthorizationRequest?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (successfulAuthorizationRequest != null) {
      return successfulAuthorizationRequest(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return successfulAuthorizationRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return successfulAuthorizationRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (successfulAuthorizationRequest != null) {
      return successfulAuthorizationRequest(this);
    }
    return orElse();
  }
}

abstract class SuccessfulAuthorization implements OAuthState {
  const factory SuccessfulAuthorization({final dynamic data}) =
      _$SuccessfulAuthorization;

  dynamic get data;
  @JsonKey(ignore: true)
  _$$SuccessfulAuthorizationCopyWith<_$SuccessfulAuthorization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessfulAuthenticationCopyWith<$Res> {
  factory _$$SuccessfulAuthenticationCopyWith(_$SuccessfulAuthentication value,
          $Res Function(_$SuccessfulAuthentication) then) =
      __$$SuccessfulAuthenticationCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic data});
}

/// @nodoc
class __$$SuccessfulAuthenticationCopyWithImpl<$Res>
    extends _$OAuthStateCopyWithImpl<$Res, _$SuccessfulAuthentication>
    implements _$$SuccessfulAuthenticationCopyWith<$Res> {
  __$$SuccessfulAuthenticationCopyWithImpl(_$SuccessfulAuthentication _value,
      $Res Function(_$SuccessfulAuthentication) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessfulAuthentication(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$SuccessfulAuthentication implements SuccessfulAuthentication {
  const _$SuccessfulAuthentication({this.data});

  @override
  final dynamic data;

  @override
  String toString() {
    return 'OAuthState.successfulAuthentication(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessfulAuthentication &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessfulAuthenticationCopyWith<_$SuccessfulAuthentication>
      get copyWith =>
          __$$SuccessfulAuthenticationCopyWithImpl<_$SuccessfulAuthentication>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() getAuthRequest,
    required TResult Function() waitAuthCode,
    required TResult Function() exchangeAuthCode,
    required TResult Function(String? qr) setupMFA,
    required TResult Function() askTOTP,
    required TResult Function(String url) redirect,
    required TResult Function(OAuthMfaResponse response) promptUpdatePassword,
    required TResult Function(dynamic data) passwordExpired,
    required TResult Function(OAuthMfaResponse response, String username)
        changePassword,
    required TResult Function() introspect,
    required TResult Function() expired,
    required TResult Function() logOut,
    required TResult Function(AppException exception) failure,
    required TResult Function(String statusCode, String? message) error,
    required TResult Function(dynamic data) success,
    required TResult Function(dynamic data) successfulAuthorizationRequest,
    required TResult Function(dynamic data) successfulAuthentication,
  }) {
    return successfulAuthentication(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? getAuthRequest,
    TResult? Function()? waitAuthCode,
    TResult? Function()? exchangeAuthCode,
    TResult? Function(String? qr)? setupMFA,
    TResult? Function()? askTOTP,
    TResult? Function(String url)? redirect,
    TResult? Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult? Function(dynamic data)? passwordExpired,
    TResult? Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult? Function()? introspect,
    TResult? Function()? expired,
    TResult? Function()? logOut,
    TResult? Function(AppException exception)? failure,
    TResult? Function(String statusCode, String? message)? error,
    TResult? Function(dynamic data)? success,
    TResult? Function(dynamic data)? successfulAuthorizationRequest,
    TResult? Function(dynamic data)? successfulAuthentication,
  }) {
    return successfulAuthentication?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? getAuthRequest,
    TResult Function()? waitAuthCode,
    TResult Function()? exchangeAuthCode,
    TResult Function(String? qr)? setupMFA,
    TResult Function()? askTOTP,
    TResult Function(String url)? redirect,
    TResult Function(OAuthMfaResponse response)? promptUpdatePassword,
    TResult Function(dynamic data)? passwordExpired,
    TResult Function(OAuthMfaResponse response, String username)?
        changePassword,
    TResult Function()? introspect,
    TResult Function()? expired,
    TResult Function()? logOut,
    TResult Function(AppException exception)? failure,
    TResult Function(String statusCode, String? message)? error,
    TResult Function(dynamic data)? success,
    TResult Function(dynamic data)? successfulAuthorizationRequest,
    TResult Function(dynamic data)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (successfulAuthentication != null) {
      return successfulAuthentication(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(GettingAuthRequest value) getAuthRequest,
    required TResult Function(WaitingAuthCode value) waitAuthCode,
    required TResult Function(ExchangingAuthCode value) exchangeAuthCode,
    required TResult Function(SetupMfa value) setupMFA,
    required TResult Function(AskTOTP value) askTOTP,
    required TResult Function(Redirect value) redirect,
    required TResult Function(PromptUpdatePassword value) promptUpdatePassword,
    required TResult Function(PasswordExpired value) passwordExpired,
    required TResult Function(ChangePassword value) changePassword,
    required TResult Function(Introspecting value) introspect,
    required TResult Function(Expired value) expired,
    required TResult Function(LoggedOut value) logOut,
    required TResult Function(Failure value) failure,
    required TResult Function(Error value) error,
    required TResult Function(Success value) success,
    required TResult Function(SuccessfulAuthorization value)
        successfulAuthorizationRequest,
    required TResult Function(SuccessfulAuthentication value)
        successfulAuthentication,
  }) {
    return successfulAuthentication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(GettingAuthRequest value)? getAuthRequest,
    TResult? Function(WaitingAuthCode value)? waitAuthCode,
    TResult? Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult? Function(SetupMfa value)? setupMFA,
    TResult? Function(AskTOTP value)? askTOTP,
    TResult? Function(Redirect value)? redirect,
    TResult? Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult? Function(PasswordExpired value)? passwordExpired,
    TResult? Function(ChangePassword value)? changePassword,
    TResult? Function(Introspecting value)? introspect,
    TResult? Function(Expired value)? expired,
    TResult? Function(LoggedOut value)? logOut,
    TResult? Function(Failure value)? failure,
    TResult? Function(Error value)? error,
    TResult? Function(Success value)? success,
    TResult? Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult? Function(SuccessfulAuthentication value)? successfulAuthentication,
  }) {
    return successfulAuthentication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(GettingAuthRequest value)? getAuthRequest,
    TResult Function(WaitingAuthCode value)? waitAuthCode,
    TResult Function(ExchangingAuthCode value)? exchangeAuthCode,
    TResult Function(SetupMfa value)? setupMFA,
    TResult Function(AskTOTP value)? askTOTP,
    TResult Function(Redirect value)? redirect,
    TResult Function(PromptUpdatePassword value)? promptUpdatePassword,
    TResult Function(PasswordExpired value)? passwordExpired,
    TResult Function(ChangePassword value)? changePassword,
    TResult Function(Introspecting value)? introspect,
    TResult Function(Expired value)? expired,
    TResult Function(LoggedOut value)? logOut,
    TResult Function(Failure value)? failure,
    TResult Function(Error value)? error,
    TResult Function(Success value)? success,
    TResult Function(SuccessfulAuthorization value)?
        successfulAuthorizationRequest,
    TResult Function(SuccessfulAuthentication value)? successfulAuthentication,
    required TResult orElse(),
  }) {
    if (successfulAuthentication != null) {
      return successfulAuthentication(this);
    }
    return orElse();
  }
}

abstract class SuccessfulAuthentication implements OAuthState {
  const factory SuccessfulAuthentication({final dynamic data}) =
      _$SuccessfulAuthentication;

  dynamic get data;
  @JsonKey(ignore: true)
  _$$SuccessfulAuthenticationCopyWith<_$SuccessfulAuthentication>
      get copyWith => throw _privateConstructorUsedError;
}
