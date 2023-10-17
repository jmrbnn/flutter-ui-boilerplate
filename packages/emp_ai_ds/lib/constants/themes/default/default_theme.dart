import 'package:emp_ai_ds/constants/themes/default/default_theme_constants.dart';
import 'package:emp_ai_ds/entities/theme_config.dart';
import 'package:emp_ai_ds/extensions/ds_accent_color_scheme.dart';
import 'package:emp_ai_ds/extensions/ds_error_color_scheme.dart';
import 'package:emp_ai_ds/extensions/ds_neutral_color_scheme.dart';
import 'package:emp_ai_ds/extensions/ds_primary_color_scheme.dart';
import 'package:emp_ai_ds/extensions/ds_success_color_scheme.dart';
import 'package:emp_ai_ds/extensions/ds_warning_color_scheme.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:flutter/material.dart';

ThemeConfig config_ = DefaultTheme.config;
final ColorPalette colors_ = DefaultTheme.config.colorPalette!;

ThemeData buildDefaultTheme({
  required ThemeConfig config,
  Brightness brightness = Brightness.light,
  BuildContext? context,
}) {
  ColorScheme colorScheme = (brightness == Brightness.light
          ? config.lightColorScheme
          : config.darkColorScheme) ??
      ColorScheme.fromSeed(
        seedColor: colors_.primaryBrand!.s100,
      );

  ThemeData baseTheme = ThemeData(
    fontFamily: config.fontFamily,
    brightness: brightness,
    useMaterial3: true,
    colorScheme: colorScheme,
    extensions: <ThemeExtension<dynamic>>[
      config.colorPalette?.primaryBrand == null
          ? DSPrimaryColor.main
          : DSPrimaryColor(
              base: config.colorPalette?.primaryBrand?.base ??
                  DSPrimaryColor.main.base,
              s10: config.colorPalette?.primaryBrand?.s10 ??
                  DSPrimaryColor.main.s10,
              s20: config.colorPalette?.primaryBrand?.s20 ??
                  DSPrimaryColor.main.s20,
              s30: config.colorPalette?.primaryBrand?.s30 ??
                  DSPrimaryColor.main.s30,
              s40: config.colorPalette?.primaryBrand?.s40 ??
                  DSPrimaryColor.main.s40,
              s50: config.colorPalette?.primaryBrand?.s50 ??
                  DSPrimaryColor.main.s50,
              s60: config.colorPalette?.primaryBrand?.s60 ??
                  DSPrimaryColor.main.s60,
              s70: config.colorPalette?.primaryBrand?.s70 ??
                  DSPrimaryColor.main.s70,
              s80: config.colorPalette?.primaryBrand?.s80 ??
                  DSPrimaryColor.main.s80,
              s90: config.colorPalette?.primaryBrand?.s90 ??
                  DSPrimaryColor.main.s90,
              s100: config.colorPalette?.primaryBrand?.s100 ??
                  DSPrimaryColor.main.s100,
            ),
      config.colorPalette?.secondaryBrand == null
          ? DSAccentColor.main
          : DSAccentColor(
              base: config.colorPalette?.secondaryBrand?.base ??
                  DSAccentColor.main.base,
              s10: config.colorPalette?.secondaryBrand?.s10 ??
                  DSAccentColor.main.s10,
              s20: config.colorPalette?.secondaryBrand?.s20 ??
                  DSAccentColor.main.s20,
              s30: config.colorPalette?.secondaryBrand?.s30 ??
                  DSAccentColor.main.s30,
              s40: config.colorPalette?.secondaryBrand?.s40 ??
                  DSAccentColor.main.s40,
              s50: config.colorPalette?.secondaryBrand?.s50 ??
                  DSAccentColor.main.s50,
              s60: config.colorPalette?.secondaryBrand?.s60 ??
                  DSAccentColor.main.s60,
              s70: config.colorPalette?.secondaryBrand?.s70 ??
                  DSAccentColor.main.s70,
              s80: config.colorPalette?.secondaryBrand?.s80 ??
                  DSAccentColor.main.s80,
              s90: config.colorPalette?.secondaryBrand?.s90 ??
                  DSAccentColor.main.s90,
              s100: config.colorPalette?.secondaryBrand?.s100 ??
                  DSAccentColor.main.s100,
            ),
      config.colorPalette?.neutral == null
          ? DSNeutralColor.main
          : DSNeutralColor(
              base: config.colorPalette?.neutral?.base ??
                  DSNeutralColor.main.base,
              s10: config.colorPalette?.neutral?.s10 ?? DSNeutralColor.main.s10,
              s20: config.colorPalette?.neutral?.s20 ?? DSNeutralColor.main.s20,
              s30: config.colorPalette?.neutral?.s30 ?? DSNeutralColor.main.s30,
              s40: config.colorPalette?.neutral?.s40 ?? DSNeutralColor.main.s40,
              s50: config.colorPalette?.neutral?.s50 ?? DSNeutralColor.main.s50,
              s60: config.colorPalette?.neutral?.s60 ?? DSNeutralColor.main.s60,
              s70: config.colorPalette?.neutral?.s70 ?? DSNeutralColor.main.s70,
              s80: config.colorPalette?.neutral?.s80 ?? DSNeutralColor.main.s80,
              s90: config.colorPalette?.neutral?.s90 ?? DSNeutralColor.main.s90,
              s100: config.colorPalette?.neutral?.s100 ??
                  DSNeutralColor.main.s100,
            ),
      config.colorPalette?.success == null
          ? DSSuccessColor.main
          : DSSuccessColor(
              base: config.colorPalette?.success?.base ??
                  DSSuccessColor.main.base,
              s10: config.colorPalette?.success?.s10 ?? DSSuccessColor.main.s10,
              s20: config.colorPalette?.success?.s20 ?? DSSuccessColor.main.s20,
              s30: config.colorPalette?.success?.s30 ?? DSSuccessColor.main.s30,
              s40: config.colorPalette?.success?.s40 ?? DSSuccessColor.main.s40,
              s50: config.colorPalette?.success?.s50 ?? DSSuccessColor.main.s50,
              s60: config.colorPalette?.success?.s60 ?? DSSuccessColor.main.s60,
              s70: config.colorPalette?.success?.s70 ?? DSSuccessColor.main.s70,
              s80: config.colorPalette?.success?.s80 ?? DSSuccessColor.main.s80,
              s90: config.colorPalette?.success?.s90 ?? DSSuccessColor.main.s90,
              s100: config.colorPalette?.success?.s100 ??
                  DSSuccessColor.main.s100,
            ),
      config.colorPalette?.error == null
          ? DSErrorColor.main
          : DSErrorColor(
              base: config.colorPalette?.error?.base ?? DSErrorColor.main.base,
              s10: config.colorPalette?.error?.s10 ?? DSErrorColor.main.s10,
              s20: config.colorPalette?.error?.s20 ?? DSErrorColor.main.s20,
              s30: config.colorPalette?.error?.s30 ?? DSErrorColor.main.s30,
              s40: config.colorPalette?.error?.s40 ?? DSErrorColor.main.s40,
              s50: config.colorPalette?.error?.s50 ?? DSErrorColor.main.s50,
              s60: config.colorPalette?.error?.s60 ?? DSErrorColor.main.s60,
              s70: config.colorPalette?.error?.s70 ?? DSErrorColor.main.s70,
              s80: config.colorPalette?.error?.s80 ?? DSErrorColor.main.s80,
              s90: config.colorPalette?.error?.s90 ?? DSErrorColor.main.s90,
              s100: config.colorPalette?.error?.s100 ?? DSErrorColor.main.s100,
            ),
      config.colorPalette?.warning == null
          ? DSWarningColor.main
          : DSWarningColor(
              base: config.colorPalette?.warning?.base ??
                  DSWarningColor.main.base,
              s10: config.colorPalette?.warning?.s10 ?? DSWarningColor.main.s10,
              s20: config.colorPalette?.warning?.s20 ?? DSWarningColor.main.s20,
              s30: config.colorPalette?.warning?.s30 ?? DSWarningColor.main.s30,
              s40: config.colorPalette?.warning?.s40 ?? DSWarningColor.main.s40,
              s50: config.colorPalette?.warning?.s50 ?? DSWarningColor.main.s50,
              s60: config.colorPalette?.warning?.s60 ?? DSWarningColor.main.s60,
              s70: config.colorPalette?.warning?.s70 ?? DSWarningColor.main.s70,
              s80: config.colorPalette?.warning?.s80 ?? DSWarningColor.main.s80,
              s90: config.colorPalette?.warning?.s90 ?? DSWarningColor.main.s90,
              s100: config.colorPalette?.warning?.s100 ??
                  DSWarningColor.main.s100,
            ),
    ],
    drawerTheme: DrawerThemeData(
      backgroundColor: colorScheme.background,
      surfaceTintColor: colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: colorScheme.background,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.background,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        vertical: config.inputContentPaddingY ?? 0,
        horizontal: config.inputContentPaddingX ?? 0,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintStyle: TextStyle(color: colorScheme.onBackground),
    ),
    dividerTheme: DividerThemeData(
      color: config.colorPalette?.primaryBrand?.s20,
      thickness: 1,
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        shape: MaterialStateProperty.resolveWith(
          (states) {
            return RoundedRectangleBorder(
              // side: BorderSide(
              //   width: .5,
              //   color: colorScheme.primary,
              // ),
              borderRadius: BorderRadius.circular(config.borderRadius ?? 0),
            );
          },
        ),
        elevation: MaterialStateProperty.resolveWith((states) => 10),
        surfaceTintColor: MaterialStateProperty.resolveWith(
            (states) => colorScheme.background),
        backgroundColor: MaterialStateProperty.resolveWith(
            (states) => colorScheme.background),
        padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.zero),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.only(left: 16),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.primary,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(config.borderRadius ?? 0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.primary,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(config.borderRadius ?? 0),
          ),
        ),
      ),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith((states) {
          return TypeUtil(
                  weight: FontWeight.w600, fontFamily: config.fontFamily)
              .small();
        }),
        minimumSize: config.buttonHeight == null
            ? null
            : MaterialStatePropertyAll(
                Size.fromHeight(config.buttonHeight ?? 45)),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }

          return null;
        }),
        side: MaterialStateProperty.resolveWith((states) {
          return BorderSide(color: colorScheme.primary);
        }),
        iconColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.onPrimary;
          }
          return colorScheme.primary.withOpacity(.7);
        }),
        // textStyle: MaterialStateProperty.resolveWith((states) {
        //   return TypeUtil(weight: FontWeight.w600).small();
        // }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.onPrimary;
          }

          return colorScheme.onBackground;
        }),
        shape: MaterialStateProperty.resolveWith(
          (states) {
            return RoundedRectangleBorder(
              side: BorderSide(color: colorScheme.primary),
              borderRadius: BorderRadius.circular(config.borderRadius ?? 0),
            );
          },
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith((states) {
          return TypeUtil(
                  weight: FontWeight.w600, fontFamily: config.fontFamily)
              .small();
        }),
        minimumSize: config.buttonHeight == null
            ? null
            : MaterialStateProperty.all(
                Size.fromHeight(config.buttonHeight ?? 45)),
        shape: MaterialStateProperty.resolveWith((states) {
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(config.borderRadius ?? 0));
        }),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
              horizontal: config.buttonPaddingX ?? 0,
              vertical: config.buttonPaddingY ?? 0),
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return colorScheme.surfaceVariant;
            }
            if (states.contains(MaterialState.hovered)) {
              return colorScheme.tertiary;
            }
            return colorScheme.secondary;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return colorScheme.surfaceVariant;
            }
            return colorScheme.surface;
          },
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      height: config.buttonHeight ?? 36,
      padding: EdgeInsets.symmetric(
          horizontal: config.buttonPaddingX ?? 0,
          vertical: config.buttonPaddingY ?? 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(config.borderRadius ?? 0),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith((states) {
          return TypeUtil(
                  weight: FontWeight.w600, fontFamily: config.fontFamily)
              .small();
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.surfaceVariant;
          }
          if (states.contains(MaterialState.hovered)) {
            return colorScheme.tertiary;
          }
          return colorScheme.secondary;
        }),
        side: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return BorderSide(
                color: colorScheme.tertiary,
                width: 1.0,
                style: BorderStyle.solid);
          }
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(
                color: colorScheme.surfaceVariant,
                width: 1.0,
                style: BorderStyle.solid);
          }
          return BorderSide(
              color: colorScheme.secondary,
              width: 1.0,
              style: BorderStyle.solid);
        }),
        minimumSize: config.buttonHeight == null
            ? null
            : MaterialStateProperty.all(
                Size.fromHeight(config.buttonHeight ?? 45)),
        shape: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return RoundedRectangleBorder(
                side: BorderSide(color: colorScheme.onTertiary, width: 1.5),
                borderRadius: BorderRadius.circular(config.borderRadius ?? 0));
          }
          if (states.contains(MaterialState.hovered)) {
            return RoundedRectangleBorder(
                side: BorderSide(color: colorScheme.tertiary, width: 1.5),
                borderRadius: BorderRadius.circular(config.borderRadius ?? 0));
          }
          if (states.contains(MaterialState.disabled)) {
            return RoundedRectangleBorder(
                side: const BorderSide(width: 0),
                borderRadius: BorderRadius.circular(config.borderRadius ?? 0));
          }

          return RoundedRectangleBorder(
              side: BorderSide(color: colorScheme.onSecondary, width: .5),
              borderRadius: BorderRadius.circular(config.borderRadius ?? 0));
        }),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
              horizontal: config.buttonPaddingX ?? 0,
              vertical: config.buttonPaddingY ?? 0),
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.surface;
          }
          return colorScheme.surface;
        }),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith((states) {
          return TypeUtil(
                  weight: FontWeight.w600, fontFamily: config.fontFamily)
              .small();
        }),
        minimumSize: config.buttonHeight == null
            ? null
            : MaterialStateProperty.all(
                Size.fromHeight(config.buttonHeight ?? 45)),
        shape: MaterialStateProperty.resolveWith((states) {
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(config.borderRadius ?? 0));
        }),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
              horizontal: config.buttonPaddingX ?? 0,
              vertical: config.buttonPaddingY ?? 0),
        ),
        // foregroundColor: MaterialStateProperty.resolveWith((states) {
        //   if (states.contains(MaterialState.disabled)) {
        //     return colorScheme.onInverseSurface;
        //   }
        //   if (states.contains(MaterialState.hovered)) {
        //     return colorScheme.onSecondaryContainer;
        //   }
        //   return colorScheme.onSecondary;
        // }),
        // backgroundColor: MaterialStateProperty.resolveWith(
        //   (states) {
        //     if (states.contains(MaterialState.disabled)) {
        //       return colorScheme.surfaceVariant;
        //     }
        //     if (states.contains(MaterialState.selected)) {
        //       return colorScheme.tertiary;
        //     }
        //     if (states.contains(MaterialState.hovered)) {
        //       return colorScheme.secondaryContainer;
        //     }
        //     return colorScheme.secondary;
        //   },
        // ),
        // shadowColor: MaterialStateColor.resolveWith(
        //     (states) => colors_.secondaryBrand!.s20),
      ),
    ),
    disabledColor: colorScheme.surfaceVariant,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith((states) {
          return TypeUtil(
                  weight: FontWeight.w600, fontFamily: config.fontFamily)
              .small();
        }),
        minimumSize: config.buttonHeight == null
            ? null
            : MaterialStateProperty.all(
                Size.fromHeight(config.buttonHeight ?? 45)),
        shape: MaterialStateProperty.resolveWith((states) {
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(config.borderRadius ?? 0));
        }),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
              horizontal: config.buttonPaddingX ?? 0,
              vertical: config.buttonPaddingY ?? 0),
        ),
        // foregroundColor: MaterialStateProperty.resolveWith((states) {
        //   if (states.contains(MaterialState.hovered)) {
        //     return colorScheme.onSecondaryContainer;
        //   }
        //   if (states.contains(MaterialState.disabled)) {
        //     return colorScheme.onInverseSurface;
        //   }
        //   return colorScheme.onSecondary;
        // }),
        // backgroundColor: MaterialStateProperty.resolveWith(
        //   (states) {
        //     if (states.contains(MaterialState.disabled)) {
        //       return colorScheme.surfaceVariant;
        //     }
        //     if (states.contains(MaterialState.selected)) {
        //       return colorScheme.tertiary;
        //     }
        //     if (states.contains(MaterialState.hovered)) {
        //       return colorScheme.secondaryContainer;
        //     }
        //     return colorScheme.secondary;
        //   },
        // ),
        elevation: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return 0;
          }

          return 5;
        }),
        // shadowColor:
        //     MaterialStateColor.resolveWith((states) => colorScheme.secondary),
      ),
    ),
  );

  return baseTheme.copyWith(
    textTheme: config.fontTheme != null
        ? config.fontTheme!(baseTheme.textTheme)
        : null,
    primaryTextTheme: config.fontThemeAlt != null
        ? config.fontThemeAlt!(baseTheme.primaryTextTheme)
        : null,
  );

  // return baseTheme;
}
