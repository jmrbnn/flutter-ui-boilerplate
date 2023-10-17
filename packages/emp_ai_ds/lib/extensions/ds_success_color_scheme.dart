import 'package:flutter/material.dart';

@immutable
class DSSuccessColor extends ThemeExtension<DSSuccessColor> {
  //
  const DSSuccessColor({
    required this.base,
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

  final Color? base;
  final Color? s10;
  final Color? s20;
  final Color? s30;
  final Color? s40;
  final Color? s50;
  final Color? s60;
  final Color? s70;
  final Color? s80;
  final Color? s90;
  final Color? s100;

  @override
  ThemeExtension<DSSuccessColor> copyWith({
    Color? base,
    Color? s10,
    Color? s20,
    Color? s30,
    Color? s40,
    Color? s50,
    Color? s60,
    Color? s70,
    Color? s80,
    Color? s90,
    Color? s100,
  }) {
    return DSSuccessColor(
      base: base ?? this.base,
      s10: s10 ?? this.s10,
      s20: s20 ?? this.s20,
      s30: s30 ?? this.s30,
      s40: s40 ?? this.s40,
      s50: s50 ?? this.s50,
      s60: s60 ?? this.s60,
      s70: s70 ?? this.s70,
      s80: s80 ?? this.s80,
      s90: s90 ?? this.s90,
      s100: s100 ?? this.s100,
    );
  }

  Color? shade(double shade) {
    switch (shade.toInt()) {
      case 10:
        return s10;
      case 20:
        return s20;
      case 30:
        return s30;
      case 40:
        return s40;
      case 50:
        return s50;
      case 60:
        return s60;
      case 70:
        return s70;
      case 80:
        return s80;
      case 90:
        return s90;
      case 100:
        return s100;
      default:
        return null; // or you can return a default color or throw an exception
    }
  }

  @override
  ThemeExtension<DSSuccessColor> lerp(
      ThemeExtension<DSSuccessColor>? other, double t) {
    if (other is! DSSuccessColor) {
      return this;
    }
    return DSSuccessColor(
      base: Color.lerp(base, other.base, t),
      s10: Color.lerp(s10, other.s10, t),
      s20: Color.lerp(s20, other.s20, t),
      s30: Color.lerp(s30, other.s30, t),
      s40: Color.lerp(s30, other.s30, t),
      s50: Color.lerp(s30, other.s30, t),
      s60: Color.lerp(s30, other.s30, t),
      s70: Color.lerp(s30, other.s30, t),
      s80: Color.lerp(s30, other.s30, t),
      s90: Color.lerp(s30, other.s30, t),
      s100: Color.lerp(s30, other.s30, t),
    );
  }

  @override
  String toString() {
    return 'DSSuccessColor(base: $base, s10: $s10, s20: $s20, s30: $s30, s40: $s40, s50: $s50, s60: $s60, s70: $s70, s80: $s80, s90: $s90, s100: $s100)';
  }

  static const blank = DSSuccessColor(
    base: Colors.transparent,
    s10: Colors.transparent,
    s20: Colors.transparent,
    s30: Colors.transparent,
    s40: Colors.transparent,
    s50: Colors.transparent,
    s60: Colors.transparent,
    s70: Colors.transparent,
    s80: Colors.transparent,
    s90: Colors.transparent,
    s100: Colors.transparent,
  );
  static const main = DSSuccessColor(
    base: Color(0xFF7FBA00),
    s10: Color(0xFFF5FFDF),
    s20: Color(0xFFEAFFBE),
    s30: Color(0xFFD6FF7D),
    s40: Color(0xFFC1FF3D),
    s50: Color(0xFFA4F000),
    s60: Color(0xFF7FBA00),
    s70: Color(0xFF669500),
    s80: Color(0xFF4C7000),
    s90: Color(0xFF334A00),
    s100: Color(0xFF192500),
  );

  static const light = DSSuccessColor(
    base: Color(0xFF7FBA00),
    s10: Color(0xFFF5FFDF),
    s20: Color(0xFFEAFFBE),
    s30: Color(0xFFD6FF7D),
    s40: Color(0xFFC1FF3D),
    s50: Color(0xFFA4F000),
    s60: Color(0xFF7FBA00),
    s70: Color(0xFF669500),
    s80: Color(0xFF4C7000),
    s90: Color(0xFF334A00),
    s100: Color(0xFF192500),
  );

  static const dark = DSSuccessColor(
    base: Color(0xFF7FBA00),
    s10: Color(0xFFF5FFDF),
    s20: Color(0xFFEAFFBE),
    s30: Color(0xFFD6FF7D),
    s40: Color(0xFFC1FF3D),
    s50: Color(0xFFA4F000),
    s60: Color(0xFF7FBA00),
    s70: Color(0xFF669500),
    s80: Color(0xFF4C7000),
    s90: Color(0xFF334A00),
    s100: Color(0xFF192500),
  );
}
