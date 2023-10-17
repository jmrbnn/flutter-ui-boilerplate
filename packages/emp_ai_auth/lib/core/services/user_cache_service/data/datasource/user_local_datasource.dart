import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:emp_ai_auth/core/shared/data/local/storage_service.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/core/shared/globals.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_access_token_response_model.dart';

abstract class UserDataSource {
  String get storageKey;

  // Future<Either<AppException, User>> fetchUser();
  // Future<bool> saveUser({required User user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
  Future<void> clearOAuthCache();
  Future<bool> saveOAuthToken(OAuthAccessTokenResponse response);
  Future<bool> saveOAuthCodeVerifier(String codeVerifier);
  Future<bool> saveOAuthCode(String code);
  Future<bool> saveOAuthState(String state);
  Future<Either<AppException, String>> getOAuthCodeVerifier();
  Future<Either<AppException, String>> getOAuthCode();
  Future<Either<AppException, String>> getOAuthState();
  Future<Either<AppException, OAuthAccessTokenResponse>> getOAuthToken();
}

class UserLocalDatasource extends UserDataSource {
  UserLocalDatasource(this.storageService);

  final StorageService storageService;

  @override
  String get storageKey => USER_LOCAL_STORAGE_KEY;
  String get oAuthCodeVerifierStorageKey => OAUTH_CODE_VERIFIER_STORAGE_KEY;
  String get oAuthCodeStorageKey => OAUTH_CODE_STORAGE_KEY;
  String get oAuthStateStorageKey => OAUTH_STATE_STORAGE_KEY;
  String get oAuthAccessTokenResponseStorageKey =>
      OAUTH_ACCESS_TOKEN_RESPONSE_STORAGE_KEY;

  // @override
  // Future<Either<AppException, User>> fetchUser() async {
  //   final data = await storageService.get(storageKey);
  //   if (data == null) {
  //     return Left(
  //       AppException(
  //         identifier: 'UserLocalDatasource',
  //         statusCode: 404,
  //         message: 'User not found',
  //       ),
  //     );
  //   }
  //   final userJson = jsonDecode(data.toString());

  //   return Right(User.fromJson(userJson));
  // }

  // @override
  // Future<bool> saveUser({required User user}) async {
  //   return await storageService.set(storageKey, jsonEncode(user.toJson()));
  // }

  @override
  Future<bool> deleteUser() async {
    await storageService.clear();
    return await storageService.remove(oAuthCodeStorageKey);
  }

  @override
  Future<bool> hasUser() async {
    return await storageService.has(oAuthCodeStorageKey);
  }

  @override
  Future<void> clearOAuthCache() async {
    await storageService.clear();
    await storageService.remove(oAuthCodeStorageKey);
    await storageService.remove(oAuthCodeVerifierStorageKey);
    await storageService.remove(oAuthStateStorageKey);
  }

  @override
  Future<bool> saveOAuthCodeVerifier(String codeVerifier) async {
    return await storageService.set(oAuthCodeVerifierStorageKey, codeVerifier);
  }

  @override
  Future<bool> saveOAuthCode(String code) async {
    return await storageService.set(oAuthCodeStorageKey, code);
  }

  @override
  Future<bool> saveOAuthState(String state) async {
    return await storageService.set(oAuthStateStorageKey, state);
  }

  @override
  Future<Either<AppException, String>> getOAuthCodeVerifier() async {
    final data = await storageService.get(oAuthCodeVerifierStorageKey);
    if (data == null) {
      return Left(
        AppException(
          identifier: 'UserLocalDatasource',
          statusCode: 404,
          message: 'Code verifier not found',
        ),
      );
    }

    return Right(data.toString());
  }

  @override
  Future<Either<AppException, String>> getOAuthCode() async {
    final data = await storageService.get(oAuthCodeStorageKey);
    if (data == null) {
      return Left(
        AppException(
          identifier: 'UserLocalDatasource',
          statusCode: 404,
          message: 'Auth code not found',
        ),
      );
    }

    return Right(data.toString());
  }

  @override
  Future<Either<AppException, String>> getOAuthState() async {
    final data = await storageService.get(oAuthStateStorageKey);
    if (data == null) {
      return Left(
        AppException(
          identifier: 'UserLocalDatasource',
          statusCode: 404,
          message: 'State not found',
        ),
      );
    }

    return Right(data.toString());
  }

  @override
  Future<bool> saveOAuthToken(OAuthAccessTokenResponse response) async {
    return await storageService.set(
      oAuthAccessTokenResponseStorageKey,
      json.encode(response.toJson()),
    );
  }

  @override
  Future<Either<AppException, OAuthAccessTokenResponse>> getOAuthToken() async {
    final data = await storageService.get(oAuthAccessTokenResponseStorageKey);
    if (data == null) {
      return Left(
        AppException(
          identifier: 'UserLocalDatasource',
          statusCode: 404,
          message: 'Accesss token response not found',
        ),
      );
    }
    return Right(OAuthAccessTokenResponse.fromJson(
        jsonDecode(json.decode(jsonEncode(data)))));
  }
}
