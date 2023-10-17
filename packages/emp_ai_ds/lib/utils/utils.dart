// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:typed_data';

import 'package:emp_ai_ds/constants/themes/default/default_theme.dart';
import 'package:emp_ai_ds/constants/themes/default/default_theme_constants.dart';
import 'package:emp_ai_ds/constants/themes/myemapta/myemapta_theme_constants.dart';
import 'package:emp_ai_ds/entities/app_dropdown_option.dart';
import 'package:emp_ai_ds/entities/theme_config.dart';
import 'package:emp_ai_ds/extensions/ds_error_color_scheme.dart';
import 'package:emp_ai_ds/extensions/ds_neutral_color_scheme.dart';
import 'package:emp_ai_ds/extensions/ds_success_color_scheme.dart';
import 'package:emp_ai_ds/extensions/ds_warning_color_scheme.dart';
import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/color_utils.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:emp_ai_ds/extensions/color_theme_extension.dart';
import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher.dart';

class DsUtils {
  static ThemeConfig themeConfiguration(WidgetRef ref) {
    return ref.read(themeConfigProvider);
  }

  static String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  static const emptyWidget = SizedBox.shrink();

  static dynamic colors(
    BuildContext context,
    ColorSets set, {
    double? variant,
  }) {
    dynamic colorSet;

    switch (set) {
      case ColorSets.primary:
        colorSet = context.dsPrimaryColor;
      case ColorSets.accent:
        colorSet = context.dsAccentColor;
      case ColorSets.neutral:
        colorSet = context.dsNeutralColor;
      case ColorSets.success:
        colorSet = context.dsSuccessColor;
      case ColorSets.error:
        colorSet = context.dsErrorColor;
      case ColorSets.warning:
        colorSet = context.dsWarningColor;

      default:
        colorSet = null;
    }
    return colorSet;
  }

  static dynamic color(
    BuildContext context,
    ColorSets set, {
    double? variant,
  }) {
    dynamic colorSet;

    switch (set) {
      case ColorSets.primary:
        colorSet = context.dsPrimaryColor;
      case ColorSets.accent:
        colorSet = context.dsAccentColor;
      case ColorSets.neutral:
        colorSet = context.dsNeutralColor;
      case ColorSets.success:
        colorSet = context.dsSuccessColor;
      case ColorSets.error:
        colorSet = context.dsErrorColor;
      case ColorSets.warning:
        colorSet = context.dsWarningColor;

      default:
        colorSet = null;
    }
    return colorSet?.shade(variant) ?? Colors.black45;
  }

  static Widget loadSvgFile({
    required String path,
    String? package,
    double? width,
    double? height,
  }) {
    return SvgPicture.asset(
      path,
      package: package,
      width: width,
      height: height,
    );
  }

  static void setBrightnessMode(WidgetRef ref, {required ThemeMode mode}) {
    if (ref.read(themeModeProvider) != mode) {
      handleBrightnessChange(ref);
    }
  }

  static void handleBrightnessChange(WidgetRef ref) {
    ThemeConfig config = ref.read(themeConfigProvider);
    ThemeModeNotifier mode = ref.read(themeModeProvider.notifier);
    ThemeColorNotifier color = ref.read(colorProvider.notifier);

    mode.toggleTheme();

    if (ref.read(themeModeProvider) == ThemeMode.light) {
      color.updateColor(config.lightColorRoles ??
          ColorRolesConfig.fromJson({
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
            "onSuccessContainer": "#F5FFDF",
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
          }));
    } else {
      color.updateColor(config.darkColorRoles ??
          ColorRolesConfig.fromJson({
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
            "border": "#121926",
            "divider": "#364152",
          }));
    }
  }

  static void toggleThemeData(WidgetRef ref) {
    ref
        .read(isCustomThemeProvider.notifier)
        .toggle(!ref.read(isCustomThemeProvider));

    if (ref.read(isCustomThemeProvider)) {
      ref.read(themeConfigProvider.notifier).update(DefaultTheme.config);
      ref.read(lightThemeProvider.notifier).updateTheme(buildDefaultTheme(
            config: DefaultTheme.config,
            brightness: Brightness.light,
          ));
      ref.read(darkThemeProvider.notifier).updateTheme(buildDefaultTheme(
            config: DefaultTheme.config,
            brightness: Brightness.dark,
          ));
    } else {
      ref.read(themeConfigProvider.notifier).update(ThemeConfig.fromJson({}));
      ref
          .read(lightThemeProvider.notifier)
          .updateTheme(ThemeData.light(useMaterial3: true));
      ref
          .read(darkThemeProvider.notifier)
          .updateTheme(ThemeData.dark(useMaterial3: true));
    }
  }

  static void changeThemeData(WidgetRef ref, String clientId) {
    if (clientId == 'EMAPTA-MYEMAPTA' || clientId == 'EMAPTA-MYEMAPTATWO') {
      ref.read(themeConfigProvider.notifier).update(MyEmaptaThemeConfig.config);
    } else {
      ref.read(themeConfigProvider.notifier).update(DefaultTheme.config);
    }

    ref.read(lightThemeProvider.notifier).updateTheme(buildDefaultTheme(
          config: ref.read(themeConfigProvider),
          brightness: Brightness.light,
        ));
    ref.read(darkThemeProvider.notifier).updateTheme(buildDefaultTheme(
          config: ref.read(themeConfigProvider),
          brightness: Brightness.dark,
        ));
  }

  bool isValidUrl(String urlString) {
    Uri? uri = Uri.tryParse(urlString);
    return uri != null && uri.hasScheme && uri.hasAuthority;
  }

  static Map<String, dynamic> cleanMap(
    Map<dynamic, dynamic> map_, {
    List omitKeys = const ['accessToken'],
  }) {
    return Map.fromEntries(
      map_.entries
          .where((entry) =>
              entry.value != null &&
              entry.value.toString().isNotEmpty &&
              !omitKeys.contains(entry.key.toString()))
          .map((entry) =>
              MapEntry<String, dynamic>(entry.key.toString(), entry.value)),
    );
  }

  String uint8ListTob64(Uint8List uint8list) {
    String base64String = base64Encode(uint8list);
    String header = "data:image/png;base64,";
    return header + base64String;
  }

  static void showSnackBar(BuildContext context, title, {SnackBarTypes? type}) {
    Color color;
    switch (type) {
      case SnackBarTypes.success:
        color = Theme.of(context).extension<DSSuccessColor>()?.base ??
            AppColors.success;
        break;
      case SnackBarTypes.warning:
        color = Theme.of(context).extension<DSWarningColor>()?.base ??
            AppColors.warning.shade800;
        break;
      case SnackBarTypes.error:
        color = Theme.of(context).extension<DSErrorColor>()?.base ??
            AppColors.error;
        break;
      default:
        color = Theme.of(context).extension<DSNeutralColor>()?.base ??
            AppColors.neutral.shade900;
    }

    final snackBar = SnackBar(
      content: Text(
        title,
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'Dismiss',
        disabledTextColor: Colors.white,
        onPressed: () {
          //Do whatever you want
        },
      ),
      onVisible: () {
        //your code goes here
      },
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> useCaseHandler<T>(
    Future<T> Function() call, {
    Function(Exception? exception)? onError,
    Function(T response)? onSuccess,
  }) async {
    try {
      final T response = await call();

      if (onSuccess != null) onSuccess(response);
    } on Exception catch (error) {
      onError!(error);
    }
  }

  static List<AppDropdownOption> getOptions(
    List list, {
    required String labelKeyName,
    required String valueKeyName,
  }) {
    List<AppDropdownOption> result = [];

    for (var item in list) {
      result.add(AppDropdownOption(
        label: item[labelKeyName],
        value: item[valueKeyName],
      ));
    }
    return result;
  }

  static String formatDateTime(String datetime, {String? format}) {
    if (datetime != '' && datetime != 'N/A') {
      String jiffy;
      if (format != null) {
        jiffy = Jiffy.parse(DateTime.parse(datetime).toLocal().toString(),
                isUtc: true)
            .format(pattern: format);
      } else {
        jiffy = Jiffy.parse(DateTime.parse(datetime).toLocal().toString(),
                isUtc: true)
            .yMMMMd;
      }

      return jiffy;
    }
    return datetime;
  }

  static Widget generateActionsDropdown({
    required BuildContext context,
    required List actions,
    required Map row,
    required Function(String?) onSelect,
  }) {
    return Theme(
      data: ThemeData(
        focusColor: Colors.white,
      ),
      child: DropdownButton<String>(
        dropdownColor: Colors.white,
        enableFeedback: false,
        focusColor: Colors.white,
        isExpanded: true,
        alignment: AlignmentDirectional.topEnd,
        hint: Center(
          child: Icon(
            Icons.more_horiz,
            color: color(context, ColorSets.primary, variant: 60),
            size: 15,
          ),
        ),
        icon: emptyWidget,
        underline: emptyWidget,
        items: actions.map((item) {
          return DropdownMenuItem<String>(
            value: item['id'],
            child: Text(
              item['title'],
              style: TypeUtil().small(),
            ),
          );
        }).toList(),
        onChanged: (action) {
          onSelect(action);
        },
      ),
    );
  }

  static int countCharactersInCase(String input, CaseType caseType) {
    int count = 0;

    for (int i = 0; i < input.length; i++) {
      final char = input[i];
      if (caseType == CaseType.lowercase && char == char.toLowerCase()) {
        count++;
      } else if (caseType == CaseType.uppercase && char == char.toUpperCase()) {
        count++;
      }
    }

    return count;
  }

  static Widget wrapLinksInText(String text, {TextStyle? style}) {
    // Define a pattern to identify URLs in the text
    const urlPattern = r'https?://\S+';

    final matches = RegExp(urlPattern).allMatches(text);

    if (matches.isEmpty) {
      // If there are no URLs, return the original text
      return Text(text);
    }

    final widgets = <InlineSpan>[];

    var lastIndex = 0;

    for (var match in matches) {
      if (match.start > lastIndex) {
        // Add the non-link text before this link
        widgets.add(TextSpan(
          text: text.substring(lastIndex, match.start),
        ));
      }

      final url = text.substring(match.start, match.end);

      widgets.add(
        TextSpan(
          text: url,
          style: const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // Open the URL when tapped
              launchUrl(Uri.parse(url));
            },
        ),
      );

      lastIndex = match.end;
    }

    if (lastIndex < text.length) {
      // Add any remaining non-link text
      widgets.add(TextSpan(text: text.substring(lastIndex)));
    }

    return RichText(
      text: TextSpan(
        children: widgets,
        style: style,
      ),
    );
  }

  static Widget textWithEllipsis(
    String text, {
    TextStyle? style,
    int maxLines = 1,
    TextAlign textAlign = TextAlign.start,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    return Text(
      text,
      style: style,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
    );
  }

  static Color getTextColorForBackground(Color backgroundColor) {
    if (ThemeData.estimateBrightnessForColor(backgroundColor) ==
        Brightness.dark) {
      return Colors.white;
    }

    return Colors.black;
  }
}

enum CaseType {
  lowercase,
  uppercase,
}

enum SnackBarTypes {
  primary('Primary'),
  success('Success'),
  error('Error'),
  warning('Warning');

  const SnackBarTypes(this.label);
  final String label;
}

enum ColorSets {
  primary('Primary'),
  accent('Accent'),
  neutral('Neutral'),
  error('Error'),
  success('Success'),
  warning('Warning'),
  ;

  const ColorSets(this.label);
  final String label;
}
