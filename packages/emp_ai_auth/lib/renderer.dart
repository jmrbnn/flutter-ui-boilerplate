// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MiniAppManager extends ConsumerStatefulWidget {
  final Widget? child;
  const MiniAppManager({super.key, this.child});

  @override
  ConsumerState<MiniAppManager> createState() => _MiniAppManagerState();
}

class _MiniAppManagerState extends ConsumerState<MiniAppManager> {
  @override
  void initState() {
    super.initState();
    EmpAuth inst_ = EmpAuth();
    // Update theme based on clientId
    Future.delayed(const Duration(microseconds: 100), () {
      DsUtils.changeThemeData(
        ref,
        inst_.clientId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    final themeLight = ref.watch(lightThemeProvider);
    final themeDark = ref.watch(darkThemeProvider);

    return ResponsiveBreakpoints.builder(
      breakpoints: [
        const Breakpoint(start: 0, end: 450, name: MOBILE),
        const Breakpoint(start: 451, end: 960, name: TABLET),
        const Breakpoint(start: 961, end: double.infinity, name: DESKTOP),
      ],
      child: MaterialApp(
        themeMode: themeMode,
        theme: themeLight,
        darkTheme: themeDark,
        debugShowCheckedModeBanner: false,
        home: widget.child,
      ),
    );
  }
}
