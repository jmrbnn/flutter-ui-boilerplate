import 'package:dio/dio.dart';
import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_refresh_token_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/shared/auth_providers.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/data/remote/dio_network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauth2/oauth2.dart';
import 'package:url_launcher/url_launcher_string.dart';

final netwokServiceProvider = Provider<DioNetworkService>(
  (ref) {
    final Dio dio = Dio();

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      Credentials? credentials = EmpAuth().credentials;

      options.headers['Authorization'] = 'Bearer ${credentials?.accessToken}';
      handler.next(options);
    }, onError: (e, handler) async {
      GeneralUtils.isolateDebug(
          '${e.response?.data['message'].toString()} : ${e.response?.statusCode}');
      if ((e.response?.statusCode != null && e.response?.statusCode == 401) &&
          e.type == DioExceptionType.badResponse) {
        await _refreshToken(ref, dio);
      }
      if (e.response?.statusCode != null &&
          e.response?.statusCode == 400 &&
          e.response?.data?['message'] == 'Token is not active') {
        _logout(ref, dio);
      }
      handler.next(e);
    }));

    return DioNetworkService(dio);
  },
);

_logout(ref, Dio dio) async {
  Uri revocationEndpointGet = Uri.parse(
      '${EmpAuth().kcAuthenticationUrl}/v1/auth/protocol/openid-connect/logout');

  String query = Uri(
      queryParameters: GeneralUtils.cleanMap({
    'client_id': EmpAuth().clientId,
    'client_secret': EmpAuth().clientSecret,
    'redirect_uri': EmpAuth().logoutUrl,
  })).query;

  launchUrlString(
    '${revocationEndpointGet.toString()}?$query',
    mode: LaunchMode.inAppWebView,
    webOnlyWindowName: '_self',
  );
  await ref.watch(credentialsStorageProvider).clear();
}

_refreshToken(ref, Dio dio) async {
  Credentials? credentials = await ref.watch(credentialsStorageProvider).read();
  OAuthRefreshTokenParameters parameters = OAuthRefreshTokenParameters(
    refreshToken: credentials?.refreshToken,
    grantType: 'refresh_token',
    clientId: EmpAuth().clientId,
    clientSecret: EmpAuth().clientSecret,
    scope: 'openid',
  );

  try {
    Response response = await dio.post(
      '${EmpAuth().kcAuthenticationUrl}/v1/auth/protocol/openid-connect/token',
      data: DsUtils.cleanMap(parameters.toJson()),
    );
    EmpAuth().setCredentials(response.data['response']);
  } catch (e) {
    GeneralUtils.isolateDebug(e);
  }
}
