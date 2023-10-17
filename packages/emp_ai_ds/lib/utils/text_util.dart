import 'package:emp_ai_ds/constants/themes/default/default_theme_constants.dart';
import 'package:emp_ai_ds/entities/theme_config.dart';
import 'package:flutter/material.dart';

enum TextType {
  display,
  heading,
  label,
  body,
}

enum TextSize {
  large,
  medium,
  small,
}

ThemeConfig config = DefaultTheme.config;
final ColorPalette colors_ = DefaultTheme.config.colorPalette!;

class TextUtil {
  TextType? style;
  FontWeight? weight;
  Color? color;
  double? height;
  TextDecoration decoration;
  String? fontFamily;
  BuildContext? context;

  TextUtil(
    this.context, {
    this.style,
    this.weight,
    this.color,
    this.height,
    this.decoration = TextDecoration.none,
    this.fontFamily,
  });
  TextStyle displayL() => setTextStyle(
        48,
        weight ?? FontWeight.w700,
        color: color,
        context: context,
        height: height ?? 1.12,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle displayM() => setTextStyle(
        40,
        weight ?? FontWeight.bold,
        color: color,
        context: context,
        height: height ?? 1.2,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle displayS() => setTextStyle(
        32,
        weight ?? FontWeight.bold,
        color: color,
        context: context,
        height: height ?? 1.25,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle headingL() => setTextStyle(
        24,
        weight ?? FontWeight.w700,
        color: color,
        context: context,
        height: height ?? 1.2,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle headingM() => setTextStyle(
        18,
        weight ?? FontWeight.bold,
        color: color,
        context: context,
        height: height ?? 1.18,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle headingS() => setTextStyle(
        16,
        weight ?? FontWeight.bold,
        color: color,
        context: context,
        height: height ?? 1.5,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle labelL() => setTextStyle(
        18,
        weight ?? FontWeight.w400,
        color: color,
        context: context,
        height: height ?? 1.7,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle labelM() => setTextStyle(
        16,
        weight ?? FontWeight.w400,
        color: color,
        context: context,
        height: height ?? 1.5,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle labelS() => setTextStyle(
        14,
        weight ?? FontWeight.w400,
        color: color,
        context: context,
        height: height ?? 1.2,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle bodyL() => setTextStyle(
        14,
        weight ?? FontWeight.w400,
        color: color,
        context: context,
        height: height ?? 1.6,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle bodyM() => setTextStyle(
        12,
        weight ?? FontWeight.w400,
        color: color,
        context: context,
        height: height,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle bodyS() => setTextStyle(
        10,
        weight ?? FontWeight.w400,
        color: color,
        context: context,
        height: height,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
}

TextStyle setTextStyle(
  double size,
  FontWeight weight, {
  Color? color,
  double? height,
  TextDecoration? textDecoration,
  String? fontFamily,
  BuildContext? context,
}) {
  if (context != null) {
    color = color ?? Theme.of(context).colorScheme.onBackground;
  }

  return TextStyle(
    fontFamily: 'Inter',
    package: 'emp_ai_ds',
    fontSize: size,
    textBaseline: TextBaseline.alphabetic,
    fontWeight: weight,
    color: color,
    height: height,
    inherit: false,
    decoration: textDecoration ?? TextDecoration.none,
  );
}
