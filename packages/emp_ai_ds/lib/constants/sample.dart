import 'package:flutter/material.dart';

ThemeData baseTheme = ThemeData(
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith((states) {
        return const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          fontFamily: 'Inter',
        );
      }),
      minimumSize: MaterialStateProperty.all(const Size.fromHeight(48)),
      shape: MaterialStateProperty.resolveWith((states) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
      }),
      padding: MaterialStateProperty.resolveWith((states) {
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 14);
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        return Colors.white;
      }),
      overlayColor: MaterialStateProperty.resolveWith((states) {
        return Colors.transparent;
      }),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.focused) ||
            states.contains(MaterialState.selected) ||
            states.contains(MaterialState.pressed)) {
          return const Color(0xFF2A4BC2);
        }
        if (states.contains(MaterialState.hovered)) {
          return const Color(0xFF5E79DC);
        }
        if (states.contains(MaterialState.disabled)) {
          return const Color(0xFF1C3282).withOpacity(.4);
        }

        return const Color(0xFF1C3282);
      }),
    ),
  ),
);
