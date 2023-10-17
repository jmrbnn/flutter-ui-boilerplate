import 'package:dio/dio.dart';
import 'package:emp_ai_auth/core/shared/data/remote/dio_network_service.dart';
import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_access_token_response_model.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_refresh_token_parameters_model.dart';
import 'package:emp_ai_auth/features/auth/shared/auth_providers.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauth2/oauth2.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:uuid/uuid.dart';

final netwokServiceProvider = Provider<DioNetworkService>(
  (ref) {
    final Dio dio = Dio();

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      Credentials? credentials =
          await ref.watch(credentialsStorageProvider).read();

      options.headers['Authorization'] = 'Bearer ${credentials?.accessToken}';
      handler.next(options);
    }, onError: (e, handler) async {
      // GeneralUtils.isolateDebug(e.response?.data['message'].toString());
      if ((e.response?.statusCode != null && e.response?.statusCode == 401) &&
          e.type == DioExceptionType.badResponse) {
        await _refreshToken(ref, dio);
      }
      if (e.response?.statusCode != null &&
          e.response?.statusCode == 400 &&
          (e.response?.data?['message'] == 'Token is not active' ||
              e.response?.data?['message'] == 'Session not active')) {
        _logout(ref, dio);
      }
      handler.next(e);
    }));

    return DioNetworkService(dio);
  },
);

_logout(ref, Dio dio) async {
  // await dio.post('${authInstance.kcAuthenticationUrl}/v1/logout');

  ref.read(credentialsStorageProvider).put('session_state', const Uuid().v4());
  if (kIsWeb) {
    launchUrlString(
      '${EmpAuth().logoutUrl}',
      mode: LaunchMode.inAppWebView,
      webOnlyWindowName: '_self',
    );
  }

  await ref.read(credentialsStorageProvider).clear();

  if (EmpAuth.instance.onSuccessfulLogout != null) {
    EmpAuth.instance.onSuccessfulLogout!();
  }
}

_refreshToken(ref, Dio dio) async {
  Credentials? credentials = EmpAuth().credentials;
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

    OAuthAccessTokenResponse resp =
        OAuthAccessTokenResponse.fromJson(response.data['result']);

    Credentials creds = Credentials(
      resp.accessToken ?? '',
      refreshToken: resp.refreshToken,
      idToken: resp.idToken,
      tokenEndpoint: Uri.parse(
          '${EmpAuth().kcAuthenticationUrl}/v1/auth/protocol/openid-connect/token'),
      scopes: ['openid'],
      expiration: DateTime.now().add(
        Duration(seconds: resp.expiresIn ?? 0),
      ),
    );

    EmpAuth().setCredentials(response.data['response']);
    ref.watch(credentialsStorageProvider).save(creds);
  } catch (e) {
    GeneralUtils.isolateDebug(e);
  }
}
