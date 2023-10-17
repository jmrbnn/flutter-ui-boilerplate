import 'package:emp_ai_ds/constants/themes/default/default_theme.dart';

import 'package:emp_ai_ds/constants/themes/default/default_theme_constants.dart';
import 'package:emp_ai_ds/entities/theme_config.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeServiceGetx extends GetxService {
  Rx<ThemeData> themeDark = ThemeData().obs;
  Rx<ThemeData> theme = ThemeData().obs;

  RxBool isDarkMode = false.obs;
  Rx<ThemeConfig?> configuration = null.obs;

  void initThemes(BuildContext context) {
    getInitialTheme(context: context);
    getInitialTheme(context: context, isDark: true);
  }

  ThemeData getInitialTheme(
      {bool isDark = false, required BuildContext context}) {
    if (isDark) {
      themeDark(buildDefaultTheme(
        config: DefaultTheme.config,
        brightness: Brightness.dark,
        context: context,
      ));
      return themeDark.value;
    }

    theme(buildDefaultTheme(
      config: DefaultTheme.config,
      brightness: Brightness.light,
      context: context,
    ));
    return theme.value;
  }
}
