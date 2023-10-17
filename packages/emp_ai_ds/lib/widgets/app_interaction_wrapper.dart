import 'package:emp_ai_ds/entities/theme_config.dart';
import 'package:emp_ai_ds/utils/color_utils.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppInteractionWrapper extends ConsumerStatefulWidget {
  final EdgeInsets? margin;
  final bool isDense;
  final bool disableHoverEffects;
  final AppInputStatus status;
  final bool disabled;
  final Color? customColor;
  final Widget? child;
  const AppInteractionWrapper({
    super.key,
    this.margin,
    this.isDense = false,
    this.disableHoverEffects = false,
    this.status = AppInputStatus.idle,
    this.disabled = false,
    this.customColor,
    this.child,
  });

  @override
  AppInteractionWrapperState createState() => AppInteractionWrapperState();
}

class AppInteractionWrapperState extends ConsumerState<AppInteractionWrapper> {
  bool isHovered = false;
  bool isOnFocus = false;
  late ThemeConfig config;
  late Color colorIdle;
  late Color colorDisabled;
  late Color colorDisabledFill;
  late Color colorSuccess;
  late Color colorWarning;
  late Color colorError;
  late Color themeColor;
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
    return Container(
      margin: widget.margin ??
          EdgeInsets.symmetric(vertical: widget.isDense ? 2 : 4),
      decoration: widget.disableHoverEffects
          ? null
          : BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(12),
              boxShadow: config.enableHoverEffect &&
                      (isOnFocus || isHovered) &&
                      !widget.disabled
                  ? [
                      BoxShadow(
                          color: themeColor.withOpacity(.1),
                          offset: const Offset(0, 0),
                          blurRadius: 0.0,
                          spreadRadius: 4.0)
                    ]
                  : null,
            ),
      child: MouseRegion(
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
            });
          },
          child: widget.child ?? const SizedBox.shrink(),
        ),
      ),
    );
  }
}
