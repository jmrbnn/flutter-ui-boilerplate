import 'package:emp_ai_ds/utils/color_utils.dart';
import 'package:flutter/material.dart';

class ColorConfig {
  TextColorPalette? textDark;
  TextColorPalette? textLight;
  ColorPalette? neutral;
  ColorPalette? primaryBrand;
  ColorPalette? secondaryBrand;
  ColorPalette? success;
  ColorPalette? error;
  ColorPalette? warning;

  ColorConfig(
      {this.textDark,
      this.textLight,
      this.neutral,
      this.primaryBrand,
      this.secondaryBrand,
      this.success,
      this.error,
      this.warning});

  ColorConfig.fromJson(Map<String, dynamic> json) {
    textDark = json['textDark'] != null
        ? TextColorPalette.fromJson(json['textDark'])
        : null;
    textLight = json['textLight'] != null
        ? TextColorPalette.fromJson(json['textLight'])
        : null;
    neutral =
        json['neutral'] != null ? ColorPalette.fromJson(json['neutral']) : null;
    primaryBrand = json['primaryBrand'] != null
        ? ColorPalette.fromJson(json['primaryBrand'])
        : null;
    secondaryBrand = json['secondaryBrand'] != null
        ? ColorPalette.fromJson(json['secondaryBrand'])
        : null;
    success =
        json['success'] != null ? ColorPalette.fromJson(json['success']) : null;
    error = json['error'] != null ? ColorPalette.fromJson(json['error']) : null;
    warning =
        json['warning'] != null ? ColorPalette.fromJson(json['warning']) : null;
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
    return data;
  }
}

class TextColorPalette {
  late Color s64;
  late Color s80;
  late Color s100;

  TextColorPalette({required this.s64, required this.s80, required this.s100});

  TextColorPalette.fromJson(Map<String, dynamic> json) {
    s64 = hexToColor(json['64'], isTextColor: true, textOpacity: '64');
    s80 = hexToColor(json['80'], isTextColor: true, textOpacity: '80');
    s100 = hexToColor(json['100'], isTextColor: true, textOpacity: '100');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['64'] = s64;
    data['80'] = s80;
    data['100'] = s100;
    return data;
  }
}

class ColorPalette {
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

  ColorPalette(
      {required this.s10,
      required this.s20,
      required this.s30,
      required this.s40,
      required this.s50,
      required this.s60,
      required this.s70,
      required this.s80,
      required this.s90,
      required this.s100});

  ColorPalette.fromJson(Map<String, dynamic> json) {
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
    data['10'] = s10;
    data['20'] = s20;
    data['30'] = s30;
    data['40'] = s40;
    data['50'] = s50;
    data['60'] = s60;
    data['70'] = s70;
    data['80'] = s80;
    data['90'] = s90;
    data['100'] = s100;
    return data;
  }
}

extension ColorSchemeExtension on ColorScheme {
  Map<String, dynamic> toJson() {
    return {
      'primary': '"#${primary.value.toRadixString(16)}"',
      'onPrimary': '"#${onPrimary.value.toRadixString(16)}"',
      'primaryContainer': '"#${primaryContainer.value.toRadixString(16)}"',
      'onPrimaryContainer': '"#${onPrimaryContainer.value.toRadixString(16)}"',
      'secondary': '"#${secondary.value.toRadixString(16)}"',
      'onSecondary': '"#${onSecondary.value.toRadixString(16)}"',
      'secondaryContainer': '"#${secondaryContainer.value.toRadixString(16)}"',
      'onSecondaryContainer':
          '"#${onSecondaryContainer.value.toRadixString(16)}"',
      'tertiary': '"#${tertiary.value.toRadixString(16)}"',
      'onTertiary': '"#${onTertiary.value.toRadixString(16)}"',
      'tertiaryContainer': '"#${tertiaryContainer.value.toRadixString(16)}"',
      'onTertiaryContainer':
          '"#${onTertiaryContainer.value.toRadixString(16)}"',
      'error': '"#${error.value.toRadixString(16)}"',
      'onError': '"#${onError.value.toRadixString(16)}"',
      'errorContainer': '"#${errorContainer.value.toRadixString(16)}"',
      'onErrorContainer': '"#${onErrorContainer.value.toRadixString(16)}"',
      'outline': '"#${outline.value.toRadixString(16)}"',
      'outlineVariant': '"#${outlineVariant.value.toRadixString(16)}"',
      'background': '"#${background.value.toRadixString(16)}"',
      'onBackground': '"#${onBackground.value.toRadixString(16)}"',
      'surface': '"#${surface.value.toRadixString(16)}"',
      'onSurface': '"#${onSurface.value.toRadixString(16)}"',
      'surfaceVariant': '"#${surfaceVariant.value.toRadixString(16)}"',
      'onSurfaceVariant': '"#${onSurfaceVariant.value.toRadixString(16)}"',
      'inverseSurface': '"#${inverseSurface.value.toRadixString(16)}"',
      'onInverseSurface': '"#${onInverseSurface.value.toRadixString(16)}"',
      'inversePrimary': '"#${inversePrimary.value.toRadixString(16)}"',
      'shadow': '"#${shadow.value.toRadixString(16)}"',
      'scrim': '"#${scrim.value.toRadixString(16)}"',
      'surfaceTint': '"#${surfaceTint.value.toRadixString(16)}"',
    };
  }
}
