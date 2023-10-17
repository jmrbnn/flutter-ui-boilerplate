// ignore_for_file: depend_on_referenced_packages

import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_mfa_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'oauth_state.freezed.dart';

@freezed
abstract class OAuthState with _$OAuthState {
  const factory OAuthState.idle() = Idle;
  const factory OAuthState.initial() = Initial;
  const factory OAuthState.loading() = Loading;

  const factory OAuthState.getAuthRequest() = GettingAuthRequest;
  const factory OAuthState.waitAuthCode() = WaitingAuthCode;
  const factory OAuthState.exchangeAuthCode() = ExchangingAuthCode;

  const factory OAuthState.setupMFA({String? qr}) = SetupMfa;
  const factory OAuthState.askTOTP() = AskTOTP;
  const factory OAuthState.redirect({required String url}) = Redirect;
  const factory OAuthState.promptUpdatePassword(
      {required OAuthMfaResponse response}) = PromptUpdatePassword;
  const factory OAuthState.passwordExpired({required dynamic data}) =
      PasswordExpired;
  const factory OAuthState.changePassword(
      {required OAuthMfaResponse response,
      required String username}) = ChangePassword;

  const factory OAuthState.introspect() = Introspecting;
  const factory OAuthState.expired() = Expired;
  const factory OAuthState.logOut() = LoggedOut;
  const factory OAuthState.failure(AppException exception) = Failure;
  const factory OAuthState.error(String statusCode, String? message) = Error;
  const factory OAuthState.success({dynamic data}) = Success;
  const factory OAuthState.successfulAuthorizationRequest({dynamic data}) =
      SuccessfulAuthorization;
  const factory OAuthState.successfulAuthentication({dynamic data}) =
      SuccessfulAuthentication;
}
