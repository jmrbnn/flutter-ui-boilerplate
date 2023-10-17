import 'package:emp_ai_ds/entities/theme_config.dart';
import 'package:emp_ai_ds/extensions/color_scheme.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyEmaptaThemeConfig {
  static ThemeConfig config = ThemeConfig.fromJson({
    "logo":
        'https://emapta.com/wp-content/uploads/2020/10/emapta-outsourcing-reimagined-logo.png',
    "name": 'default',
    "fontFamily": 'Poppins',
    "fontFamilyAlt": 'Inter',
    "fontTheme": GoogleFonts.poppinsTextTheme,
    "fontThemeAlt": GoogleFonts.interTextTheme,
    "borderRadius": 8,
    "buttonHeight": 48,
    "buttonPaddingX": 24,
    "buttonPaddingY": 12,
    "buttonSmallHeight": 40,
    "buttonSmallPaddingX": 20,
    "buttonSmallPaddingY": 8,
    "inputContentPaddingX": 16,
    "inputContentPaddingY": 12,
    "enableHoverEffect": true,
    "textInputIconColor": colorPalette.primaryBrand?.s30,
    "loginHeader": Column(
      children: [
        SvgPicture.asset(
          'assets/images/svg/emapta-outsourcing-reimagined.svg',
          package: 'emp_ai_ds',
          width: 110,
        ),
        const SizedBox(
          height: 41,
        ),
        const Text(
          'Log in to continue',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              fontSize: 16,
              color: Color(0xFF202939)),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    ),
    "confirmModalsInAuth": false,
    "showPasswordHintsOnLoad": true,
    "loginButtonText": 'Continue',
    "loginFooter": Container(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Terms & Conditions',
                style: TypeUtil(
                  style: TypeStyle.XSMALL,
                  color: const Color(0XFF5E79DC),
                  weight: FontWeight.w600,
                ).make(),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await launchUrlString(
                      'https://emp-identity-management.playground.emaptagtsrnd.xyz/#/terms-and-conditions',
                      mode: LaunchMode.platformDefault,
                      webOnlyWindowName: '_self',
                    );
                  },
              ),
              TextSpan(
                text: ' and ',
                style: TypeUtil(
                        style: TypeStyle.XSMALL,
                        color: const Color(0XFF697586),
                        weight: FontWeight.w400)
                    .make(),
              ),
              TextSpan(
                text: 'Privacy Policy',
                style: TypeUtil(
                  style: TypeStyle.XSMALL,
                  color: const Color(0XFF5E79DC),
                  weight: FontWeight.w600,
                ).make(),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await launchUrlString(
                      'https://emapta.com/privacy-policy/',
                      mode: LaunchMode.platformDefault,
                      webOnlyWindowName: '_self',
                    );
                  },
              )
            ],
          ),
        ),
      ),
    ),
    "setupMfaHeader": Column(
      children: [
        const SizedBox(height: 24),
        SvgPicture.asset(
          'assets/images/svg/emapta-outsourcing-reimagined.svg',
          package: 'emp_ai_ds',
          width: 110,
        ),
        const SizedBox(
          height: 41,
        ),
        const Text(
          'Secure your account',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              package: 'emp_ai_ds',
              fontSize: 18,
              color: Color(0xFF202939)),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'Scan or upload the QR code using your preferred authenticator app, then enter your one-time code',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
              package: 'emp_ai_ds',
              fontSize: 12,
              color: Color(0xFF202939)),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    ),
    "verifyMfaHeader": Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        SvgPicture.asset(
          'assets/images/svg/emapta-outsourcing-reimagined.svg',
          package: 'emp_ai_ds',
          width: 110,
        ),
        const SizedBox(
          height: 41,
        ),
        const Text(
          'Verify your identity',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              package: 'emp_ai_ds',
              fontSize: 18,
              color: Color(0xFF202939)),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          ' Enter the verification code generated by your authenticator app in your mobile device.',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
              package: 'emp_ai_ds',
              fontSize: 12,
              color: Color(0xFF202939)),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    ),
    "resetPasswordHeader": Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        SvgPicture.asset(
          'assets/images/svg/emapta-outsourcing-reimagined.svg',
          package: 'emp_ai_ds',
          width: 110,
        ),
        const SizedBox(
          height: 41,
        ),
        const Text(
          'Reset your password',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              package: 'emp_ai_ds',
              fontSize: 18,
              color: Color(0xFF202939)),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'Enter your username and we’ll send you an email with instructions to reset your password.',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
              package: 'emp_ai_ds',
              fontSize: 12,
              color: Color(0xFF202939)),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    ),
    "resetPasswordFooter": Padding(
      padding: const EdgeInsets.only(top: 24),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
            children: [
              TextSpan(text: 'You will receive an email from '),
              TextSpan(
                  text: 'no-reply@empata.com\n',
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Inter',
                      package: 'emp_ai_ds',
                      fontWeight: FontWeight.w600,
                      height: 1.6)),
              TextSpan(
                  text:
                      'If you don’t receive an email within a few minutes, kindly check if your username is correct, as well as your spam folders.'),
            ],
            style: TextStyle(
                fontSize: 10,
                fontFamily: 'Inter',
                package: 'emp_ai_ds',
                color: Color(0xFF697586),
                height: 1.6)),
      ),
    ),
    "confirmIdentityHeader": Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        SvgPicture.asset(
          'assets/images/svg/emapta-outsourcing-reimagined.svg',
          package: 'emp_ai_ds',
          width: 110,
        ),
        const SizedBox(
          height: 41,
        ),
        const Text(
          'Confirm your email',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              package: 'emp_ai_ds',
              fontSize: 18,
              color: Color(0xFF202939)),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'We sent an one-time code to your email',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
              package: 'emp_ai_ds',
              fontSize: 12,
              color: Color(0xFF202939)),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    ),
    "confirmIdentityFooter": const Padding(
      padding: EdgeInsets.only(top: 24),
      child: Wrap(
        children: [
          Text(
            'No your email address?',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Inter',
              package: 'emp_ai_ds',
            ),
          ),
          Text(
            ' Switch account ',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF2A4BC2),
              fontFamily: 'Inter',
              package: 'emp_ai_ds',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
    "createNewPasswordHeader": Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        SvgPicture.asset(
          'assets/images/svg/emapta-outsourcing-reimagined.svg',
          package: 'emp_ai_ds',
          width: 110,
        ),
        const SizedBox(
          height: 41,
        ),
        const Text(
          'Create new password',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              package: 'emp_ai_ds',
              fontSize: 18,
              color: Color(0xFF202939)),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'Set your new password that must be different from previously used passwords',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
              package: 'emp_ai_ds',
              fontSize: 12,
              color: Color(0xFF202939)),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    ),
    "lightColorScheme": {
      "brightness": 'light',
      "primary": colorToHex(
        colorPalette.primaryBrand?.s90 ?? Colors.transparent,
      ),
      "onPrimary": colorToHex(
        colorPalette.neutral?.s0 ?? Colors.transparent,
      ),
      "primaryContainer": colorToHex(
        colorPalette.primaryBrand?.s10 ?? Colors.transparent,
      ),
      "onPrimaryContainer": colorToHex(
        colorPalette.primaryBrand?.s90 ?? Colors.transparent,
      ),
      "secondary": colorToHex(
        colorPalette.secondaryBrand?.s50 ?? Colors.transparent,
      ),
      "onSecondary": colorToHex(
        colorPalette.neutral?.s0 ?? Colors.transparent,
      ),
      "secondaryContainer": colorToHex(
        colorPalette.secondaryBrand?.s10 ?? Colors.transparent,
      ),
      "onSecondaryContainer": colorToHex(
        colorPalette.secondaryBrand?.s80 ?? Colors.transparent,
      ),
      "error": colorToHex(
        colorPalette.error?.s60 ?? Colors.transparent,
      ),
      "onError": colorToHex(
        colorPalette.neutral?.s0 ?? Colors.transparent,
      ),
      "errorContainer": colorToHex(
        colorPalette.error?.s10 ?? Colors.transparent,
      ),
      "onErrorContainer": colorToHex(
        colorPalette.error?.s100 ?? Colors.transparent,
      ),
      "outline": colorToHex(
        colorPalette.neutral?.s40 ?? Colors.transparent,
      ),
      "outlineVariant": colorToHex(
        colorPalette.neutral?.s30 ?? Colors.transparent,
      ),
      "onSurface": colorToHex(
        colorPalette.neutral?.s80 ?? Colors.transparent,
      ),
      "onSurfaceVariant": colorToHex(
        colorPalette.neutral?.s60 ?? Colors.transparent,
      ),
      "tertiary": "#1E685C",
      "onTertiary": "#FFFFFF",
      "tertiaryContainer": "#293B98",
      "onTertiaryContainer": "#F0F5FF",
      "background": "#FFFFFF",
      "onBackground": "#1B1B1F",
      "surface": "#FBF8FD",
      "surfaceVariant": "#E2E1EC",
      "inverseSurface": "#303034",
      "onInverseSurface": "#F2F0F4",
      "inversePrimary": "#B8C4FF",
      "shadow": "#000000",
      "scrim": "#000000",
      "surfaceTint": colorToHex(
        colorPalette.neutral?.s0 ?? Colors.transparent,
      ),
      "roles": {
        "primary": "#2A4BC2",
        "primaryVariant": "#5E79DC",
        "primaryContainer": "#DFE4F8",
        "onPrimaryContainer": "#1C3282",
        "secondary": "#1EA8AA",
        "secondaryVariant": "#198C8E",
        "secondaryContainer": "#DEF9F9",
        "onSecondaryContainer": "#1EA8AA",
        "error": "#CF1A2F",
        "errorVariant": "#E95364",
        "errorContainer": "#FCE6E9",
        "onErrorContainer": "#2C010C",
        "success": "#7FBA00",
        "successVariant": "#A4F000",
        "successContainer": "#F5FFDF",
        "onSuccessContainer": "#192500",
        "warning": "#CD9300",
        "warningVariant": "#FFC32B",
        "warningContainer": "#FFF8E6",
        "onWarningContainer": "#332500",
        "background": "#EEF2F6",
        "backgroundDim": "#E3E8EF",
        "backgroundBright": "#F8FAFC",
        "card0": "#FFFFFF",
        "card10": "#F8FAFC",
        "card20": "#EEF2F6",
        "card30": "#E3E8EF",
        "card40": "#CDD5DF",
        "contentBlack": "#202939",
        "contentGray": "#697586",
        "contentWhite": "#FFFFFF",
        "border": "#CDD5DF",
        "divider": "#E3E8EF",
      }
    },
    "darkColorScheme": {
      "brightness": 'dark',
      "primary": "#B8C4FF",
      "onPrimary": "#001354",
      "primaryContainer": "#8FA5E4",
      "onPrimaryContainer": "#0C135C",
      "secondary": "#B1F1E6",
      "onSecondary": "#298B7E",
      "secondaryContainer": "#005047",
      "onSecondaryContainer": "#98F3E3",
      "tertiary": "#77E0D3",
      "onTertiary": "#184E48",
      "tertiaryContainer": "#B3C6F0",
      "onTertiaryContainer": "#0C135C",
      "error": "#FFB4AB",
      "onError": "#690005",
      "errorContainer": "#93000A",
      "onErrorContainer": "#FFB4AB",
      "outline": "#90909A",
      "outlineVariant": "#45464F",
      "background": "#121926",
      "onBackground": "#E4E1E6",
      "surface": "#1B1B1F",
      "onSurface": "#E4E1E6",
      "surfaceVariant": "#202939",
      "onSurfaceVariant": "#C6C5D0",
      "inverseSurface": "#E4E1E6",
      "onInverseSurface": "#303034",
      "inversePrimary": "#3D56BA",
      "surfaceTint": "#B8C4FF",
      "roles": {
        "primary": "#9EAFEA",
        "primaryVariant": "#5E79DC",
        "primaryContainer": "#0E1941",
        "onPrimaryContainer": "#BFCAF1",
        "secondary": "#4FDEE0",
        "secondaryVariant": "#198C8E",
        "secondaryContainer": "#0A3839",
        "onSecondaryContainer": "#4FDEE0",
        "error": "#E95364",
        "errorVariant": "#E95364",
        "errorContainer": "#580318",
        "onErrorContainer": "#FCE6E9",
        "success": "#A4F000",
        "successVariant": "#A4F000",
        "successContainer": "#334A00",
        "onSuccessContainer": "#F5FFDF",
        "warning": "#FFD467",
        "warningVariant": "#FFC32B",
        "warningContainer": "#332500",
        "onWarningContainer": "#FFF8E6",
        "background": "#121926",
        "backgroundDim": "#000000",
        "backgroundBright": "#202939",
        "card0": "#000000",
        "card10": "#121926",
        "card20": "#202939",
        "card30": "#364152",
        "card40": "#4B5565",
        "contentBlack": "#E3E8EF",
        "contentGray": "#9AA4B2",
        "contentWhite": "#121926",
        "border": "#4B5565",
        "divider": "#364152",
      }
    },
    'colorPalette': colorPalette.toJson(),
  });

  static ColorPalette colorPalette = ColorPalette.fromJson({
    "textDark": {
      "100": "#2B2D32",
      "80": "#2B2D32",
      "64": "#2B2D32",
    },
    "textLight": {
      "100": "#F5F5F5",
      "80": "#F5F5F5",
      "64": "#F5F5F5",
    },
    "neutral": {
      "base": "#202939",
      "0": "#FFFFFF",
      "10": "#F8FAFC",
      "20": "#EEF2F6",
      "30": "#E3E8EF",
      "40": "#CDD5DF",
      "50": "#9AA4B2",
      "60": "#697586",
      "70": "#4B5565",
      "80": "#364152",
      "90": "#202939",
      "100": "#121926"
    },
    "primaryBrand": {
      "base": "#2A4BC2",
      "0": "#FFFFFF",
      "10": "#F0F5FF",
      "20": "#D8E4FC",
      "30": "#B3C6F0",
      "40": "#8FA5E4",
      "50": "#667FD0",
      "60": "#3D56BA",
      "70": "#293B98",
      "80": "#182579",
      "90": "#2A4BC2",
      "100": "#060A41"
    },
    "secondaryBrand": {
      "base": "#298B7E",
      "0": "#FFFFFF",
      "10": "#F5FEFB",
      "20": "#DAFCF5",
      "30": "#B1F1E6",
      "40": "#77E0D3",
      "50": "#4ECBB8",
      "60": "#38B09D",
      "70": "#298B7E",
      "80": "#1E685C",
      "90": "#184E48",
      "100": "#133F3A"
    },
    "success": {
      "base": "#7FBA00",
      "0": "#FFFFFF",
      "10": "#F6FFED",
      "20": "#DCF4C6",
      "30": "#BEE4A1",
      "40": "#A1D37E",
      "50": "#83C35E",
      "60": "#66B241",
      "70": "#4A8F2D",
      "80": "#316C1B",
      "90": "#1C4B0E",
      "100": "#0B2904"
    },
    "error": {
      "base": "#cf1a2f",
      "10": "#FFF1F0",
      "20": "#F8CFCB",
      "30": "#EDABA7",
      "40": "#E18583",
      "50": "#D55F60",
      "60": "#C3383F",
      "70": "#A32730",
      "80": "#841724",
      "90": "#660D1A",
      "100": "#4B0815"
    },
    "warning": {
      "base": "#ffb701",
      "0": "#FFFFFF",
      "10": "#FEFFE6",
      "20": "#FEFEC3",
      "30": "#FCF9A4",
      "40": "#FAF286",
      "50": "#F7E866",
      "60": "#EFD845",
      "70": "#C9AF30",
      "80": "#A38A21",
      "90": "#7F6718",
      "100": "#5C470F"
    }
  });

  Map<String, dynamic> colorSchemeLight = ColorScheme.fromSeed(
    brightness: Brightness.light,
    primary: colorPalette.secondaryBrand!.s60,
    seedColor: colorPalette.secondaryBrand!.s60,
  ).toJson();
  ColorScheme colorSchemeDark = ColorScheme.fromSeed(
    brightness: Brightness.light,
    primary: colorPalette.secondaryBrand!.s60,
    seedColor: colorPalette.secondaryBrand!.s60,
  );
}
