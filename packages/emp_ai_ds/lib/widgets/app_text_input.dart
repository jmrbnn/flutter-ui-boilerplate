import 'package:emp_ai_ds/entities/theme_config.dart';
import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/color_utils.dart';
import 'package:emp_ai_ds/utils/debouncer.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/app_label_wrapper.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppTextInput extends ConsumerStatefulWidget {
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffix;
  final bool enableClear;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final String? inputGuide;
  final String? inputLabel;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final double? width;
  final bool? filled;
  final bool disabled;
  final bool readOnly;
  final bool outlined;
  final InputBorder? border;
  final Function(dynamic)? onChange;
  final Function()? onTap;
  final bool isRequired;
  final AppInputStatus status;
  final AppInputFieldSize size;
  final bool isDisabledFilled;
  final AutovalidateMode? autoValidateMode;
  final Debouncer? debouncer;
  final int minLines;
  final int maxLines;
  final bool isPassword;
  final bool isObscured;
  final TextInputAction? textInputAction;
  final Function()? onDone;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormats;
  final dynamic Function(dynamic)? customValidator;
  final Map<dynamic, dynamic>? customRegex;
  final Color? customColor;
  final InputDecoration? customDecoration;
  final InputBorder? customBorder;
  final InputBorder? customEnabledBorder;
  final InputBorder? customDisabledBorder;
  final InputBorder? customFocusedBorder;
  final EdgeInsets? padding;
  final bool hasPadding;
  final EdgeInsets? margin;
  final TextStyle? inputStyle;
  final bool disableHoverEffects;
  final Color? customIconColor;
  const AppTextInput({
    super.key,
    this.controller,
    this.prefix,
    this.suffix,
    this.enableClear = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.inputGuide,
    this.inputLabel,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.width,
    this.filled,
    this.disabled = false,
    this.readOnly = false,
    this.outlined = false,
    this.border,
    this.onChange,
    this.onTap,
    this.isRequired = false,
    this.status = AppInputStatus.idle,
    this.size = AppInputFieldSize.regular,
    this.isDisabledFilled = true,
    this.debouncer,
    this.minLines = 1,
    this.maxLines = 1,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.isPassword = false,
    this.isObscured = false,
    this.textInputAction,
    this.onDone,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.inputFormats = const <TextInputFormatter>[],
    this.customRegex,
    this.customValidator,
    this.customColor,
    this.customDecoration,
    this.customBorder,
    this.customEnabledBorder,
    this.customDisabledBorder,
    this.customFocusedBorder,
    this.padding,
    this.hasPadding = true,
    this.margin,
    this.inputStyle,
    this.disableHoverEffects = false,
    this.customIconColor,
  });

  @override
  AppTextInputState createState() => AppTextInputState();
}

class AppTextInputState extends ConsumerState<AppTextInput> {
  late TextEditingController _textController;
  late AppInputStatus status_ = widget.status;
  late ThemeConfig config;

  late Color colorActive;
  late Color colorIdle;
  late Color colorSuccess;
  late Color colorWarning;
  late Color colorError;
  late Color colorDisabled;
  late Color colorDisabledFill;

  bool isHovered = false;
  bool isOnFocus = false;
  bool isObscured = false;

  late Color themeColor;
  late Size inputSize;

  final GlobalKey _widgetSize = GlobalKey();
  @override
  void initState() {
    super.initState();
    _textController = widget.controller ?? TextEditingController();

    _setThemeColor();

    inputSize = Size.zero;

    if (widget.isPassword) {
      setState(() {
        isObscured = true;
      });
    }
  }

  @override
  void dispose() {
    widget.focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    config = DsUtils.themeConfiguration(ref);

    if (widget.isDisabledFilled) {
      colorDisabledFill = ref.read(colorProvider).backgroundBright;
    }
    _setThemeColor();
    colorDisabled = Theme.of(context).colorScheme.onBackground.withOpacity(.5);
    double borderRadius = config.borderRadius ?? 8;
    double inputSizeHeight = widget.size == AppInputFieldSize.small ? 35 : 48;
    AppLabelWrapper labelWrapper = AppLabelWrapper(
      context: context,
      isRequired: widget.isRequired,
      isDense: widget.size == AppInputFieldSize.small,
      inputLabel: widget.inputLabel,
      inputGuide: widget.inputGuide,
      helperText: widget.helperText,
      errorText: widget.errorText,
      margin: widget.margin,
      ref: ref,
    );
    Widget textFieldLabelTop = labelWrapper.topLabels();
    Widget textFieldLabelBottom = labelWrapper.bottomLabels();

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
              widget.focusNode?.unfocus();
              themeColor = widget.status == AppInputStatus.idle
                  ? widget.customColor ?? colorIdle
                  : colorIdle;
            }
            inputSize = _widgetSize.currentContext?.size ?? Size.zero;
          });
        },
        child: TextFormField(
          key: _widgetSize,
          controller: _textController,
          maxLength: widget.maxLength,
          maxLengthEnforcement: widget.maxLengthEnforcement,
          enabled: !widget.disabled,
          readOnly: widget.readOnly,
          showCursor: !widget.readOnly,
          onTap: widget.onTap,
          onChanged: (val_) {
            if (widget.onChange != null) {
              if (widget.debouncer != null) {
                widget.debouncer!.run(() {
                  widget.onChange!(val_);
                });
              } else {
                widget.onChange!(val_);
              }
            }
          },
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          keyboardType: widget.keyboardType,
          autovalidateMode: widget.autoValidateMode,
          inputFormatters: widget.inputFormats,
          onEditingComplete: widget.onDone,
          focusNode: widget.focusNode,
          validator: (value) {
            if (widget.isRequired) {
              if (widget.isRequired) {
                if ((widget.controller != null &&
                        (widget.controller?.text.isEmpty ?? true)) ||
                    (value == null || value == '')) {
                  return "This field is required";
                }
              }

              if (widget.customRegex != null &&
                  !RegExp(widget.customRegex!['regex']).hasMatch(value!)) {
                return widget.customRegex!['message'];
              }
            }

            if (widget.customValidator != null) {
              return widget.customValidator!(value);
            }

            return null;
          },
          obscureText: isObscured,
          style: widget.inputStyle ??
              (widget.size == AppInputFieldSize.small
                  ? TypeUtil(context: context, fontFamily: config.fontFamily)
                      .small()
                  : TypeUtil(context: context, fontFamily: config.fontFamily)
                      .body()),
          decoration: widget.customDecoration ??
              (config.name != 'default'
                  ? null
                  : InputDecoration(
                      // helperText: widget.helperText,
                      hintText: widget.hintText,
                      contentPadding: widget.padding ??
                          const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                      helperMaxLines: 5,
                      iconColor: widget.customIconColor ?? themeColor,
                      isDense: widget.size == AppInputFieldSize.small,
                      fillColor:
                          widget.isDisabledFilled ? colorDisabledFill : null,
                      filled: widget.isDisabledFilled
                          ? widget.disabled
                              ? true
                              : widget.filled
                          : false,
                      disabledBorder: widget.isDisabledFilled
                          ? OutlineInputBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onInverseSurface))
                          : widget.customDisabledBorder ??
                              OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(borderRadius),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onInverseSurface)),
                      border: widget.customBorder ??
                          OutlineInputBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                              borderSide:
                                  BorderSide(width: 1, color: themeColor)),
                      enabledBorder: widget.customEnabledBorder ??
                          OutlineInputBorder(
                            gapPadding: 0,
                            borderRadius: BorderRadius.circular(borderRadius),
                            borderSide: BorderSide(width: 1, color: themeColor),
                          ),
                      focusedBorder: widget.customFocusedBorder ??
                          OutlineInputBorder(
                            borderRadius: BorderRadius.circular(borderRadius),
                            borderSide: BorderSide(width: 2, color: themeColor),
                          ),
                      hintStyle: widget.inputStyle ??
                          TypeUtil(
                                  context: context,
                                  color: widget.isDisabledFilled
                                      ? AppColors.neutral[40]
                                      : colorDisabled.withOpacity(.5),
                                  fontFamily: config.fontFamily)
                              .small(),
                      helperStyle: TypeUtil(
                              context: context, fontFamily: config.fontFamily)
                          .small(),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      // prefixIconConstraints:
                      //     widget.size != AppInputFieldSize.regular
                      //         ? const BoxConstraints(maxHeight: 5, maxWidth: 5)
                      //         : null,
                      prefixIcon: widget.prefix != null
                          ? Padding(
                              padding: !widget.hasPadding
                                  ? EdgeInsets.zero
                                  : const EdgeInsets.only(left: 16, right: 8),
                              child: widget.prefix,
                            )
                          : null,

                      labelStyle: TypeUtil(
                              context: context, fontFamily: config.fontFamily)
                          .body(),
                      prefixIconColor: widget.customIconColor ?? themeColor,
                      suffixIcon: Wrap(
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 8,
                        children: [
                          Visibility(
                            visible: widget.errorText != null &&
                                widget.errorText != '',
                            child: Icon(
                              Icons.info_outline_rounded,
                              color: ref.read(colorProvider).error,
                            ),
                          ),
                          widget.suffix != null ||
                                  (widget.suffix == null &&
                                      widget.isPassword) ||
                                  widget.enableClear
                              ? Padding(
                                  padding: !widget.hasPadding
                                      ? EdgeInsets.zero
                                      : const EdgeInsets.only(
                                          left: 0, right: 8),
                                  child: widget.isPassword
                                      ? IconButton(
                                          color: Colors.grey,
                                          icon: Icon(isObscured
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined),
                                          onPressed: () {
                                            setState(() {
                                              isObscured = !isObscured;
                                            });
                                          },
                                        )
                                      : widget.enableClear
                                          ? _ClearButton(
                                              controller: _textController,
                                              onChange: widget.onChange,
                                            )
                                          : widget.suffix,
                                )
                              : DsUtils.emptyWidget
                        ],
                      ),
                      // suffixIconColor: themeColor,
                      // labelText: widget.labelText,
                      // hintText: widget.hintText,
                      // border: widget.outlined ? null : widget.border,
                      // errorMaxLines: 1,
                      // errorText: null,
                      // errorStyle: const TextStyle(
                      //   height: 0,
                      //   color: Colors.transparent,
                      //   fontSize: 0,
                      // ),
                    )),
        ),
      ),
    );

    Widget textField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textFieldLabelTop,
          Container(
            margin: widget.margin ??
                EdgeInsets.symmetric(
                    vertical: widget.size == AppInputFieldSize.small ? 4 : 8),
            child: Stack(
              children: [
                Container(
                  decoration: widget.disableHoverEffects ||
                          !(widget.focusNode?.hasFocus ?? false)
                      ? null
                      : config.name != 'default'
                          ? null
                          : BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: (isOnFocus) && !widget.disabled
                                  ? [
                                      BoxShadow(
                                          color: themeColor.withOpacity(.2),
                                          offset: const Offset(0, 0),
                                          blurRadius: 0.0,
                                          spreadRadius: 4.5)
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
          textFieldLabelBottom,
        ],
      );
    }

    return Visibility(
      visible: widget.width != null,
      replacement: textField(),
      child: SizedBox(
        width: widget.width,
        child: textField(),
      ),
    );
  }

  _setThemeColor() {
    colorActive = ref.read(colorProvider).primary;
    colorIdle = ref.read(colorProvider).border;
    colorDisabled = ref.read(colorProvider).divider;
    colorDisabledFill = ref.read(colorProvider).background;
    colorSuccess = ref.read(colorProvider).success;
    colorWarning = ref.read(colorProvider).warning;
    colorError = ref.read(colorProvider).error;

    if (widget.focusNode?.hasFocus ?? false) {
      return themeColor = ref.read(colorProvider).primary;
    }
    if (widget.disabled) themeColor = colorDisabled;

    if (widget.customColor != null) themeColor = widget.customColor!;

    if (widget.errorText != null && widget.errorText != '') {
      themeColor = ref.read(colorProvider).error;
      return themeColor;
    }
    if (widget.customColor != null) {
      themeColor = widget.customColor ?? colorIdle;
      return themeColor;
    }

    if (widget.status == AppInputStatus.error) {
      themeColor = ref.read(colorProvider).error;
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

class _ClearButton extends StatelessWidget {
  const _ClearButton({required this.controller, required this.onChange});

  final TextEditingController controller;
  final Function(dynamic)? onChange;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (onChange != null) onChange!('');
          controller.clear();
        },
      );
}

enum AppInputFieldSize {
  small('SMALL'),
  regular('REGULAR');

  const AppInputFieldSize(this.value);
  final String value;
}

enum AppInputStatus {
  active('ACTIVE'),
  idle('IDLE'),
  success('SUCCESS'),
  warning('WARNING'),
  error('ERROR'),
  disabled('DISABLED');

  const AppInputStatus(this.value);
  final String value;
}
