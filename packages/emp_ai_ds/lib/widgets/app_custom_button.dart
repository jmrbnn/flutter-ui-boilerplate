import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/text_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppCustomButton extends ConsumerStatefulWidget {
  final bool isDisabled;
  final bool isIconButton;
  final bool isSelected;
  final bool isLoading;
  final dynamic iconLeading;
  final dynamic iconTrailing;
  final Icon? selectedIcon;
  final AppCustomButtonIconPosition iconPosition;
  final Widget? label;
  final String labelText;
  final AppCustomButtonTypes? type;
  final double borderRadiusValue;
  final double paddingValueX;
  final double paddingValueY;
  final EdgeInsets? padding;
  final ButtonStyle? style;
  final AppCustomButtonVariant? variant;
  final Function()? onPressed;
  final Function()? onLongPress;
  final Function(bool)? onHover;
  final Function(bool)? onFocusChange;
  final double? height;
  final double? width;
  final bool isBlock;
  final bool isFixedIcon;
  final TextStyle? textStyle;
  final LinearGradient? gradient;
  final bool hasHoverEffects;
  final AppCustomButtonSize size;
  final Color? color;
  final EdgeInsets? margin;
  const AppCustomButton({
    super.key,
    this.isDisabled = false,
    this.isIconButton = false,
    this.isSelected = false,
    this.isLoading = false,
    this.iconLeading,
    this.iconTrailing,
    this.selectedIcon,
    this.iconPosition = AppCustomButtonIconPosition.trailing,
    this.label,
    this.labelText = '',
    this.type,
    this.paddingValueX = 10,
    this.paddingValueY = 5,
    this.padding,
    this.style,
    this.variant = AppCustomButtonVariant.primary,
    this.borderRadiusValue = 8.0,
    this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.height,
    this.width,
    this.isBlock = false,
    this.isFixedIcon = true,
    this.textStyle,
    this.gradient,
    this.hasHoverEffects = true,
    this.size = AppCustomButtonSize.medium,
    this.color,
    this.margin = const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AppCustomButtonState();
}

class _AppCustomButtonState extends ConsumerState<AppCustomButton> {
  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = widget.textStyle ??
        TextStyle(
          fontFamily: config.fontFamilyAlt,
          package: 'emp_ai_ds',
          fontWeight: FontWeight.w700,
          fontSize: widget.size.fontSize,
        );

    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.labelText,
        style: labelStyle,
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    return Container(
      margin: widget.margin,
      height: widget.size.height ??
          (widget.type == AppCustomButtonTypes.iconOnly
              ? (widget.size.iconSize ?? 24) + 32
              : widget.size.height ?? config.buttonHeight),
      width: computeWidth(textPainter),
      child: FilledButton(
        style: _getStyle(ref, widget.variant),
        onPressed:
            (widget.isDisabled == true) ? null : widget.onPressed ?? () {},
        onHover: (widget.isDisabled == true) ? null : widget.onHover ?? (e) {},
        child: Row(
          mainAxisAlignment: widget.type == AppCustomButtonTypes.fixedIcon
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            widget.iconLeading != null
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: widget.iconLeading is IconData
                          ? Icon(
                              widget.iconLeading,
                              size: widget.size.iconSize,
                            )
                          : widget.iconLeading,
                    ),
                  )
                : DsUtils.emptyWidget,
            widget.type == AppCustomButtonTypes.iconOnly
                ? DsUtils.emptyWidget
                : (widget.type == AppCustomButtonTypes.fixedIcon
                    ? Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Container(
                              child: widget.label ??
                                  Text(
                                    widget.labelText,
                                    style: labelStyle,
                                  ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Container(
                          child: widget.label ??
                              Text(
                                widget.labelText,
                                style: labelStyle,
                              ),
                        ),
                      )),
            widget.iconTrailing != null
                ? Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: widget.iconTrailing is IconData
                          ? Icon(
                              widget.iconTrailing,
                              size: widget.size.iconSize,
                            )
                          : widget.iconTrailing,
                    ),
                  )
                : DsUtils.emptyWidget,
          ],
        ),
      ),
    );
  }

  ButtonStyle? _getStyle(WidgetRef ref, AppCustomButtonVariant? variant) {
    switch (variant?.value) {
      case 'TERTIARY':
        return Theme.of(context).filledButtonTheme.style?.copyWith(
          padding: MaterialStateProperty.resolveWith((states) {
            if (widget.type == AppCustomButtonTypes.iconOnly) {
              return EdgeInsets.zero;
            }
            return widget.padding ?? Theme.of(context).buttonTheme.padding;
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return widget.color?.withOpacity(.4) ??
                  ref.watch(colorProvider).primary.withOpacity(.4);
            }

            if (states.contains(MaterialState.hovered)) {
              return widget.color?.withOpacity(.5) ??
                  ref.watch(colorProvider).primaryVariant;
            }
            return widget.color ?? ref.watch(colorProvider).primary;
          }),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            return Colors.transparent;
          }),
          shadowColor: MaterialStateProperty.resolveWith((states) {
            return Colors.transparent;
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            return Colors.transparent;
          }),
        );
      case 'SECONDARY':
        return Theme.of(context).filledButtonTheme.style?.copyWith(
          padding: MaterialStateProperty.resolveWith((states) {
            if (widget.type == AppCustomButtonTypes.iconOnly) {
              return EdgeInsets.zero;
            }
            return widget.padding ?? Theme.of(context).buttonTheme.padding;
          }),
          shape: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.selected) ||
                states.contains(MaterialState.pressed)) {
              return RoundedRectangleBorder(
                  side: BorderSide(
                      color: ref.watch(colorProvider).primary, width: 2),
                  borderRadius:
                      BorderRadius.circular(config.borderRadius ?? 0));
            }
            if (states.contains(MaterialState.hovered)) {
              return RoundedRectangleBorder(
                  side: BorderSide(
                      color: widget.color ?? ref.watch(colorProvider).primary,
                      width: 2),
                  borderRadius:
                      BorderRadius.circular(config.borderRadius ?? 0));
            }
            if (states.contains(MaterialState.disabled)) {
              return RoundedRectangleBorder(
                  side: BorderSide(
                      color:
                          ref.watch(colorProvider).contentBlack.withOpacity(.2),
                      width: 2),
                  borderRadius:
                      BorderRadius.circular(config.borderRadius ?? 0));
            }
            return RoundedRectangleBorder(
                side: BorderSide(
                    color: ref.watch(colorProvider).border, width: 2),
                borderRadius: BorderRadius.circular(config.borderRadius ?? 0));
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return ref.watch(colorProvider).contentBlack.withOpacity(.4);
            }

            return widget.color ?? ref.watch(colorProvider).primary;
          }),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            return Colors.transparent;
          }),
          shadowColor: MaterialStateProperty.resolveWith((states) {
            return Colors.transparent;
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return widget.color?.withOpacity(.1) ??
                  ref.watch(colorProvider).primaryContainer;
            }

            return Colors.transparent;
          }),
        );
      case 'PRIMARY':
      default:
        return Theme.of(context).filledButtonTheme.style?.copyWith(
          shape: MaterialStateProperty.resolveWith((states) {
            return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(config.borderRadius ?? 0));
          }),
          padding: MaterialStateProperty.resolveWith((states) {
            if (widget.type == AppCustomButtonTypes.iconOnly) {
              return EdgeInsets.zero;
            }
            return widget.padding ?? Theme.of(context).buttonTheme.padding;
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return ref.watch(colorProvider).contentWhite;
            }

            return ref.watch(colorProvider).contentWhite;
          }),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            return Colors.transparent;
          }),
          shadowColor: MaterialStateProperty.resolveWith((states) {
            return Colors.transparent;
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.selected) ||
                states.contains(MaterialState.pressed)) {
              return widget.color ??
                  ref.watch(colorProvider).onPrimaryContainer;
            }
            if (states.contains(MaterialState.hovered)) {
              return widget.color?.withOpacity(.8) ??
                  ref.watch(colorProvider).primaryVariant;
            }
            if (states.contains(MaterialState.disabled)) {
              return ref.watch(colorProvider).primary.withOpacity(.4);
            }

            return widget.color ?? ref.watch(colorProvider).primary;
          }),
        );
    }
  }

  double? computeWidth(TextPainter textPainter) {
    if (widget.width != null) {
      return widget.width;
    }

    if (widget.type == AppCustomButtonTypes.gridBased ||
        (widget.type == AppCustomButtonTypes.fixedIcon &&
            (widget.iconLeading != null || widget.iconTrailing != null))) {
      return null;
    }

    if (widget.type == AppCustomButtonTypes.iconOnly) {
      return (widget.size.iconSize ?? 24) + 24;
    }

    if (widget.isBlock) {
      return null;
    }

    if (widget.isIconButton) {
      return null;
    }

    return textPainter.width +
        ((widget.size.paddingX ?? 0) * 2) +
        ((widget.iconLeading == null || widget.iconTrailing == null) ? 32 : 60);
  }
}

enum AppCustomButtonIconPosition {
  leading('LEADING'),
  trailing('TRAILING');

  const AppCustomButtonIconPosition(this.value);
  final String value;
}

enum AppCustomButtonTypes {
  autoLayout('AUTO'),
  gridBased('GRID'),
  fixedIcon('FIXEDICON'),
  iconOnly('ICONONLY'),
  ;

  const AppCustomButtonTypes(this.value);
  final String value;
}

enum AppCustomButtonVariant {
  primary('PRIMARY'),
  secondary('SECONDARY'),
  tertiary('TERTIARY'),
  ;

  const AppCustomButtonVariant(this.value);
  final String value;
}

enum AppCustomButtonSize {
  large(
    label: 'LARGE',
    height: 52,
    paddingX: 24,
    paddingY: 10,
    fontSize: 18,
    iconSize: 24,
  ),
  medium(
    label: 'MEDIUM',
    height: 48,
    paddingX: 24,
    paddingY: 14,
    fontSize: 14,
    iconSize: 20,
  ),
  small(
    label: 'SMALL',
    height: 40,
    paddingX: 24,
    paddingY: 12,
    fontSize: 14,
    iconSize: 20,
  ),
  xsmall(
    label: 'XSMALL',
    height: 32,
    paddingX: 12,
    paddingY: 8,
    fontSize: 12,
    iconSize: 12,
  );

  const AppCustomButtonSize({
    required this.label,
    this.height,
    this.paddingX,
    this.paddingY,
    this.fontSize,
    this.iconSize,
  });
  final String label;
  final double? height;
  final double? paddingX;
  final double? paddingY;
  final double? fontSize;
  final double? iconSize;
}
