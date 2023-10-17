// ignore_for_file: constant_identifier_names

import 'package:emp_ai_ds/constants/themes/default/default_theme.dart';
import 'package:flutter/material.dart';

//? TypeStyle (App Typography Style)
enum TypeStyle {
  XXSMALL,
  XSMALL,
  SMALL,
  BODY,
  H5,
  H4,
  H3,
  H2,
  H1,
}

class TypeUtil {
  TypeStyle style;
  FontWeight weight;
  Color? color;
  double? height;
  TextDecoration decoration;
  String? fontFamily;
  BuildContext? context;

  TypeUtil({
    this.style = TypeStyle.BODY,
    this.weight = FontWeight.w400,
    this.color,
    this.height,
    this.decoration = TextDecoration.none,
    this.fontFamily,
    this.context,
  });

  TextStyle make() {
    switch (style) {
      case TypeStyle.XXSMALL:
        return setTextStyle(
          10,
          weight,
          color: color,
          context: context,
          height: height ?? 1.15,
          textDecoration: decoration,
        );
      case TypeStyle.XSMALL:
        return setTextStyle(
          12,
          weight,
          color: color,
          context: context,
          height: height ?? 1.35,
          textDecoration: decoration,
        );
      case TypeStyle.SMALL:
        return setTextStyle(
          14,
          weight,
          color: color,
          context: context,
          height: height ?? 1.30,
          textDecoration: decoration,
        );
      case TypeStyle.BODY:
        return setTextStyle(
          16,
          weight,
          color: color,
          context: context,
          height: height ?? 1.25,
          textDecoration: decoration,
          fontFamily: fontFamily,
        );
      case TypeStyle.H5:
        return setTextStyle(
          18,
          weight,
          color: color,
          context: context,
          height: height ?? 1.25,
          textDecoration: decoration,
          fontFamily: fontFamily,
        );
      case TypeStyle.H4:
        return setTextStyle(
          24,
          weight,
          color: color,
          context: context,
          height: height ?? 1.25,
          textDecoration: decoration,
          fontFamily: fontFamily,
        );
      case TypeStyle.H3:
        return setTextStyle(
          28,
          weight,
          color: color,
          context: context,
          height: height ?? 1.25,
          textDecoration: decoration,
          fontFamily: fontFamily,
        );
      case TypeStyle.H2:
        return setTextStyle(
          36,
          weight,
          color: color,
          context: context,
          height: 1.20,
          textDecoration: decoration,
          fontFamily: fontFamily,
        );
      case TypeStyle.H1:
        return setTextStyle(
          48,
          weight,
          color: color,
          context: context,
          height: height ?? 1.15,
          textDecoration: decoration,
          fontFamily: fontFamily,
        );
      default:
        return setTextStyle(
          12,
          weight,
          color: color,
          context: context,
          height: height ?? 1.25,
          textDecoration: decoration,
          fontFamily: fontFamily,
        );
    }
  }

  TextStyle xxsmall() => setTextStyle(
        10,
        weight,
        color: color,
        context: context,
        height: height ?? 1.35,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );

  TextStyle xsmall() => setTextStyle(
        12,
        weight,
        color: color,
        context: context,
        height: height ?? 1.35,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle small() => setTextStyle(
        14,
        weight,
        color: color,
        context: context,
        height: height ?? 1.30,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle body() => setTextStyle(
        16,
        weight,
        color: color,
        context: context,
        height: height ?? 1.25,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle h5() => setTextStyle(
        18,
        weight,
        color: color,
        context: context,
        height: height ?? 1.25,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle h4() => setTextStyle(
        24,
        weight,
        color: color,
        context: context,
        height: height ?? 1.25,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle h3() => setTextStyle(
        28,
        weight,
        color: color,
        context: context,
        height: height ?? 1.20,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle h2() => setTextStyle(
        36,
        weight,
        color: color,
        context: context,
        height: height ?? 1.15,
        textDecoration: decoration,
        fontFamily: fontFamily,
      );
  TextStyle h1() => setTextStyle(
        48,
        weight,
        color: color,
        context: context,
        height: height ?? 1.25,
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
    fontFamily: fontFamily ?? config_.fontFamily,
    package: 'emp_ai_ds',
    fontSize: size,
    textBaseline: TextBaseline.alphabetic,
    fontWeight: weight,
    color: color,
    height: height ?? 1.5,
    inherit: false,
    decoration: textDecoration ?? TextDecoration.none,
  );
}
