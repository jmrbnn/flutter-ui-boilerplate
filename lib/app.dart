import 'dart:async';

import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/state/auth_notifier.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/state/auth_state.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_login_providers.dart';
import 'package:emp_ai_auth/features/auth/shared/auth_providers.dart';
import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_flutter_boilerplate/main.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/router/router_config.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/widgets/stream_controller_provider.dart';
import 'package:emp_ai_flutter_boilerplate/src/main/app_env.dart';
import 'package:emp_ai_flutter_boilerplate/src/main/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MiniAppManager extends ConsumerStatefulWidget {
  const MiniAppManager({super.key});

  @override
  ConsumerState<MiniAppManager> createState() => _MiniAppManagerState();
}

class _MiniAppManagerState extends ConsumerState<MiniAppManager> {
  final _streamController = StreamController.broadcast();

  @override
  void initState() {
    super.initState();

    _streamController.add('JS Interop bridge available');

    Map params = getUriParameters();

    // Update theme based on clientId
    if (params['client_id'] != null || EnvInfo.keyCloakClientId != null) {
      Future.delayed(const Duration(microseconds: 100), () {
        DsUtils.changeThemeData(
          ref,
          params['client_id'] ?? EnvInfo.keyCloakClientId,
        );
      });
    }

    auth.initialize(
      clientId: Env.kcClientId,
      clientSecret: Env.kcClientSecret,
      kcAuthenticationUrl: Env.kcAuthenticationUrl,
      kcUserUrl: Env.kcUserUrl,
      kcAuthorizationUrl: Env.kcAuthorizationUrl,
      redirectUrl:
          'https://emp-identity-management.playground.emaptagtsrnd.xyz/#/callback',
      logoutUrl: Uri.base.origin,
      remindDaysBeforePasswordExpiry: 15,
    );

    auth.initializeTimeoutListener(onAppFocusTimeout: () {
      GeneralUtils.isolateDebug('onAppFocusTimeout');
    }, onUserInactivityTimeout: () {
      GeneralUtils.isolateDebug('onUserInactivityCallback');
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      authNotifierProvider.select((value) => value),
      ((previous, next) {
        if (next is Authenticated) {
          ref.watch(identityProvider.notifier).update(next.identity);
        }
      }),
    );

    final themeMode = ref.watch(themeModeProvider);
    final themeLight = ref.watch(lightThemeProvider);
    final themeDark = ref.watch(darkThemeProvider);
    return StreamControllerProvider(
      streamController: _streamController,
      child: ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 960, name: TABLET),
          const Breakpoint(start: 961, end: double.infinity, name: DESKTOP),
        ],
        child: SessionTimeoutManager(
          sessionConfig: EmpAuth().sessionConfig,
          child: MaterialApp.router(
            title: EnvInfo.appName,
            routerConfig: ref.read(goRouterProvider),
            themeMode: themeMode,
            theme: themeLight,
            darkTheme: themeDark,
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
