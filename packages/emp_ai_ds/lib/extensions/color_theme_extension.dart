import 'package:emp_ai_ds/extensions/ds_accent_color_scheme.dart';
import 'package:emp_ai_ds/extensions/ds_error_color_scheme.dart';
import 'package:emp_ai_ds/extensions/ds_neutral_color_scheme.dart';
import 'package:emp_ai_ds/extensions/ds_primary_color_scheme.dart';
import 'package:emp_ai_ds/extensions/ds_success_color_scheme.dart';
import 'package:emp_ai_ds/extensions/ds_warning_color_scheme.dart';
import 'package:flutter/material.dart';

extension ColorThemeExtension on BuildContext {
  DSPrimaryColor? get dsPrimaryColor {
    ThemeExtension<dynamic>? matchingValue;

    Theme.of(this).extensions.forEach((key, value) {
      if (key == DSPrimaryColor) {
        matchingValue = value;
      }
    });

    return matchingValue == null ? null : matchingValue as DSPrimaryColor;
  }

  DSAccentColor? get dsAccentColor {
    ThemeExtension<dynamic>? matchingValue;

    Theme.of(this).extensions.forEach((key, value) {
      if (key == DSAccentColor) {
        matchingValue = value;
      }
    });

    return matchingValue == null ? null : matchingValue as DSAccentColor;
  }

  DSNeutralColor? get dsNeutralColor {
    ThemeExtension<dynamic>? matchingValue;

    Theme.of(this).extensions.forEach((key, value) {
      if (key == DSNeutralColor) {
        matchingValue = value;
      }
    });

    return matchingValue == null ? null : matchingValue as DSNeutralColor;
  }

  DSWarningColor? get dsWarningColor {
    ThemeExtension<dynamic>? matchingValue;

    Theme.of(this).extensions.forEach((key, value) {
      if (key == DSWarningColor) {
        matchingValue = value;
      }
    });

    return matchingValue == null ? null : matchingValue as DSWarningColor;
  }

  DSSuccessColor? get dsSuccessColor {
    ThemeExtension<dynamic>? matchingValue;

    Theme.of(this).extensions.forEach((key, value) {
      if (key == DSSuccessColor) {
        matchingValue = value;
      }
    });

    return matchingValue == null ? null : matchingValue as DSSuccessColor;
  }

  DSErrorColor? get dsErrorColor {
    ThemeExtension<dynamic>? matchingValue;

    Theme.of(this).extensions.forEach((key, value) {
      if (key == DSErrorColor) {
        matchingValue = value;
      }
    });

    return matchingValue == null ? null : matchingValue as DSErrorColor;
  }
}
