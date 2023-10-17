import 'package:emp_ai_ds/entities/app_dropdown_option.dart';
import 'package:emp_ai_ds/entities/theme_config.dart';
import 'package:emp_ai_ds/utils/color_utils.dart';
import 'package:emp_ai_ds/utils/app_label_wrapper.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/app_text_input.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppFilePicker extends ConsumerStatefulWidget {
  final double? width;
  final double? dropdownWidth;
  final String? placeholder;
  final String? dropdownLabel;
  final List<AppDropdownOption> options;
  final Function(PlatformFile)? onSelected;
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
  const AppFilePicker({
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
  AppFilePickerState createState() => AppFilePickerState();
}

class AppFilePickerState extends ConsumerState<AppFilePicker> {
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
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller_ =
        widget.controller ?? TextEditingController();

    final List<DropdownMenuEntry> options_ = <DropdownMenuEntry>[];
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
              readOnly: true,
              isRequired: widget.isRequired,
              controller: controller_,
              inputStyle: widget.isDense
                  ? TypeUtil(context: context).small()
                  : TypeUtil(context: context).body(),
              onChange: (value) =>
                  widget.onChange != null ? widget.onChange!(value) : null,
              size: widget.isDense
                  ? AppInputFieldSize.small
                  : AppInputFieldSize.regular,
              prefix: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: AppButton(
                  icon: const Icon(Icons.file_upload_outlined),
                  type: AppButtonTypes.outline,
                  customColor:
                      DsUtils.color(context, ColorSets.primary, variant: 60),
                  labelText: 'Select a file',
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                      PlatformFile file = result.files.first;

                      controller_.text = file.name;
                      if (widget.onSelected != null) {
                        widget.onSelected!(file);
                      }
                    }
                  },
                ),
              ),
            ),
          ),
          textFieldLabelBottom,
        ],
      );
    });
  }
}
