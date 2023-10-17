// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/domain/providers/pretty_dio_logger.dart';
import 'package:emp_ai_flutter_boilerplate/src/main/app_env.dart';
import 'package:flutter/foundation.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/data/remote/network_service.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/domain/models/response.dart'
    as response;
import 'package:emp_ai_flutter_boilerplate/src/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/globals.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/mixins/exception_handler_mixin.dart';

import 'package:url_launcher/url_launcher_string.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;

  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: !EnvInfo.isProduction,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: _maxLineWidth);

  DioNetworkService(this.dio) {
    // this throws error while running test
    if (!kTestMode) {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors.add(_prettyDioLogger);
        // dio.interceptors
        //     .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        extra: {
          'withCredentials': true,
        },
      );
  @override
  String get baseUrl => EnvInfo.keycloakAuthenticationUrl;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    if (!kTestMode) {
      dio.options.headers = header;
    }
    return header;
  }

  @override
  Future<Either<AppException, response.Response>> post(String endpoint,
      {dynamic data}) {
    final res = handleException(
      () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<bool, bool>> openUrl(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      String url = endpoint + Uri(queryParameters: queryParameters).toString();
      // js.context.callMethod('open', [url, '_self']);
      await launchUrlString(url, mode: LaunchMode.platformDefault);

      return const Right(true);
    } catch (e) {
      return const Left(false);
    }
  }

  @override
  Future<Either<AppException, response.Response>> delete(
    String endpoint, {
    Map<String, dynamic>? data,
  }) {
    final res = handleException(
      () => dio.delete(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> patch(
    String endpoint, {
    dynamic data,
  }) {
    final res = handleException(
      () => dio.patch(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> put(
    String endpoint, {
    dynamic data,
  }) {
    final res = handleException(
      () => dio.put(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
