import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeConfig {
  String? name;
  String? logo;
  String? fontFamily;
  String? fontFamilyAlt;
  TextTheme Function([TextTheme?])? fontTheme;
  TextTheme Function([TextTheme?])? fontThemeAlt;
  double? borderRadius;
  double? buttonHeight;
  double? buttonPaddingX;
  double? buttonPaddingY;
  double? buttonSmallHeight;
  double? buttonSmallPaddingX;
  double? buttonSmallPaddingY;
  double? inputContentPaddingX;
  double? inputContentPaddingY;
  ColorScheme? lightColorScheme;
  ColorScheme? darkColorScheme;
  ColorRolesConfig? lightColorRoles;
  ColorRolesConfig? darkColorRoles;
  ColorPalette? colorPalette;
  late bool enableHoverEffect;

  Color? textInputIconColor;
  Widget? loginHeader;
  String? loginButtonText;
  Widget? loginFooter;
  Widget? setupMfaHeader;
  Widget? verifyMfaHeader;

  Widget? resetPasswordHeader;
  Widget? resetPasswordFooter;
  Widget? confirmIdentityHeader;
  Widget? confirmIdentityFooter;
  Widget? createNewPasswordHeader;
  late bool confirmModalsInAuth;
  late bool showPasswordHintsOnLoad;

  ThemeConfig({
    this.name,
    this.logo,
    this.fontFamily,
    this.fontFamilyAlt,
    this.fontTheme,
    this.fontThemeAlt,
    this.borderRadius,
    this.buttonHeight,
    this.buttonPaddingX,
    this.buttonPaddingY,
    this.buttonSmallHeight,
    this.buttonSmallPaddingX,
    this.buttonSmallPaddingY,
    this.inputContentPaddingX,
    this.inputContentPaddingY,
    this.lightColorScheme,
    this.darkColorScheme,
    this.lightColorRoles,
    this.darkColorRoles,
    this.colorPalette,
    this.enableHoverEffect = true,
    this.textInputIconColor,
    this.loginHeader,
    this.loginButtonText,
    this.loginFooter,
    this.setupMfaHeader,
    this.verifyMfaHeader,
    this.resetPasswordHeader,
    this.resetPasswordFooter,
    this.confirmIdentityHeader,
    this.confirmIdentityFooter,
    this.createNewPasswordHeader,
    this.confirmModalsInAuth = true,
    this.showPasswordHintsOnLoad = false,
  });

  ThemeConfig.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logo = json['logo'];
    fontFamily = json['fontFamily'];
    fontFamilyAlt = json['fontFamilyAlt'];
    fontTheme = json['fontTheme'];
    fontThemeAlt = json['fontThemeAlt'];
    borderRadius = double.tryParse(json['borderRadius'].toString());
    buttonHeight = double.tryParse(json['buttonHeight'].toString());
    buttonPaddingX = double.tryParse(json['buttonPaddingX'].toString());
    buttonPaddingY = double.tryParse(json['buttonPaddingY'].toString());
    buttonSmallHeight = double.tryParse(json['buttonSmallHeight'].toString());
    buttonSmallPaddingX =
        double.tryParse(json['buttonSmallPaddingX'].toString());
    buttonSmallPaddingY =
        double.tryParse(json['buttonSmallPaddingY'].toString());
    inputContentPaddingX =
        double.tryParse(json['inputContentPaddingX'].toString());
    inputContentPaddingY =
        double.tryParse(json['inputContentPaddingY'].toString());
    inputContentPaddingY =
        double.tryParse(json['inputContentPaddingY'].toString());
    lightColorScheme = json['lightColorScheme'] != null
        ? ColorSchemeModel.fromJson(json['lightColorScheme']).toColorScheme()
        : ThemeData.light(useMaterial3: true).colorScheme;
    darkColorScheme = json['darkColorScheme'] != null
        ? ColorSchemeModel.fromJson(json['darkColorScheme']).toColorScheme()
        : ThemeData.dark(useMaterial3: true).colorScheme;
    lightColorRoles = json['lightColorScheme']['roles'] != null
        ? ColorSchemeModel.fromJson(json['lightColorScheme']).roles
        : null;
    darkColorRoles = json['darkColorScheme']['roles'] != null
        ? ColorSchemeModel.fromJson(json['darkColorScheme']).roles
        : null;
    colorPalette = json['colorPalette'] != null
        ? ColorPalette.fromJson(json['colorPalette'])
        : ColorPalette.fromJson({});

    enableHoverEffect = json['enableHoverEffect'] ?? false;

    textInputIconColor = json['textInputIconColor'];
    loginHeader = json['loginHeader'];
    loginButtonText = json['loginButtonText'];
    loginFooter = json['loginFooter'];
    setupMfaHeader = json['setupMfaHeader'];
    verifyMfaHeader = json['verifyMfaHeader'];
    resetPasswordHeader = json['resetPasswordHeader'];
    resetPasswordFooter = json['resetPasswordFooter'];
    confirmIdentityHeader = json['confirmIdentityHeader'];
    confirmIdentityFooter = json['confirmIdentityFooter'];
    createNewPasswordHeader = json['createNewPasswordHeader'];
    confirmModalsInAuth = json['confirmModalsInAuth'] ?? true;
    showPasswordHintsOnLoad = json['showPasswordHintsOnLoad'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['logo'] = logo;
    data['fontFamily'] = fontFamily;
    data['fontFamilyAlt'] = fontFamilyAlt;
    data['fontTheme'] = fontTheme;
    data['fontThemeAlt'] = fontThemeAlt;
    data['borderRadius'] = borderRadius;
    data['buttonHeight'] = buttonHeight;
    data['buttonPaddingX'] = buttonPaddingX;
    data['buttonPaddingY'] = buttonPaddingY;
    data['buttonSmallHeight'] = buttonSmallHeight;
    data['buttonSmallPaddingX'] = buttonSmallPaddingX;
    data['buttonSmallPaddingY'] = buttonSmallPaddingY;
    data['inputContentPaddingX'] = inputContentPaddingX;
    data['inputContentPaddingY'] = inputContentPaddingY;
    if (lightColorScheme != null) {
      data['lightColorScheme'] = {};
    }
    if (darkColorScheme != null) {
      data['darkColorScheme'] = {};
    }
    if (colorPalette != null) {
      data['colorPalette'] = colorPalette!.toJson();
    }
    data['enableHoverEffect'] = enableHoverEffect;

    data['textInputIconColor'] = textInputIconColor;
    data['loginHeader'] = loginHeader;
    data['loginButtonText'] = loginButtonText;
    data['loginFooter'] = loginFooter;
    data['setupMfaHeader'] = setupMfaHeader;
    data['verifyMfaHeader'] = verifyMfaHeader;

    data['resetPasswordHeader'] = resetPasswordHeader;
    data['resetPasswordFooter'] = resetPasswordFooter;
    data['confirmIdentityHeader'] = confirmIdentityHeader;
    data['confirmIdentityFooter'] = confirmIdentityFooter;
    data['createNewPasswordHeader'] = createNewPasswordHeader;
    data['confirmModalsInAuth'] = confirmModalsInAuth;
    data['showPasswordHintsOnLoad'] = showPasswordHintsOnLoad;
    return data;
  }
}

class ColorSchemeModel {
  String? brightness;
  String? primary;
  String? onPrimary;
  String? primaryContainer;
  String? onPrimaryContainer;
  String? secondary;
  String? onSecondary;
  String? secondaryContainer;
  String? onSecondaryContainer;
  String? tertiary;
  String? onTertiary;
  String? tertiaryContainer;
  String? onTertiaryContainer;
  String? error;
  String? onError;
  String? errorContainer;
  String? onErrorContainer;
  String? outline;
  String? outlineVariant;
  String? background;
  String? onBackground;
  String? surface;
  String? onSurface;
  String? surfaceVariant;
  String? onSurfaceVariant;
  String? inverseSurface;
  String? onInverseSurface;
  String? inversePrimary;
  String? shadow;
  String? scrim;
  String? surfaceTint;
  ColorRolesConfig? roles;

  ColorSchemeModel({
    this.brightness,
    this.primary,
    this.onPrimary,
    this.primaryContainer,
    this.onPrimaryContainer,
    this.secondary,
    this.onSecondary,
    this.secondaryContainer,
    this.onSecondaryContainer,
    this.tertiary,
    this.onTertiary,
    this.tertiaryContainer,
    this.onTertiaryContainer,
    this.error,
    this.onError,
    this.errorContainer,
    this.onErrorContainer,
    this.outline,
    this.outlineVariant,
    this.background,
    this.onBackground,
    this.surface,
    this.onSurface,
    this.surfaceVariant,
    this.onSurfaceVariant,
    this.inverseSurface,
    this.onInverseSurface,
    this.inversePrimary,
    this.shadow,
    this.scrim,
    this.surfaceTint,
    this.roles,
  });

  ColorScheme toColorScheme() {
    return brightness == null
        ? const ColorScheme.light()
        : ColorScheme(
            brightness:
                brightness == 'dark' ? Brightness.dark : Brightness.light,
            primary: hexToColor(primary),
            onPrimary: hexToColor(onPrimary),
            primaryContainer: hexToColor(primaryContainer),
            onPrimaryContainer: hexToColor(onPrimaryContainer),
            secondary: hexToColor(secondary),
            onSecondary: hexToColor(onSecondary),
            secondaryContainer: hexToColor(secondaryContainer),
            onSecondaryContainer: hexToColor(onSecondaryContainer),
            tertiary: hexToColor(tertiary),
            onTertiary: hexToColor(onTertiary),
            tertiaryContainer: hexToColor(tertiaryContainer),
            onTertiaryContainer: hexToColor(onTertiaryContainer),
            error: hexToColor(error),
            onError: hexToColor(onError),
            errorContainer: hexToColor(errorContainer),
            onErrorContainer: hexToColor(onErrorContainer),
            outline: hexToColor(outline),
            outlineVariant: hexToColor(outlineVariant),
            background: hexToColor(background),
            onBackground: hexToColor(onBackground),
            surface: hexToColor(surface),
            onSurface: hexToColor(onSurface),
            surfaceVariant: hexToColor(surfaceVariant),
            onSurfaceVariant: hexToColor(onSurfaceVariant),
            inverseSurface: hexToColor(inverseSurface),
            onInverseSurface: hexToColor(onInverseSurface),
            inversePrimary: hexToColor(inversePrimary),
            shadow: hexToColor(shadow),
            scrim: hexToColor(scrim),
            surfaceTint: hexToColor(surfaceTint),
          );
  }

  factory ColorSchemeModel.fromJson(Map<String, dynamic> json) {
    return ColorSchemeModel(
      brightness: json['brightness'] ?? '',
      primary: json['primary'],
      onPrimary: json['onPrimary'],
      primaryContainer: json['primaryContainer'],
      onPrimaryContainer: json['onPrimaryContainer'],
      secondary: json['secondary'],
      onSecondary: json['onSecondary'],
      secondaryContainer: json['secondaryContainer'],
      onSecondaryContainer: json['onSecondaryContainer'],
      tertiary: json['tertiary'],
      onTertiary: json['onTertiary'],
      tertiaryContainer: json['tertiaryContainer'],
      onTertiaryContainer: json['onTertiaryContainer'],
      error: json['error'],
      onError: json['onError'],
      errorContainer: json['errorContainer'],
      onErrorContainer: json['onErrorContainer'],
      outline: json['outline'],
      outlineVariant: json['outlineVariant'],
      background: json['background'],
      onBackground: json['onBackground'],
      surface: json['surface'],
      onSurface: json['onSurface'],
      surfaceVariant: json['surfaceVariant'],
      onSurfaceVariant: json['onSurfaceVariant'],
      inverseSurface: json['inverseSurface'],
      onInverseSurface: json['onInverseSurface'],
      inversePrimary: json['inversePrimary'],
      shadow: json['shadow'],
      scrim: json['scrim'],
      surfaceTint: json['surfaceTint'],
      roles: ColorRolesConfig.fromJson(json['roles']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brightness': brightness,
      'primary': primary,
      'onPrimary': onPrimary,
      'primaryContainer': primaryContainer,
      'onPrimaryContainer': onPrimaryContainer,
      'secondary': secondary,
      'onSecondary': onSecondary,
      'secondaryContainer': secondaryContainer,
      'onSecondaryContainer': onSecondaryContainer,
      'tertiary': tertiary,
      'onTertiary': onTertiary,
      'tertiaryContainer': tertiaryContainer,
      'onTertiaryContainer': onTertiaryContainer,
      'error': error,
      'onError': onError,
      'errorContainer': errorContainer,
      'onErrorContainer': onErrorContainer,
      'outline': outline,
      'outlineVariant': outlineVariant,
      'background': background,
      'onBackground': onBackground,
      'surface': surface,
      'onSurface': onSurface,
      'surfaceVariant': surfaceVariant,
      'onSurfaceVariant': onSurfaceVariant,
      'inverseSurface': inverseSurface,
      'onInverseSurface': onInverseSurface,
      'inversePrimary': inversePrimary,
      'shadow': shadow,
      'scrim': scrim,
      'surfaceTint': surfaceTint,
      'roles': roles?.toJson(),
    };
  }
}

class ColorPalette {
  TextColorPaletteConfig? textDark;
  TextColorPaletteConfig? textLight;
  ColorPaletteConfig? neutral;
  ColorPaletteConfig? primaryBrand;
  ColorPaletteConfig? secondaryBrand;
  ColorPaletteConfig? success;
  ColorPaletteConfig? error;
  ColorPaletteConfig? warning;
  ColorRolesConfig? roles;

  ColorPalette({
    this.textDark,
    this.textLight,
    this.neutral,
    this.primaryBrand,
    this.secondaryBrand,
    this.success,
    this.error,
    this.warning,
    this.roles,
  });

  ColorPalette.fromJson(Map<String, dynamic> json) {
    textDark = json['textDark'] != null
        ? TextColorPaletteConfig.fromJson(json['textDark'])
        : TextColorPaletteConfig.fromJson({});
    textLight = json['textLight'] != null
        ? TextColorPaletteConfig.fromJson(json['textLight'])
        : TextColorPaletteConfig.fromJson({});
    neutral = json['neutral'] != null
        ? ColorPaletteConfig.fromJson(json['neutral'])
        : ColorPaletteConfig.fromJson({});
    primaryBrand = json['primaryBrand'] != null
        ? ColorPaletteConfig.fromJson(json['primaryBrand'])
        : ColorPaletteConfig.fromJson({});
    secondaryBrand = json['secondaryBrand'] != null
        ? ColorPaletteConfig.fromJson(json['secondaryBrand'])
        : ColorPaletteConfig.fromJson({});
    success = json['success'] != null
        ? ColorPaletteConfig.fromJson(json['success'])
        : ColorPaletteConfig.fromJson({});
    error = json['error'] != null
        ? ColorPaletteConfig.fromJson(json['error'])
        : ColorPaletteConfig.fromJson({});
    warning = json['warning'] != null
        ? ColorPaletteConfig.fromJson(json['warning'])
        : ColorPaletteConfig.fromJson({});
    roles = json['roles'] != null
        ? ColorRolesConfig.fromJson(json['roles'])
        : ColorRolesConfig.fromJson({});
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (textDark != null) {
      data['textDark'] = textDark!.toJson();
    }
    if (textLight != null) {
      data['textLight'] = textLight!.toJson();
    }
    if (neutral != null) {
      data['neutral'] = neutral!.toJson();
    }
    if (primaryBrand != null) {
      data['primaryBrand'] = primaryBrand!.toJson();
    }
    if (secondaryBrand != null) {
      data['secondaryBrand'] = secondaryBrand!.toJson();
    }
    if (success != null) {
      data['success'] = success!.toJson();
    }
    if (error != null) {
      data['error'] = error!.toJson();
    }
    if (warning != null) {
      data['warning'] = warning!.toJson();
    }
    if (roles != null) {
      data['roles'] = roles!.toJson();
    }
    return data;
  }
}

class TextColorPaletteConfig {
  late Color s64;
  late Color s80;
  late Color s100;

  TextColorPaletteConfig({
    required this.s64,
    required this.s80,
    required this.s100,
  });

  TextColorPaletteConfig.fromJson(Map<String, dynamic> json) {
    s64 = hexToColor(json['64']);
    s80 = hexToColor(json['80']);
    s100 = hexToColor(json['100']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['64'] = colorToHex(s64);
    data['80'] = colorToHex(s80);
    data['100'] = colorToHex(s100);
    return data;
  }
}

class ColorPaletteConfig {
  late Color base;
  late Color s0;
  late Color s10;
  late Color s20;
  late Color s30;
  late Color s40;
  late Color s50;
  late Color s60;
  late Color s70;
  late Color s80;
  late Color s90;
  late Color s100;

  ColorPaletteConfig({
    required this.base,
    required this.s0,
    required this.s10,
    required this.s20,
    required this.s30,
    required this.s40,
    required this.s50,
    required this.s60,
    required this.s70,
    required this.s80,
    required this.s90,
    required this.s100,
  });

  ColorPaletteConfig.fromJson(Map<String, dynamic> json) {
    base = hexToColor(json['base']);
    s0 = hexToColor(json['0']);
    s10 = hexToColor(json['10']);
    s20 = hexToColor(json['20']);
    s30 = hexToColor(json['30']);
    s40 = hexToColor(json['40']);
    s50 = hexToColor(json['50']);
    s60 = hexToColor(json['60']);
    s70 = hexToColor(json['70']);
    s80 = hexToColor(json['80']);
    s90 = hexToColor(json['90']);
    s100 = hexToColor(json['100']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base'] = colorToHex(base);
    data['0'] = colorToHex(s0);
    data['10'] = colorToHex(s10);
    data['20'] = colorToHex(s20);
    data['30'] = colorToHex(s30);
    data['40'] = colorToHex(s40);
    data['50'] = colorToHex(s50);
    data['60'] = colorToHex(s60);
    data['70'] = colorToHex(s70);
    data['80'] = colorToHex(s80);
    data['90'] = colorToHex(s90);
    data['100'] = colorToHex(s100);
    return data;
  }
}

class ColorRolesConfig {
  late Color primary;
  late Color primaryVariant;
  late Color primaryContainer;
  late Color onPrimaryContainer;
  late Color secondary;
  late Color secondaryVariant;
  late Color secondaryContainer;
  late Color onSecondaryContainer;
  late Color error;
  late Color errorVariant;
  late Color errorContainer;
  late Color onErrorContainer;
  late Color success;
  late Color successVariant;
  late Color successContainer;
  late Color onSuccessContainer;
  late Color warning;
  late Color warningVariant;
  late Color warningContainer;
  late Color onWarningContainer;
  late Color background;
  late Color backgroundDim;
  late Color backgroundBright;
  late Color card0;
  late Color card10;
  late Color card20;
  late Color card30;
  late Color card40;
  late Color contentBlack;
  late Color contentGray;
  late Color contentWhite;
  late Color border;
  late Color divider;

  ColorRolesConfig({
    required this.primary,
    required this.primaryVariant,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.secondaryVariant,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.error,
    required this.errorVariant,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.success,
    required this.successVariant,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.warning,
    required this.warningVariant,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.background,
    required this.backgroundDim,
    required this.backgroundBright,
    required this.card0,
    required this.card10,
    required this.card20,
    required this.card30,
    required this.card40,
    required this.contentBlack,
    required this.contentGray,
    required this.contentWhite,
    required this.border,
    required this.divider,
  });

  ColorRolesConfig.fromJson(Map<String, dynamic> json) {
    primary = hexToColor(json['primary']);
    primaryVariant = hexToColor(json['primaryVariant']);
    primaryContainer = hexToColor(json['primaryContainer']);
    onPrimaryContainer = hexToColor(json['onPrimaryContainer']);
    secondary = hexToColor(json['secondary']);
    secondaryVariant = hexToColor(json['secondaryVariant']);
    secondaryContainer = hexToColor(json['secondaryContainer']);
    onSecondaryContainer = hexToColor(json['onSecondaryContainer']);
    error = hexToColor(json['error']);
    errorVariant = hexToColor(json['errorVariant']);
    errorContainer = hexToColor(json['errorContainer']);
    onErrorContainer = hexToColor(json['onErrorContainer']);
    success = hexToColor(json['success']);
    successVariant = hexToColor(json['successVariant']);
    successContainer = hexToColor(json['successContainer']);
    onSuccessContainer = hexToColor(json['onSuccessContainer']);
    warning = hexToColor(json['warning']);
    warningVariant = hexToColor(json['warningVariant']);
    warningContainer = hexToColor(json['warningContainer']);
    onWarningContainer = hexToColor(json['onWarningContainer']);
    background = hexToColor(json['background']);
    backgroundDim = hexToColor(json['backgroundDim']);
    backgroundBright = hexToColor(json['backgroundBright']);
    card0 = hexToColor(json['card0']);
    card10 = hexToColor(json['card10']);
    card20 = hexToColor(json['card20']);
    card30 = hexToColor(json['card30']);
    card40 = hexToColor(json['card40']);
    contentBlack = hexToColor(json['contentBlack']);
    contentGray = hexToColor(json['contentGray']);
    contentWhite = hexToColor(json['contentWhite']);
    border = hexToColor(json['border']);
    divider = hexToColor(json['divider']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['primary'] = colorToHex(primary);
    data['primaryVariant'] = colorToHex(primaryVariant);
    data['primaryContainer'] = colorToHex(primaryContainer);
    data['onPrimaryContainer'] = colorToHex(onPrimaryContainer);
    data['secondary'] = colorToHex(secondary);
    data['secondaryVariant'] = colorToHex(secondaryVariant);
    data['secondaryContainer'] = colorToHex(secondaryContainer);
    data['onSecondaryContainer'] = colorToHex(onSecondaryContainer);
    data['error'] = colorToHex(error);
    data['errorVariant'] = colorToHex(errorVariant);
    data['errorContainer'] = colorToHex(errorContainer);
    data['onErrorContainer'] = colorToHex(onErrorContainer);
    data['success'] = colorToHex(success);
    data['successVariant'] = colorToHex(successVariant);
    data['successContainer'] = colorToHex(successContainer);
    data['onSuccessContainer'] = colorToHex(onSuccessContainer);
    data['warning'] = colorToHex(warning);
    data['warningVariant'] = colorToHex(warningVariant);
    data['warningContainer'] = colorToHex(warningContainer);
    data['onWarningContainer'] = colorToHex(onWarningContainer);
    data['background'] = colorToHex(background);
    data['backgroundDim'] = colorToHex(backgroundDim);
    data['backgroundBright'] = colorToHex(backgroundBright);
    data['card0'] = colorToHex(card0);
    data['card10'] = colorToHex(card10);
    data['card20'] = colorToHex(card20);
    data['card30'] = colorToHex(card30);
    data['card40'] = colorToHex(card40);
    data['contentBlack'] = colorToHex(contentBlack);
    data['contentGray'] = colorToHex(contentGray);
    data['contentWhite'] = colorToHex(contentWhite);
    data['border'] = colorToHex(border);
    data['divider'] = colorToHex(divider);
    return data;
  }
}

String colorToHex(Color color) {
  return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
}

Color hexToColor(String? hexString) {
  if (hexString == null) {
    return Colors.transparent;
  }

  final hexCode = hexString.replaceAll('#', '');

  if (hexCode.length == 6 || hexCode.length == 8) {
    try {
      return Color(int.parse('0xFF$hexCode'));
    } catch (e) {
      if (kDebugMode) {
        print('Error parsing color: $e');
      }
    }
  }
  return Colors.transparent;
}
