// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:emp_ai_auth/core/shared/data/remote/network_service.dart';
import 'package:emp_ai_auth/core/shared/domain/providers/pretty_dio_logger.dart';
import 'package:emp_ai_auth/core/shared/exceptions/http_exception.dart';
import 'package:emp_ai_auth/core/shared/globals.dart';
import 'package:emp_ai_auth/core/shared/mixins/exception_handler_mixin.dart';
import 'package:flutter/foundation.dart';

import 'package:emp_ai_auth/core/shared/domain/models/response.dart'
    as response;

import 'package:url_launcher/url_launcher_string.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;

  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: !kTestMode,
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

      // if (Platform.isAndroid || Platform.isIOS) {
      //   dio.interceptors.add(InterceptorsWrapper(
      //     onRequest: (options, handler) async {
      //       options.headers['cookie'] = await localData.read('cookie');

      //       return handler.next(options);
      //     },
      //     onResponse: (response, handler) {
      //       response.headers.forEach((name, values) async {
      //         if (name == HttpHeaders.setCookieHeader) {
      //           final cookieMap = <String, String>{};

      //           for (var c in values) {
      //             var key = '';
      //             var value = '';

      //             key = c.substring(0, c.indexOf('='));
      //             value = c.substring(key.length + 1, c.indexOf(';'));

      //             cookieMap[key] = value;
      //           }

      //           var cookiesFormatted = '';

      //           cookieMap.forEach(
      //               (key, value) => cookiesFormatted += '$key=$value; ');

      //           await localData.write('cookie', cookiesFormatted);

      //           return;
      //         }
      //       });

      //       return handler.next(response);
      //     },
      //   ));
      // }
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
  String get baseUrl => '';

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
      {Map<String, dynamic>? data}) {
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
}
