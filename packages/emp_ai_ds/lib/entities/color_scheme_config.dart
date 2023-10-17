import 'package:emp_ai_ds/utils/color_utils.dart';
import 'package:flutter/material.dart';

class ColorSchemeConfig {
  late Color brightness;
  late Color primary;
  late Color onPrimary;
  late Color tertiary;
  late Color onTertiary;
  late Color onTertiaryContainer;
  late Color secondary;
  late Color onSecondary;
  late Color outline;
  late Color outlineVariant;
  late Color error;
  late Color onError;
  late Color background;
  late Color onBackground;
  late Color onSurface;
  late Color surface;
  late Color surfaceVariant;

  ColorSchemeConfig({
    required this.brightness,
    required this.primary,
    required this.onPrimary,
    required this.tertiary,
    required this.onTertiary,
    required this.onTertiaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.outline,
    required this.outlineVariant,
    required this.error,
    required this.onError,
    required this.background,
    required this.onBackground,
    required this.onSurface,
    required this.surface,
    required this.surfaceVariant,
  });

  ColorSchemeConfig.fromJson(Map<String, dynamic> json) {
    brightness = hexToColor(json['brightness']);
    primary = hexToColor(json['primary']);
    onPrimary = hexToColor(json['onPrimary']);
    tertiary = hexToColor(json['tertiary']);
    onTertiary = hexToColor(json['onTertiary']);
    onTertiaryContainer = hexToColor(json['onTertiaryContainer']);
    secondary = hexToColor(json['secondary']);
    onSecondary = hexToColor(json['onSecondary']);
    outline = hexToColor(json['outline']);
    outlineVariant = hexToColor(json['outlineVariant']);
    error = hexToColor(json['error']);
    onError = hexToColor(json['onError']);
    background = hexToColor(json['background']);
    onBackground = hexToColor(json['onBackground']);
    onSurface = hexToColor(json['onSurface']);
    surface = hexToColor(json['surface']);
    surfaceVariant = hexToColor(json['surfaceVariant']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brightness'] = brightness;
    data['primary'] = primary;
    data['onPrimary'] = onPrimary;
    data['tertiary'] = tertiary;
    data['onTertiary'] = onTertiary;
    data['onTertiaryContainer'] = onTertiaryContainer;
    data['secondary'] = secondary;
    data['onSecondary'] = onSecondary;
    data['outline'] = outline;
    data['outlineVariant'] = outlineVariant;
    data['error'] = error;
    data['onError'] = onError;
    data['background'] = background;
    data['onBackground'] = onBackground;
    data['onSurface'] = onSurface;
    data['surface'] = surface;
    data['surfaceVariant'] = surfaceVariant;
    return data;
  }
}
