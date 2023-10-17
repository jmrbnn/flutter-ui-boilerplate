import 'package:dio/dio.dart';
import 'package:emp_ai_auth/core/shared/identity_infrastructure/credentials_storage/credentials_storage.dart';
import 'package:emp_ai_auth/core/shared/identity_infrastructure/credentials_storage/secured_credentials_storage.dart';
import 'package:emp_ai_auth/core/shared/identity_infrastructure/identity_authenticator.dart';
import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/state/auth_notifier.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/state/auth_state.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_login_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:oauth2/oauth2.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:uuid/uuid.dart';

final flutterSecureStorageProvider =
    Provider((ref) => const FlutterSecureStorage());

final dioProvider = Provider((ref) async {
  final dio = Dio();

  Credentials? credentials =
      await ref.read(authNotifierProvider.notifier).getSignedInCredentials();
  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    GeneralUtils.isolateDebug(credentials?.toJson().toString());

    options.headers['Authorization'] = 'Bearer ${credentials?.accessToken}';
    handler.next(options);
  }, onError: (e, handler) {
    if ((e.response?.statusCode != null && e.response?.statusCode == 401) &&
        e.type == DioExceptionType.badResponse) {
      // ref
      //     .watch(authNotifierProvider.notifier)
      //     .refresh(refreshToken: credentials?.refreshToken);
    }

    if (e.response?.statusCode != null &&
        e.response?.statusCode == 400 &&
        (e.response?.data?['message'] == 'Token is not active' ||
            e.response?.data?['message'] == 'Session not active')) {
      _logout(ref, dio);
    }
    handler.next(e);
  }));

  return dio;
});

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

final credentialsStorageProvider = Provider<CredentialsStorage>(
  (ref) => SecuredCredentialsStorage(
    ref.watch(flutterSecureStorageProvider),
  ),
);

final identityAuthenticatorProvider = Provider(
  (ref) => IdentityAuthenticator(
    ref.watch(credentialsStorageProvider),
    // ref.watch(dioProvider),
    ref.watch(oAuthRepositoryProvider),
  ),
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    ref.watch(identityAuthenticatorProvider),
    ref.watch(credentialsStorageProvider),
  ),
);
