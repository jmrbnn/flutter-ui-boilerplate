import 'package:flutter/material.dart';

@immutable
class DSAccentColor extends ThemeExtension<DSAccentColor> {
  //
  const DSAccentColor({
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
  ThemeExtension<DSAccentColor> copyWith({
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
    return DSAccentColor(
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
  ThemeExtension<DSAccentColor> lerp(
      ThemeExtension<DSAccentColor>? other, double t) {
    if (other is! DSAccentColor) {
      return this;
    }
    return DSAccentColor(
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
    return 'DSAccentColor(base: $base, s10: $s10, s20: $s20, s30: $s30, s40: $s40, s50: $s50, s60: $s60, s70: $s70, s80: $s80, s90: $s90, s100: $s100)';
  }

  static const blank = DSAccentColor(
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

  static const main = DSAccentColor(
    base: Color(0xFF1ea8aa),
    s10: Color(0xFFdef9f9),
    s20: Color(0xFFa7eef0),
    s30: Color(0xFF4fdee0),
    s40: Color(0xFF26d3d6),
    s50: Color(0xFF1ea8aa),
    s60: Color(0xFF198c8e),
    s70: Color(0xFF147071),
    s80: Color(0xFF0f5455),
    s90: Color(0xFF0a3839),
    s100: Color(0xFF051c1c),
  );

  static const light = DSAccentColor(
    base: Color(0xFF1ea8aa),
    s10: Color(0xFFdef9f9),
    s20: Color(0xFFa7eef0),
    s30: Color(0xFF4fdee0),
    s40: Color(0xFF26d3d6),
    s50: Color(0xFF1ea8aa),
    s60: Color(0xFF198c8e),
    s70: Color(0xFF147071),
    s80: Color(0xFF0f5455),
    s90: Color(0xFF0a3839),
    s100: Color(0xFF051c1c),
  );

  static const dark = DSAccentColor(
    base: Color(0xFF1ea8aa),
    s10: Color(0xFFdef9f9),
    s20: Color(0xFFa7eef0),
    s30: Color(0xFF4fdee0),
    s40: Color(0xFF26d3d6),
    s50: Color(0xFF1ea8aa),
    s60: Color(0xFF198c8e),
    s70: Color(0xFF147071),
    s80: Color(0xFF0f5455),
    s90: Color(0xFF0a3839),
    s100: Color(0xFF051c1c),
  );
}
