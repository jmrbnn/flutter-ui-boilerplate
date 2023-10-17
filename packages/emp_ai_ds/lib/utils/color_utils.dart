import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppColors {
  // For Light Background
  static const textDark = MaterialColor(
    0xFF858997,
    <int, Color>{
      100: Color(0xFF2B2D32),
      80: Color(0xCC2B2D32),
      64: Color(0xA52B2D32),
    },
  );

  // For Dark Background
  static const textLight = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      100: Color(0xFFFFFFFF),
      80: Color(0xCCFFFFFF),
      64: Color(0xA5FFFFFF),
    },
  );

  // Background Grays
  static const neutral = MaterialColor(
    0xFFCDD5DF,
    <int, Color>{
      10: Color(0xFFF8FAFC),
      20: Color(0xFFEEF2F6),
      30: Color(0xFFE3E8EF),
      40: Color(0xFFCDD5DF),
      50: Color(0xFF9AA4B2),
      60: Color(0xFF697586),
      70: Color(0xFF4B5565),
      80: Color(0xFF364152),
      90: Color(0xFF202939),
      100: Color(0xFF121926),
    },
  );

  // Main Colors
  static const primaryBrand = MaterialColor(
    0xFF3D56BA,
    <int, Color>{
      10: Color(0xFFF0F5FF),
      20: Color(0xFFD8E4FC),
      30: Color(0xFFB3C6F0),
      40: Color(0xFF8FA5E4),
      50: Color(0xFF667FD0),
      60: Color(0xFF3D56BA),
      70: Color(0xFF293B98),
      80: Color(0xFF182579),
      90: Color(0xFF0C135C),
      100: Color(0xFF060A41),
    },
  );

  // Main Colors
  static const secondaryBrand = MaterialColor(
    0xFF298B7E,
    <int, Color>{
      10: Color(0xFFF5FEFB),
      20: Color(0xFFDAFCF5),
      30: Color(0xFFB1F1E6),
      40: Color(0xFF77E0D3),
      50: Color(0xFF4ECBB8),
      60: Color(0xFF38B09D),
      70: Color(0xFF298B7E),
      80: Color(0xFF1E685C),
      90: Color(0xFF184E48),
      100: Color(0xFF133F3A),
    },
  );

  // System Colors
  // Success
  static const success = MaterialColor(
    0xFF66B241,
    <int, Color>{
      10: Color(0xFFF6FFED),
      20: Color(0xFFDCF4C6),
      30: Color(0xFFBEE4A1),
      40: Color(0xFFA1D37E),
      50: Color(0xFF83C35E),
      60: Color(0xFF66B241),
      70: Color(0xFF4A8F2D),
      80: Color(0xFF316C1B),
      90: Color(0xFF1C4B0E),
      100: Color(0xFF0B2904),
    },
  );

  // System Color
  // Error
  static const error = MaterialColor(
    0xFFC3383F,
    <int, Color>{
      10: Color(0xFFFFF1F0),
      20: Color(0xFFF8CFCB),
      30: Color(0xFFEDABA7),
      40: Color(0xFFE18583),
      50: Color(0xFFD55F60),
      60: Color(0xFFC3383F),
      70: Color(0xFFA32730),
      80: Color(0xFF841724),
      90: Color(0xFF660D1A),
      100: Color(0xFF4B0815),
    },
  );

  // System Color
  // Warning
  static const warning = MaterialColor(
    0xFFE9AB3B,
    <int, Color>{
      10: Color(0xFFFEFFE6),
      20: Color(0xFFFEFEC3),
      30: Color(0xFFFCF9A4),
      40: Color(0xFFFAF286),
      50: Color(0xFFF7E866),
      60: Color(0xFFEFD845),
      70: Color(0xFFC9AF30),
      80: Color(0xFFA38A21),
      90: Color(0xFF7F6718),
      100: Color(0xFF5C470F),
    },
  );
}

Color hexToColor(
  String hexString, {
  bool? isTextColor,
  String? textOpacity,
}) {
  final hexCode = hexString.replaceAll('#', '');
  final hexLength = hexCode.length;
  int baseHex = 0xFF000000;

  if (textOpacity != null) {
    switch (textOpacity) {
      case '80':
        baseHex = 0xCC000000;
        break;
      case '64':
        baseHex = 0xA5000000;
        break;
      default:
        break;
    }
  }

  if (hexLength == 6 || hexLength == 8) {
    try {
      final colorValue = int.parse(hexCode, radix: 16);
      return Color(hexLength == 6 ? baseHex + colorValue : colorValue);
    } catch (e) {
      if (kDebugMode) {
        print('Error parsing color: $e');
      }
    }
  }

  return Colors.transparent; // Return transparent color for invalid codes
}

// switchThemeMode(Color lightColor, Color darkColor) {
//   if (themeService.themeMode.value == ThemeMode.light) return lightColor;

//   return darkColor;
// }
