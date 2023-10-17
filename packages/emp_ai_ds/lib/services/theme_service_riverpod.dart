import 'package:emp_ai_ds/constants/themes/default/default_theme.dart';
import 'package:emp_ai_ds/constants/themes/default/default_theme_constants.dart';
import 'package:emp_ai_ds/entities/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
    (ref) => ThemeModeNotifier());

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.light);

  void toggleTheme() {
    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.light;
    }
  }
}

// final themeServiceProvider =
//     Provider<ThemeServiceRiverpod>((ref) => ThemeServiceRiverpod());

// class ThemeServiceRiverpod {
//   ThemeData themeDark = ThemeData();
//   ThemeData theme = ThemeData();
//   bool isDarkMode = false;
//   ThemeConfig? configuration;
//   ThemeMode themeMode = ThemeMode.system;

//   handleBrightnessChange(WidgetRef ref) {
//     isDarkMode = !isDarkMode;
//     themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
//     if (kDebugMode) {
//       print(themeMode);
//     }
//   }

//   void initThemes(BuildContext context) {
//     getInitialTheme(context: context);
//     getInitialTheme(context: context, isDark: true);
//   }

//   ThemeData getInitialTheme(
//       {bool isDark = false, required BuildContext context}) {
//     if (isDark) {
//       themeDark = buildDefaultTheme(
//         config: DefaultTheme.config,
//         brightness: Brightness.dark,
//         context: context,
//       );
//       return themeDark;
//     }

//     theme = buildDefaultTheme(
//       config: DefaultTheme.config,
//       brightness: Brightness.light,
//       context: context,
//     );
//     return theme;
//   }
// }

final themeConfigProvider =
    StateNotifierProvider<ThemeConfigNotifier, ThemeConfig>(
        (ref) => ThemeConfigNotifier(DefaultTheme.config));

class ThemeConfigNotifier extends StateNotifier<ThemeConfig> {
  ThemeConfigNotifier(ThemeConfig config) : super(config);

  void update(ThemeConfig config) {
    state = config;
  }
}

final isCustomThemeProvider =
    StateNotifierProvider<IsCustomThemeNotifier, bool>(
        (ref) => IsCustomThemeNotifier(false));

class IsCustomThemeNotifier extends StateNotifier<bool> {
  IsCustomThemeNotifier(bool boolean) : super(true);

  void toggle(bool isCustom) {
    state = isCustom;
  }
}

final lightThemeProvider = StateNotifierProvider<LightThemeNotifier, ThemeData>(
  (ref) => LightThemeNotifier(
    // ThemeData.light(useMaterial3: true),
    buildDefaultTheme(
      config: DefaultTheme.config,
      brightness: Brightness.light,
    ),
  ),
);

class LightThemeNotifier extends StateNotifier<ThemeData> {
  LightThemeNotifier(ThemeData data) : super(data); // Starts with light theme

  void updateTheme(ThemeData newTheme) {
    state = newTheme;
  }
}

final darkThemeProvider = StateNotifierProvider<DarkThemeNotifier, ThemeData>(
  (ref) => DarkThemeNotifier(
    // ThemeData.light(useMaterial3: true),
    buildDefaultTheme(
      config: DefaultTheme.config,
      brightness: Brightness.dark,
    ),
  ),
);

class DarkThemeNotifier extends StateNotifier<ThemeData> {
  DarkThemeNotifier(ThemeData data) : super(data); // Starts with light theme

  void updateTheme(ThemeData newTheme) {
    state = newTheme;
  }
}

final colorProvider =
    StateNotifierProvider<ThemeColorNotifier, ColorRolesConfig>(
  (ref) => ThemeColorNotifier(
      DefaultTheme.config.lightColorRoles ?? ColorRolesConfig.fromJson({})),
);

class ThemeColorNotifier extends StateNotifier<ColorRolesConfig> {
  ThemeColorNotifier(ColorRolesConfig data) : super(data);

  void updateColor(ColorRolesConfig newColorRoles) {
    state = newColorRoles;
  }
}
