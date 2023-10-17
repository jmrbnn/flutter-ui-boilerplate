import 'package:emp_ai_ds/entities/app_dropdown_option.dart';
import 'package:emp_ai_ds/entities/theme_config.dart';
import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/color_utils.dart';
import 'package:emp_ai_ds/utils/app_label_wrapper.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppCategoryInput extends ConsumerStatefulWidget {
  final double? width;
  final double? dropdownWidth;
  final String? placeholder;
  final String? dropdownLabel;
  final List<AppDropdownOption> options;
  final Function(dynamic)? onSelected;
  final TextEditingController? controller;
  final Function(dynamic)? onChange;
  final bool isDense;
  final AppInputStatus status;
  final bool disabled;
  final Color? customColor;
  final EdgeInsets? padding;
  final String? inputGuide;
  final String? inputLabel;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final bool isRequired;
  final EdgeInsets? margin;
  final bool enableSearch;
  final bool enableFilter;
  final Widget? customTrailingIcon;
  final Widget? customLeadingIcon;
  final dynamic initialSelection;
  const AppCategoryInput({
    super.key,
    this.width,
    this.dropdownWidth,
    this.placeholder = '',
    this.dropdownLabel,
    this.options = const [],
    this.onSelected,
    this.controller,
    this.onChange,
    this.isDense = false,
    this.status = AppInputStatus.idle,
    this.disabled = false,
    this.customColor,
    this.padding,
    this.inputGuide,
    this.inputLabel,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.isRequired = false,
    this.margin,
    this.enableSearch = true,
    this.enableFilter = true,
    this.customTrailingIcon,
    this.customLeadingIcon,
    this.initialSelection,
  });

  @override
  AppCategoryInputState createState() => AppCategoryInputState();
}

class AppCategoryInputState extends ConsumerState<AppCategoryInput> {
  bool isHovered = false;
  bool isOnFocus = false;
  late Color colorIdle;
  late Color colorDisabled;
  late Color colorDisabledFill;
  late Color colorSuccess;
  late Color colorWarning;
  late Color colorError;
  late Color themeColor;
  late ThemeConfig config;
  @override
  void initState() {
    super.initState();
    config = DsUtils.themeConfiguration(ref);

    _setThemeColor();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller_ =
        widget.controller ?? TextEditingController();
    _setThemeColor();
    final List<DropdownMenuEntry> options_ = <DropdownMenuEntry>[];
    double borderRadius = config.borderRadius ?? 8;
    double inputContentPaddingX = config.inputContentPaddingX ?? 16;
    AppLabelWrapper labelWrapper = AppLabelWrapper(
      context: context,
      isRequired: widget.isRequired,
      isDense: widget.isDense,
      inputLabel: widget.inputLabel,
      inputGuide: widget.inputGuide,
      helperText: widget.helperText,
      errorText: widget.errorText,
      margin: widget.margin,
      ref: ref,
    );
    Widget textFieldLabelTop = labelWrapper.topLabels();
    Widget textFieldLabelBottom = labelWrapper.bottomLabels();

    for (final AppDropdownOption item in widget.options) {
      options_.add(DropdownMenuEntry(
          value: item.value,
          label: item.label,
          trailingIcon: item.trailingIcon,
          leadingIcon: item.leadingIcon,
          enabled: item.enabled,
          style: ButtonStyle(
              surfaceTintColor: MaterialStateProperty.resolveWith((states) {
                return Theme.of(context).colorScheme.primary;
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Theme.of(context).colorScheme.primary;
                }
                if (states.contains(MaterialState.focused)) {
                  return Theme.of(context).colorScheme.primary;
                }
                if (states.contains(MaterialState.hovered)) {
                  return Theme.of(context).colorScheme.onPrimaryContainer;
                }
                return Theme.of(context).colorScheme.background;
              }),
              iconSize: MaterialStateProperty.resolveWith((states) => 25),
              padding: MaterialStateProperty.resolveWith(
                  (states) => const EdgeInsets.symmetric(horizontal: 16)),
              textStyle: MaterialStateProperty.resolveWith((states) =>
                  widget.isDense
                      ? Theme.of(context)
                          .primaryTextTheme
                          .labelMedium
                          ?.copyWith(fontWeight: FontWeight.w700)
                      : Theme.of(context)
                          .primaryTextTheme
                          .labelLarge
                          ?.copyWith(fontWeight: FontWeight.w700)))));
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textFieldLabelTop,
          Container(
            margin: widget.margin ??
                EdgeInsets.symmetric(vertical: widget.isDense ? 2 : 4),
            child: AppTextInput(
              width: widget.width ?? constraints.maxWidth,
              hintText: widget.placeholder,
              outlined: true,
              hasPadding: false,
              status: widget.status,
              disabled: widget.disabled,
              customColor: themeColor,
              isRequired: widget.isRequired,
              inputStyle: widget.isDense
                  ? TypeUtil(context: context).small()
                  : TypeUtil(context: context).body(),
              onChange: (value) =>
                  widget.onChange != null ? widget.onChange!(value) : null,
              size: widget.isDense
                  ? AppInputFieldSize.small
                  : AppInputFieldSize.regular,
              suffix: Wrap(
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.center,
                children: [
                  Visibility(
                      visible:
                          widget.errorText != null && widget.errorText != '',
                      child: Icon(
                        Icons.info_outline_rounded,
                        color: ref.read(colorProvider).error,
                      ))
                ],
              ),
              prefix: Wrap(
                direction: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: inputContentPaddingX),
                    decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(
                        color: widget.disabled
                            ? Theme.of(context).colorScheme.onInverseSurface
                            : themeColor,
                      )),
                    ),
                    child: DropdownMenu(
                      width: widget.dropdownWidth,
                      controller: controller_,
                      label: Text(
                        widget.dropdownLabel ?? '',
                        style: widget.isDense
                            ? TypeUtil(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground)
                                .xsmall()
                            : TypeUtil(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground)
                                .body(),
                      ),
                      initialSelection: widget.initialSelection,
                      leadingIcon: widget.customLeadingIcon,
                      enabled: !widget.disabled,
                      trailingIcon: widget.customTrailingIcon ??
                          Icon(
                            Icons.expand_more_outlined,
                            color: widget.disabled
                                ? colorDisabled
                                : Theme.of(context).colorScheme.onBackground,
                          ),
                      selectedTrailingIcon: widget.customTrailingIcon ??
                          Icon(
                            Icons.expand_less_outlined,
                            color: widget.disabled
                                ? colorDisabled
                                : Theme.of(context).colorScheme.onBackground,
                          ),
                      dropdownMenuEntries: options_,
                      // textStyle: widget.isDense
                      //     ? Theme.of(context).primaryTextTheme.labelMedium
                      //     : Theme.of(context).primaryTextTheme.labelLarge,
                      menuStyle: Theme.of(context)
                          .dropdownMenuTheme
                          .menuStyle
                          ?.copyWith(
                            fixedSize: MaterialStateProperty.resolveWith(
                                (states) => Size.fromWidth(
                                    widget.width ?? constraints.maxWidth)),
                          ),
                      inputDecorationTheme: Theme.of(context)
                          .dropdownMenuTheme
                          .inputDecorationTheme
                          ?.copyWith(
                            contentPadding: const EdgeInsets.only(left: 16),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            activeIndicatorBorder: BorderSide.none,
                            isDense: widget.isDense,
                            disabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(borderRadius),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onInverseSurface)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(borderRadius),
                                bottomLeft: Radius.circular(borderRadius),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(borderRadius),
                                bottomLeft: Radius.circular(borderRadius),
                              ),
                            ),
                            constraints: widget.isDense
                                ? const BoxConstraints(maxHeight: 40)
                                : null,
                            labelStyle: widget.isDense
                                ? Theme.of(context).primaryTextTheme.labelMedium
                                : Theme.of(context).primaryTextTheme.labelLarge,
                          ),
                      onSelected: (value) => widget.onSelected != null
                          ? widget.onSelected!(value)
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
          textFieldLabelBottom,
        ],
      );
    });
  }

  _setThemeColor() {
    colorIdle = config.colorPalette?.neutral?.s40 ?? AppColors.neutral;
    colorDisabled = config.colorPalette?.neutral?.s40 ?? AppColors.neutral;
    colorDisabledFill = config.colorPalette?.neutral?.s20 ?? AppColors.neutral;
    colorSuccess = config.colorPalette?.success?.s60 ?? AppColors.success;
    colorWarning = config.colorPalette?.warning?.s70 ?? AppColors.warning;
    colorError = config.colorPalette?.error?.s60 ?? AppColors.error;
    switch (widget.status) {
      case AppInputStatus.success:
        themeColor = colorSuccess;
        break;
      case AppInputStatus.warning:
        themeColor = colorWarning;
        break;
      case AppInputStatus.error:
        themeColor = colorError;
        break;
      default:
        themeColor = colorIdle;
        break;
    }
    if (widget.disabled) themeColor = colorDisabled;
    if (widget.customColor != null) themeColor = widget.customColor!;

    if (widget.errorText != null && widget.errorText != '') {
      themeColor = ref.read(colorProvider).error;
    }
  }
}
