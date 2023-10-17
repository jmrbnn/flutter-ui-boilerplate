import 'package:dartz/dartz.dart';
import 'package:emp_ai_auth/core/shared/data/remote/network_service.dart';
import 'package:emp_ai_auth/core/shared/domain/models/response.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/core/shared/identity_infrastructure/entities/identity_introspect.dart';
import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_auth/features/auth/data/datasource/oauth_data_source.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_authorization_request_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_introspection_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_mfa_response_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_password_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_refresh_token_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_token_parameters_model.dart';
import 'package:emp_ai_auth/features/change-password/domain/entities/change_password_parameters_model.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/entities/forgot_password_parameters_model.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/entities/forgot_password_set_password_parameters.dart';
import 'package:emp_ai_auth/features/forgot-password/domain/entities/forgot_password_verify_code_parameters.dart';
import 'package:emp_ai_auth/features/set-password/domain/entities/set_password_parameters_model.dart';
import 'package:emp_ai_ds/utils/utils.dart';

import 'package:flutter/foundation.dart';

class OAuthUserRemoteDataSource implements OAuthUserDataSource {
  final NetworkService networkService;

  OAuthUserRemoteDataSource(this.networkService);

  final authInstance = EmpAuth.instance;

  @override
  Future<Either<AppException, OAuthMfaResponse>> oAuthLoginUser(
      OAuthParameters parameters) async {
    try {
      final eitherType = await networkService.post(
        '${authInstance.kcAuthenticationUrl}/v1/auth/protocol/openid-connect/auth',
        data: DsUtils.cleanMap(
          parameters.toJson(),
        ),
      );

      return eitherType.fold(
        (exception) {
          GeneralUtils.isolateDebug(exception.toString());
          GeneralUtils.isolateDebug("ARI KO DI");
          return Left(exception);
        },
        (response) async {
          // print(Uri.decodeFull(response.data['result']['url']));

          // Codec<String, String> stringToBase64 = utf8.fuse(base64);
          // String url = response.data['result']['url'];
          OAuthMfaResponse response_ =
              OAuthMfaResponse.fromJson(response.data['result']);
          String authToken = Uri.decodeFull(
              Uri.dataFromString(response_.url).queryParameters['code'] ?? '');
          String authState = Uri.decodeFull(
              Uri.dataFromString(response_.url).queryParameters['state'] ?? '');
          // await networkService.openUrl(url);

          if (kDebugMode) {
            print('[DEBUG] AUTH URL: ${response_.url}');
            print('[DEBUG] AUTH CODE: $authToken');
            print('[DEBUG] AUTH STATE: $authState');
          }
          // update the token for requests
          networkService.updateHeader(
            {'Authorization': authToken},
          );

          return Right(response_);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()}\nOAuthUserRemoteDataSource.oAuthLoginUser',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Uri>> initOAuth(
      OAuthAuthorizationRequestParameters parameters) async {
    try {
      final uri = Uri.parse(
        '${authInstance.kcAuthenticationUrl}/v1/auth/protocol/openid-connect/auth',
      );
      final newUri =
          uri.replace(queryParameters: DsUtils.cleanMap(parameters.toJson()));
      return Right(newUri);
    } catch (e) {
      return Left(AppException(
        message: 'Unknown error occured',
        statusCode: 1,
        identifier: '${e.toString()}\nOAuthUserRemoteDataSource.initOAuth',
      ));
    }
  }

  @override
  Future<Either<AppException, Response>> introspectionOAuth(
      OAuthIntrospectionParameters parameters) async {
    try {
      final eitherType = await networkService.post(
        '${authInstance.kcAuthenticationUrl}/v1/auth/protocol/openid-connect/token/introspect',
        data: DsUtils.cleanMap(parameters.toJson()),
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) async {
          // update the token for requests
          // networkService.updateHeader(
          //   {'Authorization': user.token},
          // );

          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()}\nOAuthUserRemoteDataSource.introspectionOAuth',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Response>> exchangeAuthCode(
    OAuthTokenParameters parameters,
  ) async {
    try {
      final eitherType = await networkService.post(
        '${authInstance.kcAuthenticationUrl}/v1/auth/protocol/openid-connect/token',
        data: DsUtils.cleanMap(parameters.toJson()),
      );

      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) async {
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()}\nOAuthUserRemoteDataSource.exchangeAuthCode',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Response>> refreshTokenOAuth(
      OAuthRefreshTokenParameters parameters) async {
    try {
      final eitherType = await networkService.post(
        '${authInstance.kcAuthenticationUrl}/v1/auth/protocol/openid-connect/token',
        data: DsUtils.cleanMap(parameters.toJson()),
      );

      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) async {
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()}\nOAuthUserRemoteDataSource.refreshTokenOAuth',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Response>> oAuthPasswordLogin(
      OAuthPasswordParameters parameters) async {
    try {
      final eitherType = await networkService.post(
        '${authInstance.kcAuthenticationUrl}/v1/auth/protocol/openid-connect/token',
        data: DsUtils.cleanMap(parameters.toJson()),
      );

      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) async {
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()}\nOAuthUserRemoteDataSource.oAuthPasswordLogin',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Response>> oAuthLogoutUser() async {
    try {
      final eitherType = await networkService.post(
        '${authInstance.kcAuthenticationUrl}/v1/logout',
      );

      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) async {
          networkService.updateHeader({});
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()}\nOAuthUserRemoteDataSource.oAuthPasswordLogin',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Response>> setPassword(
    SetPasswordParameters parameters,
  ) async {
    try {
      final eitherType = await networkService.post(
        '${authInstance.kcUserUrl}/v1/set-password',
        data: DsUtils.cleanMap(parameters.toJson()),
      );

      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) async {
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()}\nOAuthUserRemoteDataSource.oAuthPasswordLogin',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Response>> checkCode(
    String code,
  ) async {
    try {
      final eitherType = await networkService.post(
        '${authInstance.kcUserUrl}/v1/verify-code',
        data: DsUtils.cleanMap({'code': code}),
      );

      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) async {
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()}\nOAuthUserRemoteDataSource.oAuthPasswordLogin',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Response>> changePassword(
      ChangePasswordParameters parameters) async {
    try {
      networkService.updateHeader(
        {'Authorization': 'Bearer ${parameters.accessToken}'},
      );

      final eitherType = await networkService.post(
        '${authInstance.kcUserUrl}/v1/change-password',
        data: DsUtils.cleanMap(parameters.toJson()),
      );

      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) async {
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()}\nOAuthUserRemoteDataSource.changePassword',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Response>> forgotPassword(
    ForgotPasswordParameter parameters,
  ) async {
    try {
      final eitherType = await networkService.post(
        '${authInstance.kcUserUrl}/v1/reset-password',
        data: DsUtils.cleanMap(parameters.toJson()),
      );

      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) async {
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()}\nOAuthUserRemoteDataSource.forgotPassword',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, OAuthMfaResponse>> setMfa(String code) async {
    try {
      final eitherType = await networkService.post(
        '${authInstance.kcAuthenticationUrl}/v1/set-mfa',
        data: DsUtils.cleanMap({'code': code}),
      );

      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) async {
          OAuthMfaResponse response_ =
              OAuthMfaResponse.fromJson(response.data['result']);
          return Right(response_);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()}\nOAuthUserRemoteDataSource.oAuthPasswordLogin',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, OAuthMfaResponse>> validateMfa(
      String code) async {
    try {
      final eitherType = await networkService.post(
        '${authInstance.kcAuthenticationUrl}/v1/validate-mfa',
        data: DsUtils.cleanMap({'code': code}),
      );

      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) async {
          OAuthMfaResponse response_ =
              OAuthMfaResponse.fromJson(response.data['result']);
          return Right(response_);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()}\nOAuthUserRemoteDataSource.oAuthPasswordLogin',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Response>> verifyForgotPasswordCode(
      ForgotPasswordVerifyCodeParameter parameter) async {
    try {
      final eitherType = await networkService.post(
        '${authInstance.kcUserUrl}/v1/verify-code',
        data: DsUtils.cleanMap({
          "verificationType": "code",
          ...parameter.toJson(),
        }),
      );

      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) async {
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()}\nOAuthUserRemoteDataSource.verifyForgotPasswordCode',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Response>> resetPassword(
      ForgotPasswordSetPasswordParameters parameter) async {
    try {
      final eitherType = await networkService.post(
        '${authInstance.kcUserUrl}/v1/set-password',
        data: DsUtils.cleanMap({
          "verificationType": "code",
          ...parameter.toJson(),
        }),
      );

      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) async {
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()}\nOAuthUserRemoteDataSource.resetPassword',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Response>> getPasswordPolicy() async {
    try {
      final eitherType = await networkService.post(
        '${authInstance.kcAuthenticationUrl}/v1/password-policy',
      );

      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) async {
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()}\nOAuthUserRemoteDataSource.getPasswordPolicy',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Response>> getTenantIdByClientId() async {
    try {
      IdentityInstrospect? identity = EmpAuth().identity;

      final eitherType = await networkService.get(
        '${authInstance.kcAuthorizationUrl}/v1/client/${identity?.azp}',
      );

      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) async {
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()}\nOAuthUserRemoteDataSource.getPasswordPolicy',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Response>> silentLogin(String url) async {
    try {
      final eitherType = await networkService.get(url);

      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) async {
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier: '${e.toString()}\nOAuthUserRemoteDataSource.silentLogin',
        ),
      );
    }
  }
}
