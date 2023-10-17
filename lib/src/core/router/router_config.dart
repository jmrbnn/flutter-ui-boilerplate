// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';

import 'package:emp_ai_auth/core/shared/identity_infrastructure/entities/identity_introspect.dart';
import 'package:emp_ai_auth/core/shared/utils/oauth_utils.dart';
import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_auth/features/auth/presentation/screen/auth_screen.dart';
import 'package:emp_ai_auth/features/auth/presentation/screen/oauth_callback_screen.dart';
import 'package:emp_ai_auth/features/auth/shared/auth_providers.dart';
import 'package:emp_ai_ds/widgets/layout/dashboard/navigation.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/router/routers.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/domain/models/route_info.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/change-password/presentation/screens/change_password_screen.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/riverpod-demo/presentation/screen/riverpod_demo_screen.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/weather-demo/presentation/screens/weather_demo.dart';
import 'package:emp_ai_flutter_boilerplate/src/main/app_env.dart';
import 'package:emp_ai_flutter_boilerplate/src/main/presentation/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oauth2/oauth2.dart';

IdentityInstrospect? identity;
Credentials? credentials;

final goRouterProvider = Provider((ref) {
  return RouteManager(ref: ref).init();
});

bool shouldBeAuthenticated(String? checkUrl) {
  for (Routes route in Routes.values) {
    if (route.url == checkUrl && route.authenticated) {
      return true;
    }
  }
  return false;
}

class RouteManager {
  final ProviderRef<Object?> ref;

  RouteManager({required this.ref});

  GoRouter init() {
    return GoRouter(
      initialLocation: Routes.home.url,
      routes: _routes(ref),
      redirect: (context, state) async {
        // Extract the current route
        var currentRoute = state.fullPath;

        identity = await ref.read(authNotifierProvider.notifier).getIdentity();
        EmpAuth().setIdentity(identity);

        credentials =
            await ref.read(authNotifierProvider.notifier).getCredentials();
        EmpAuth().setCredentials(credentials);

        // Check if the route requires authentication
        if (shouldBeAuthenticated(currentRoute)) {
          await ref
              .read(authNotifierProvider.notifier)
              .checkAndUpdateAuthStatus();

          // Check if the user is authenticated
          if (!await ref.read(authNotifierProvider.notifier).isSignedIn()) {
            // If the user is not authenticated, redirect to the login page
            return Routes.auth.url;
          }
        }
        // If no issues, allow navigation
        return null;
      },
    );
  }

  _routes(ProviderRef<Object?> ref) => [
        GoRoute(
          path: Routes.auth.url,
          name: Routes.auth.name,
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: const AuthScreen(),
            );
          },
        ),
        GoRoute(
          path: Routes.home.url,
          name: Routes.home.name,
          pageBuilder: (context, state) {
            return getScaffold(
              const DashboardScreen(),
              key: state.pageKey,
              isDashboard: shouldBeAuthenticated(Routes.home.url),
              state: state,
              ref: ref,
            );
          },
        ),
        GoRoute(
          path: Routes.riverpodDemo.url,
          name: Routes.riverpodDemo.name,
          pageBuilder: (context, state) {
            return getScaffold(
              const RiverpodDemoScreen(),
              key: state.pageKey,
              isDashboard: shouldBeAuthenticated(Routes.riverpodDemo.url),
              state: state,
              ref: ref,
            );
          },
        ),
        GoRoute(
          path: Routes.weatherDemo.url,
          name: Routes.weatherDemo.name,
          pageBuilder: (context, state) {
            return getScaffold(
              const WeatherDemoScreen(),
              key: state.pageKey,
              isDashboard: shouldBeAuthenticated(Routes.weatherDemo.url),
              state: state,
              ref: ref,
            );
          },
        ),
        GoRoute(
          path: Routes.changePassword.url,
          name: Routes.changePassword.name,
          pageBuilder: (context, state) {
            return getScaffold(
              key: state.pageKey,
              const ChangePasswordScreen(),
              isDashboard: shouldBeAuthenticated(Routes.changePassword.url),
              state: state,
              ref: ref,
            );
          },
        ),
        GoRoute(
          path: Routes.callback.url,
          name: Routes.callback.name,
          pageBuilder: (context, state) {
            return getScaffold(
              key: state.pageKey,
              const OAuthCallbackScreen(),
              isDashboard: shouldBeAuthenticated(Routes.callback.url),
              state: state,
              ref: ref,
            );
          },
        ),
      ];
}

dynamic getScaffold(
  Widget body, {
  required LocalKey key,
  bool isDashboard = false,
  IdentityInstrospect? identity,
  required GoRouterState state,
  required ProviderRef<Object?> ref,
}) {
  Widget child = FutureBuilder(
      future: getIdentity(ref),
      builder: (context, snapshot) {
        return ScaffoldWithNavigation(
          appTitle: EnvInfo.appName,
          body: body,
          authenticated: isDashboard,
          navigationItems: OAuthUtils.isRealmAdmin()
              ? routeList
              : routeList
                  .where((element) => !element.isRealmTenantMenu)
                  .toList(),
          state: state,
          identity: snapshot.hasData
              ? (snapshot.data as IdentityInstrospect).toJson()
              : null,
          navbarProfileMenu: getNavbarProfileMenu(
            ref: ref,
            identity: identity,
          ),
        );
      });
  return isDashboard
      ? FadeTransitionPage(
          key: state.pageKey,
          child: child,
        )
      : MaterialPage(
          key: state.pageKey,
          child: child,
        );
}

List<PopupMenuItem> getNavbarProfileMenu({
  required ProviderRef<Object?> ref,
  IdentityInstrospect? identity,
}) {
  return [
    PopupMenuItem(
      child: const Text(
        'Change password',
      ),
      onTap: () => window.location.href = '/#${Routes.changePassword.url}',
    ),
    PopupMenuItem(
      child: const Text(
        'Sign out',
      ),
      onTap: () => ref.watch(authNotifierProvider.notifier).signOut(),
    ),
  ];
}

Future<dynamic> getIdentity(
  ProviderRef<Object?> ref,
) async {
  identity = await ref.read(authNotifierProvider.notifier).getIdentity();
  return identity;
}

class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
            key: key,
            transitionsBuilder: (c, animation, a1, child) => FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ),
            child: child);

  static final _curveTween = CurveTween(curve: Curves.easeIn);
}
