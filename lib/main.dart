// ignore_for_file: depend_on_referenced_packages

import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_flutter_boilerplate/app.dart';
import 'package:emp_ai_flutter_boilerplate/src/main/app_env.dart';
import 'package:emp_ai_flutter_boilerplate/src/main/observers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => mainCommon(AppEnvironment.DEV);

EmpAuth auth = EmpAuth();

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  EnvInfo.initialize(environment);
  configureApp();
  runApp(ProviderScope(
    observers: [
      Observers(),
    ],
    child: const MiniAppManager(),
  ));
}

void configureApp() {
  // Disabled for now because of cloudfront configuration
  // if (kIsWeb) {
  //   usePathUrlStrategy();
  // }
}
