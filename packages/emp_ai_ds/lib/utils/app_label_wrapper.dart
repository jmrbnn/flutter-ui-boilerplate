// ignore_for_file: must_be_immutable

import 'package:emp_ai_ds/entities/theme_config.dart';
import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/color_utils.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppLabelWrapper {
  final bool isRequired;
  final bool isDense;
  final String? inputLabel;
  final String? inputGuide;
  final String? helperText;
  final String? errorText;
  final EdgeInsets? margin;
  BuildContext context;
  WidgetRef ref;
  AppLabelWrapper({
    this.isRequired = false,
    this.isDense = false,
    this.inputLabel,
    this.inputGuide,
    this.helperText,
    this.errorText,
    this.margin,
    required this.context,
    required this.ref,
  });

  Widget topLabels() {
    ThemeConfig config = ref.watch(themeConfigProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: isRequired && inputLabel != null,
          replacement: inputLabel == null
              ? const SizedBox.shrink()
              : Text(
                  inputLabel ?? '',
                  style: isDense
                      ? TypeUtil(
                              fontFamily: config.fontFamily,
                              weight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.onBackground)
                          .small()
                      : TypeUtil(
                              fontFamily: config.fontFamily,
                              weight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.onBackground)
                          .body(),
                ),
          child: RichText(
            text: TextSpan(
                style: isDense
                    ? TypeUtil(
                            fontFamily: config.fontFamilyAlt,
                            weight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onBackground)
                        .small()
                    : TypeUtil(
                            fontFamily: config.fontFamilyAlt,
                            weight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onBackground)
                        .body(),
                children: [
                  TextSpan(
                      text: inputLabel,
                      style: isDense
                          ? TypeUtil(
                                  fontFamily: config.fontFamilyAlt,
                                  weight: FontWeight.w700,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground)
                              .small()
                          : TypeUtil(
                                  fontFamily: config.fontFamilyAlt,
                                  weight: FontWeight.w700,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground)
                              .body()),
                  TextSpan(
                    text: isRequired && inputLabel != null ? ' * ' : '',
                    style: isDense
                        ? TypeUtil(
                                fontFamily: config.fontFamilyAlt,
                                weight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.error)
                            .small()
                        : TypeUtil(
                                fontFamily: config.fontFamilyAlt,
                                weight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.error)
                            .body(),
                  ),
                ]),
          ),
        ),
        Visibility(
          visible: inputGuide != null,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(inputGuide ?? '',
                style: isDense
                    ? TypeUtil(
                        fontFamily: config.fontFamilyAlt,
                        color: AppColors.neutral[50],
                      ).xsmall()
                    : TypeUtil(
                        fontFamily: config.fontFamilyAlt,
                        color: AppColors.neutral[50],
                      ).small()),
          ),
        ),
      ],
    );
  }

  Widget bottomLabels() {
    ThemeConfig config = ref.watch(themeConfigProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: helperText != null && helperText != '',
          child: Text(helperText ?? '',
              style: isDense
                  ? TypeUtil(
                      fontFamily: config.fontFamilyAlt,
                      color: AppColors.neutral[50],
                    ).xsmall()
                  : TypeUtil(
                      fontFamily: config.fontFamilyAlt,
                      color: AppColors.neutral[50],
                    ).small()),
        ),
        Visibility(
          visible: errorText != null,
          child: Text(errorText ?? '',
              style: isDense
                  ? TypeUtil(
                      fontFamily: config.fontFamilyAlt,
                      color: Theme.of(context).colorScheme.error,
                    ).xsmall()
                  : TypeUtil(
                      fontFamily: config.fontFamilyAlt,
                      color: Theme.of(context).colorScheme.error,
                    ).small()),
        ),
      ],
    );
  }
}
