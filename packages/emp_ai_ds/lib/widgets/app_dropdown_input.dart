import 'package:emp_ai_ds/entities/app_dropdown_option.dart';
import 'package:emp_ai_ds/entities/theme_config.dart';
import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/color_utils.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/app_label_wrapper.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicons/unicons.dart';

class AppDropdownInput extends ConsumerStatefulWidget {
  final bool isDense;
  final double? width;
  final String? placeholder;
  final Widget? dropdownLabel;
  final String? preselectValue;
  final List<AppDropdownOption> options;
  final Function(dynamic)? onSelected;
  final TextEditingController? controller;
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
  final Widget? customIcon;
  final bool disableHoverEffects;
  const AppDropdownInput({
    super.key,
    this.isDense = false,
    this.width,
    this.placeholder = '',
    this.dropdownLabel,
    this.preselectValue,
    this.options = const [],
    this.onSelected,
    this.controller,
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
    this.customIcon,
    this.disableHoverEffects = false,
  });

  @override
  AppDropdownInputState createState() => AppDropdownInputState();
}

class AppDropdownInputState extends ConsumerState<AppDropdownInput> {
  bool isHovered = false;
  bool isOnFocus = false;
  dynamic currentValue;
  late Color colorActive;
  late Color colorIdle;
  late Color colorDisabled;
  late Color colorDisabledFill;
  late Color colorSuccess;
  late Color colorWarning;
  late Color colorError;

  late Color themeColor;

  late ThemeConfig config;
  late Size inputSize;

  final GlobalKey _widgetSize = GlobalKey();
  @override
  void initState() {
    super.initState();

    config = DsUtils.themeConfiguration(ref);

    colorActive =
        config.colorPalette?.primaryBrand?.s40 ?? AppColors.primaryBrand;
    colorIdle = config.colorPalette?.neutral?.s40 ?? AppColors.neutral;
    colorDisabled = config.colorPalette?.neutral?.s40 ?? AppColors.neutral;
    colorDisabledFill = config.colorPalette?.neutral?.s20 ?? AppColors.neutral;
    colorSuccess = config.colorPalette?.success?.s60 ?? AppColors.success;
    colorWarning = config.colorPalette?.warning?.s70 ?? AppColors.warning;
    colorError = config.colorPalette?.error?.s60 ?? AppColors.error;

    if (widget.disabled) themeColor = colorDisabled;

    if (widget.customColor != null) themeColor = widget.customColor!;

    _setThemeColor();
    inputSize = Size.zero;
  }

  @override
  Widget build(BuildContext context) {
    double borderRadius = config.borderRadius ?? 8;
    double inputSizeHeight = widget.isDense ? 35 : 48;

    _setThemeColor();
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

    final List<DropdownMenuEntry> options_ = <DropdownMenuEntry>[];

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
                  ? Theme.of(context).primaryTextTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 10)
                  : Theme.of(context).primaryTextTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 14)),
        ),
      ));
    }

    Widget inputField = MouseRegion(
      onHover: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: Focus(
        onFocusChange: (onFocus) {
          setState(() {
            isOnFocus = onFocus;
            if (onFocus) {
              themeColor = widget.status == AppInputStatus.idle
                  ? colorActive
                  : _setThemeColor();
            } else {
              themeColor = widget.status == AppInputStatus.idle
                  ? widget.customColor ?? colorIdle
                  : _setThemeColor();
            }
            inputSize = _widgetSize.currentContext?.size ?? Size.zero;
          });
        },
        child: DropdownButtonFormField(
          value: widget.preselectValue,
          icon: Wrap(
            runAlignment: WrapAlignment.center,
            spacing: 8,
            children: [
              Visibility(
                visible: widget.errorText != null && widget.errorText != '',
                child: Icon(
                  Icons.info_outline_rounded,
                  color: ref.read(colorProvider).error,
                ),
              ),
              widget.customIcon ?? DsUtils.emptyWidget,
              const Icon(UniconsLine.angle_down)
            ],
          ),
          hint: widget.dropdownLabel,
          items: widget.options
              .map<DropdownMenuItem>((e) => DropdownMenuItem(
                    value: e.value,
                    enabled: e.enabled,
                    child: Text(
                      e.label,
                      style: widget.isDense
                          ? TypeUtil(
                              context: context,
                              fontFamily: config.fontFamilyAlt,
                            ).xsmall()
                          : TypeUtil(
                              context: context,
                              fontFamily: config.fontFamilyAlt,
                            ).body(),
                    ),
                  ))
              .toList(),
          onChanged: (value) =>
              widget.onSelected != null ? widget.onSelected!(value) : null,
          validator: (value) {
            if (widget.isRequired) {
              if ((value == null || value == '')) {
                return "This field is required";
              }
            }

            return null;
          },
          enableFeedback: !widget.disabled,
          decoration: InputDecoration(
            isDense: widget.isDense,
            constraints:
                widget.isDense ? const BoxConstraints(maxHeight: 40) : null,
            labelStyle: widget.isDense
                ? Theme.of(context).primaryTextTheme.labelMedium
                : Theme.of(context).primaryTextTheme.labelLarge,
            contentPadding: widget.padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            helperMaxLines: 5,
            iconColor: themeColor,
            filled: widget.disabled,
            fillColor: widget.disabled
                ? Theme.of(context).colorScheme.onInverseSurface.withOpacity(.5)
                : null,
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).colorScheme.onInverseSurface)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(width: 1, color: themeColor)),
            enabledBorder: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(width: 1, color: themeColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide:
                  BorderSide(width: 2, color: themeColor.withOpacity(.5)),
            ),
            hintStyle: TypeUtil(color: colorDisabled).small(),
            helperStyle:
                TypeUtil(fontFamily: DsUtils.themeConfiguration(ref).fontFamily)
                    .small(),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIconColor: themeColor,
            suffixIconColor: themeColor,
          ),
        ),
      ),
    );

    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textFieldLabelTop,
          Container(
            width: widget.width,
            margin: widget.margin ??
                EdgeInsets.symmetric(vertical: widget.isDense ? 4 : 8),
            child: Stack(
              children: [
                Container(
                  decoration: widget.disableHoverEffects
                      ? null
                      : config.name != 'default'
                          ? null
                          : BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: (isOnFocus) && !widget.disabled
                                  ? [
                                      BoxShadow(
                                          color: themeColor.withOpacity(.1),
                                          offset: const Offset(0, 0),
                                          blurRadius: 0.0,
                                          spreadRadius: 4.0)
                                    ]
                                  : null,
                            ),
                  child: SizedBox(
                    height: inputSize.height > inputSizeHeight
                        ? inputSizeHeight
                        : inputSize.height,
                    width: inputSize.width,
                  ),
                ),
                inputField,
              ],
            ),
          ),
          // Container(
          //   margin: widget.margin ??
          //       EdgeInsets.symmetric(vertical: widget.isDense ? 2 : 4),
          //   width: widget.width,
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).colorScheme.background,
          //     borderRadius: BorderRadius.circular(12),
          //     boxShadow:
          //         config.enableHoverEffect && (isOnFocus) && !widget.disabled
          //             ? [
          //                 BoxShadow(
          //                     color: themeColor.withOpacity(.1),
          //                     offset: const Offset(0, 0),
          //                     blurRadius: 0.0,
          //                     spreadRadius: 4.0)
          //               ]
          //             : null,
          //   ),
          //   child: inputField,
          // ),
          textFieldLabelBottom,
        ],
      );
    });
  }

  _setThemeColor() {
    if (widget.errorText != null && widget.errorText != '') {
      themeColor = ref.read(colorProvider).error;
      return themeColor;
    }

    if (widget.customColor != null) {
      themeColor = widget.customColor ?? colorIdle;
      return themeColor;
    }

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
      case AppInputStatus.active:
        themeColor = colorActive;
        break;
      default:
        themeColor = colorIdle;
        break;
    }

    return themeColor;
  }
}
