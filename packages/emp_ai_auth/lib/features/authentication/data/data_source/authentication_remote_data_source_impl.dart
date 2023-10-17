import 'package:dartz/dartz.dart';
import 'package:emp_ai_auth/core/shared/data/remote/network_service.dart';
import 'package:emp_ai_auth/core/shared/domain/models/response.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_auth/features/authentication/data/data_source/authentication_data_source.dart';
import 'package:emp_ai_auth/features/authentication/domain/entities/authentication_parameters_model.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:flutter/foundation.dart';

import '../../../auth/domain/entities/oauth/oauth_mfa_response_model.dart';

class AuthenticationRemoteDataSource implements AuthenticationDataSource {
  final NetworkService networkService;

  AuthenticationRemoteDataSource(this.networkService);

  final authInstance = EmpAuth.instance;

  @override
  Future<Either<AppException, Response>> login(
      AuthenticationParameters parameters) async {
    try {
      final eitherType = await networkService.post(
        '${authInstance.kcAuthenticationUrl}/v1/auth/protocol/openid-connect/auth',
        data: DsUtils.cleanMap(
          parameters.toJson(),
        ),
      );

      return eitherType.fold(
        (exception) {
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

          return Right(response);
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
}
