import 'package:emp_ai_ds/entities/theme_config.dart';
import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppButton extends ConsumerStatefulWidget {
  final bool isDisabled;
  final bool isIconButton;
  final bool isSelected;
  final Icon? icon;
  final Icon? selectedIcon;
  final AppButtonIconPosition iconPosition;
  final Widget? label;
  final String labelText;
  final AppButtonTypes? type;
  final double borderRadiusValue;
  final double paddingValueX;
  final double paddingValueY;
  final EdgeInsets? padding;
  final ButtonStyle? style;
  final Function()? onPressed;
  final Function()? onLongPress;
  final Function(bool)? onHover;
  final Function(bool)? onFocusChange;
  final double? height;
  final double? width;
  final bool isBlock;
  final TextStyle? textStyle;
  final LinearGradient? gradient;
  final bool hasHoverEffects;
  final AppButtonSize size;
  final Color? customColor;
  final EdgeInsets? margin;
  const AppButton({
    super.key,
    this.isDisabled = false,
    this.isIconButton = false,
    this.isSelected = false,
    this.icon,
    this.selectedIcon,
    this.iconPosition = AppButtonIconPosition.leading,
    this.label,
    this.labelText = '',
    this.type,
    this.paddingValueX = 10,
    this.paddingValueY = 5,
    this.padding,
    this.style,
    this.borderRadiusValue = 8.0,
    this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.height,
    this.width,
    this.isBlock = false,
    this.textStyle,
    this.gradient,
    this.hasHoverEffects = true,
    this.size = AppButtonSize.regular,
    this.customColor,
    this.margin,
  });

  @override
  AppButtonState createState() => AppButtonState();
}

class AppButtonState extends ConsumerState<AppButton> {
  bool isHovered = false;

  late double paddingX;
  late double paddingY;
  late double height;
  late ThemeConfig config;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    config = ref.watch(themeConfigProvider);

    TextStyle labelStyle = widget.textStyle ??
        TextStyle(
          fontFamily: config.fontFamilyAlt,
          package: 'emp_ai_ds',
          fontWeight: FontWeight.w700,
          fontSize: 14,
        );

    if (widget.size == AppButtonSize.small) {
      paddingX = config.buttonSmallPaddingX ?? widget.paddingValueX;
      paddingY = config.buttonSmallPaddingY ?? widget.paddingValueY;
      height = config.buttonSmallHeight ?? 30;
    } else {
      paddingX = config.buttonPaddingX ?? widget.paddingValueX;
      paddingY = config.buttonPaddingY ?? widget.paddingValueY;
      height = widget.height ?? config.buttonHeight ?? 30;
    }

    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.labelText,
        style: labelStyle,
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    return Visibility(
      visible:
          widget.hasHoverEffects != false ? true : config.enableHoverEffect,
      replacement: getButton(ref: ref, labelStyle: labelStyle),
      child: Container(
        height: height,
        width: widget.width ??
            (widget.isBlock
                ? null
                : ((widget.isIconButton)
                    ? null
                    : (textPainter.width +
                        (paddingX * 2) +
                        (widget.icon == null ? 25 : 45)))),
        margin: widget.margin,
        decoration: BoxDecoration(
          color: widget.isDisabled ? Colors.transparent : null,
          borderRadius: BorderRadius.circular(config.borderRadius ?? 0),
          boxShadow: !config.enableHoverEffect
              ? null
              : isHovered &&
                      widget.type != AppButtonTypes.text &&
                      !widget.isDisabled
                  ? widget.isIconButton
                      ? [
                          BoxShadow(
                              color: widget.customColor?.withOpacity(.1) ??
                                  Theme.of(context)
                                      .primaryColor
                                      .withOpacity(.2),
                              offset: const Offset(0, 0),
                              blurRadius: 0.0,
                              spreadRadius: 4.0)
                        ]
                      : [
                          BoxShadow(
                              color: widget.customColor?.withOpacity(.1) ??
                                  Theme.of(context)
                                      .primaryColor
                                      .withOpacity(.2),
                              offset: const Offset(0, 0),
                              blurRadius: 0.0,
                              spreadRadius: 3.0)
                        ]
                  : widget.type != AppButtonTypes.text
                      ? [
                          BoxShadow(
                              color: widget.customColor?.withOpacity(.1) ??
                                  Theme.of(context)
                                      .primaryColor
                                      .withOpacity(.1),
                              offset: const Offset(0, 0),
                              blurRadius: 6.0,
                              spreadRadius: 2.0)
                        ]
                      : null,
          gradient:
              widget.type != AppButtonTypes.outline ? widget.gradient : null,
        ),
        child: getButton(
            hasGradient: widget.gradient != null,
            ref: ref,
            labelStyle: labelStyle),
      ),
    );
  }

  Widget getButton(
      {hasGradient = false, required WidgetRef ref, TextStyle? labelStyle}) {
    bool isDarkMode = View.of(context).platformDispatcher.platformBrightness ==
        Brightness.dark;

    double borderRadius = config.borderRadius ?? widget.borderRadiusValue;
    Function()? onPressed_ =
        (widget.isDisabled == true) ? null : widget.onPressed ?? () {};
    Function(bool)? onHover_ = (widget.isDisabled == true)
        ? null
        : widget.onHover ??
            (isHovered_) {
              setState(() {
                isHovered = isHovered_;
              });
            };

    ButtonStyle? iconButtonStyle_ = ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size(height, height)),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        return widget.customColor ?? Theme.of(context).colorScheme.primary;
      }),
      iconColor: MaterialStateProperty.resolveWith((states) {
        return widget.customColor ?? Theme.of(context).colorScheme.primary;
      }),
      iconSize: MaterialStateProperty.all(24),
      shape: MaterialStateProperty.resolveWith((states) {
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius));
      }),
      padding: MaterialStateProperty.all(
        EdgeInsets.zero,
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        return Theme.of(context).colorScheme.background;
      }),
      shadowColor: MaterialStateProperty.all(AppColors.warning),
    );
    ButtonStyle style_ = widget.style ??
        ElevatedButton.styleFrom(
          padding: widget.padding ??
              EdgeInsets.symmetric(
                vertical: paddingY,
                horizontal: paddingX,
              ),
        );

    if (widget.customColor != null) {
      style_ = style_.copyWith(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return widget.customColor!;
        }),
      );
    }

    Widget icon_ =
        widget.icon != null ? widget.icon as Icon : const SizedBox.shrink();
    Widget title_ = widget.label ??
        Text(
          widget.labelText,
          style: labelStyle,
        );

    Widget leading_ =
        widget.iconPosition == AppButtonIconPosition.leading ? icon_ : title_;

    Widget trailing_ =
        widget.iconPosition == AppButtonIconPosition.leading ? title_ : icon_;

    switch (widget.type) {
      case AppButtonTypes.elevated:
        if (widget.isIconButton) {
          return hoverWrapper(
            child: IconButton(
                style: iconButtonStyle_,
                isSelected: widget.isSelected,
                onPressed: widget.isDisabled ? null : onPressed_,
                selectedIcon: widget.selectedIcon,
                icon: widget.icon ?? const Icon(Icons.warning)),
          );
        }

        return widget.icon == null
            ? ElevatedButton(
                style: style_,
                onPressed: onPressed_,
                onHover: onHover_,
                child: widget.label ??
                    Text(
                      widget.labelText,
                      style: labelStyle,
                    ),
              )
            : ElevatedButton.icon(
                style: style_,
                onPressed: onPressed_,
                onHover: onHover_,
                icon: leading_,
                label: trailing_,
              );
      case AppButtonTypes.filledTonal:
        style_ = style_.copyWith(
            // foregroundColor: MaterialStateProperty.resolveWith((states) {
            //   if (states.contains(MaterialState.selected)) {
            //     if (states.contains(MaterialState.selected)) {
            //       if (widget.type == AppButtonTypes.filled) {
            //         return Theme.of(context).colorScheme.secondary;
            //       } else {
            //         return Theme.of(context).colorScheme.onSecondary;
            //       }
            //     }

            //     return Theme.of(context).colorScheme.onSecondary;
            //   }
            //   if (states.contains(MaterialState.hovered)) {
            //     return Theme.of(context).colorScheme.secondaryContainer;
            //   }
            //   if (states.contains(MaterialState.disabled)) {
            //     return null;
            //   }
            //   return Theme.of(context).colorScheme.secondaryContainer;
            // }),
            // backgroundColor: MaterialStateProperty.resolveWith((states) {
            //   if (states.contains(MaterialState.hovered)) {
            //     return Theme.of(context).colorScheme.onSecondaryContainer;
            //   }

            //   if (states.contains(MaterialState.disabled)) {
            //     return null;
            //   }

            //   return Theme.of(context).colorScheme.onSecondary;
            // }),
            );

        iconButtonStyle_ = iconButtonStyle_.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Theme.of(context).colorScheme.onTertiary;
            }
            if (states.contains(MaterialState.hovered)) {
              return Theme.of(context).colorScheme.onTertiary;
            }
            if (states.contains(MaterialState.disabled)) {
              return Theme.of(context).colorScheme.primary.withOpacity(.2);
            }
            return Theme.of(context).colorScheme.primary;
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return Theme.of(context).colorScheme.primary.withOpacity(.5);
            }
            if (states.contains(MaterialState.selected)) {
              return Theme.of(context).colorScheme.primary;
            }
            if (states.contains(MaterialState.disabled)) {
              return Theme.of(context).colorScheme.surfaceVariant;
            }
            return Theme.of(context).colorScheme.primary.withOpacity(.2);
          }),
          shape: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return RoundedRectangleBorder(
                  side: BorderSide(
                      color: isDarkMode
                          ? AppColors.primaryBrand[40]!
                          : AppColors.primaryBrand[100]!,
                      width: 1.5),
                  borderRadius: BorderRadius.circular(borderRadius));
            }
            if (states.contains(MaterialState.hovered)) {
              return RoundedRectangleBorder(
                  side: BorderSide(
                      color: isDarkMode
                          ? AppColors.primaryBrand[40]!
                          : AppColors.primaryBrand[60]!,
                      width: 1.5),
                  borderRadius: BorderRadius.circular(borderRadius));
            }

            return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius));
          }),
        );

        if (widget.isIconButton) {
          return hoverWrapper(
            child: IconButton.filledTonal(
                style: iconButtonStyle_,
                onPressed: widget.isDisabled ? null : onPressed_,
                isSelected: widget.isSelected,
                selectedIcon: widget.selectedIcon,
                icon: widget.icon ?? const Icon(Icons.warning)),
          );
        }

        return widget.icon == null
            ? FilledButton.tonal(
                style: style_,
                onPressed: onPressed_,
                onHover: onHover_,
                child: widget.label ??
                    Text(
                      widget.labelText,
                      style: labelStyle,
                    ),
              )
            : FilledButton.tonalIcon(
                style: style_,
                onPressed: onPressed_,
                onHover: onHover_,
                icon: leading_,
                label: trailing_,
              );
      case AppButtonTypes.outline:
        if (widget.customColor != null) {
          style_ = style_.copyWith(
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              return widget.customColor!;
            }),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return Theme.of(context).colorScheme.background;
            }),
            side: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.hovered)) {
                return BorderSide(
                    color: widget.customColor!,
                    width: 1.0,
                    style: BorderStyle.solid);
              }
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(
                    color: widget.customColor!,
                    width: 1.0,
                    style: BorderStyle.solid);
              }
              return BorderSide(
                  color: widget.customColor!,
                  width: 1.0,
                  style: BorderStyle.solid);
            }),
            shape: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return RoundedRectangleBorder(
                    side: BorderSide(
                        color: widget.customColor ??
                            Theme.of(context).colorScheme.primary,
                        width: 1.5),
                    borderRadius: BorderRadius.circular(borderRadius));
              }
              if (states.contains(MaterialState.hovered)) {
                return RoundedRectangleBorder(
                    side: BorderSide(
                        color: widget.customColor ??
                            Theme.of(context).colorScheme.primary,
                        width: 1.5),
                    borderRadius: BorderRadius.circular(borderRadius));
              }
              if (states.contains(MaterialState.disabled)) {
                return RoundedRectangleBorder(
                    side: const BorderSide(width: 0),
                    borderRadius: BorderRadius.circular(borderRadius));
              }

              return RoundedRectangleBorder(
                  side: BorderSide(color: widget.customColor!, width: .5),
                  borderRadius: BorderRadius.circular(borderRadius));
            }),
          );
        }
        iconButtonStyle_ = iconButtonStyle_.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Theme.of(context).colorScheme.onPrimaryContainer;
            }
            if (states.contains(MaterialState.hovered)) {
              return Theme.of(context).colorScheme.primary;
            }
            if (states.contains(MaterialState.disabled)) {
              return Theme.of(context).colorScheme.primary.withOpacity(.2);
            }
            return Theme.of(context)
                .colorScheme
                .primaryContainer
                .withOpacity(.9);
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return Theme.of(context).colorScheme.background;
            }
            if (states.contains(MaterialState.selected)) {
              return Theme.of(context).colorScheme.background;
            }

            if (states.contains(MaterialState.disabled)) {
              return Theme.of(context).colorScheme.background;
            }
            return Theme.of(context).colorScheme.background;
          }),
          side: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return BorderSide(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  width: 1.5,
                  style: BorderStyle.solid);
            }
            if (states.contains(MaterialState.hovered)) {
              return BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.5,
                  style: BorderStyle.solid);
            }
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(
                  color: Theme.of(context).colorScheme.primary.withOpacity(.2),
                  width: 1.0,
                  style: BorderStyle.solid);
            }
            return BorderSide(
                color: Theme.of(context).colorScheme.primary.withOpacity(.5),
                width: 1.0,
                style: BorderStyle.solid);
          }),
          shape: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1.5, color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(borderRadius));
            }
            if (states.contains(MaterialState.hovered)) {
              return RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1.5, color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(borderRadius));
            }
            if (states.contains(MaterialState.disabled)) {
              return RoundedRectangleBorder(
                  side: const BorderSide(width: 0),
                  borderRadius: BorderRadius.circular(borderRadius));
            }

            return RoundedRectangleBorder(
                side: const BorderSide(width: .5),
                borderRadius: BorderRadius.circular(borderRadius));
          }),
        );

        if (widget.isIconButton) {
          return hoverWrapper(
            child: IconButton.outlined(
                style: iconButtonStyle_,
                onPressed: widget.isDisabled ? null : onPressed_,
                isSelected: widget.isSelected,
                selectedIcon: widget.selectedIcon,
                icon: widget.icon ?? const Icon(Icons.warning)),
          );
        }
        return widget.icon != null
            ? hoverWrapper(
                child: OutlinedButton.icon(
                style: style_,
                onPressed: onPressed_,
                icon: leading_,
                label: trailing_,
              ))
            : OutlinedButton(
                style: style_,
                onPressed: onPressed_,
                onHover: onHover_,
                child: trailing_,
              );
      case AppButtonTypes.text:
        return widget.icon != null
            ? hoverWrapper(
                child: TextButton.icon(
                style: style_,
                onPressed: onPressed_,
                onHover: onHover_,
                icon: leading_,
                label: trailing_,
              ))
            : TextButton(
                style: style_,
                onPressed: onPressed_,
                onHover: onHover_,
                child: widget.label ??
                    Text(
                      widget.labelText,
                      style: labelStyle,
                    ),
              );
      case AppButtonTypes.filled:
      default:
        iconButtonStyle_ = iconButtonStyle_.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              if (widget.type == AppButtonTypes.filled) {
                return Theme.of(context).colorScheme.onPrimary;
              } else {
                return Theme.of(context).colorScheme.onPrimary;
              }
            }
            if (states.contains(MaterialState.hovered)) {
              return Theme.of(context).colorScheme.primary;
            }
            if (states.contains(MaterialState.disabled)) {
              return Theme.of(context).colorScheme.primary.withOpacity(.2);
            }
            return Theme.of(context).colorScheme.primary.withOpacity(.5);
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              if (widget.type == AppButtonTypes.filled) {
                return Theme.of(context).colorScheme.primary;
              } else {
                return Theme.of(context).colorScheme.primary;
              }
            }
            if (states.contains(MaterialState.hovered)) {
              return Theme.of(context).colorScheme.background;
            }

            return Theme.of(context).colorScheme.background;
          }),
          shape: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return RoundedRectangleBorder(
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      width: 1.5),
                  borderRadius: BorderRadius.circular(borderRadius));
            }
            if (states.contains(MaterialState.hovered)) {
              return RoundedRectangleBorder(
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 1.5),
                  borderRadius: BorderRadius.circular(borderRadius));
            }

            return RoundedRectangleBorder(
                side: BorderSide(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(.5),
                    width: .5),
                borderRadius: BorderRadius.circular(borderRadius));
          }),
        );

        if (widget.isIconButton) {
          return hoverWrapper(
            child: IconButton(
                style: iconButtonStyle_,
                isSelected: widget.isSelected,
                onPressed: widget.isDisabled ? null : onPressed_,
                disabledColor:
                    Theme.of(context).colorScheme.onBackground.withOpacity(.1),
                selectedIcon: widget.selectedIcon,
                icon: widget.icon ?? const Icon(Icons.warning)),
          );
        }

        return widget.icon != null
            ? FilledButton.icon(
                style: style_,
                onPressed: onPressed_,
                onHover: onHover_,
                icon: leading_,
                label: trailing_)
            : FilledButton(
                style: style_,
                onPressed: onPressed_,
                onHover: onHover_,
                child: trailing_,
              );
    }
  }

  Widget hoverWrapper({Widget? child}) {
    return MouseRegion(
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
      child: child,
    );
  }
}

enum AppButtonSize {
  regular('REGULAR'),
  small('SMALL');

  const AppButtonSize(this.value);
  final String value;
}

enum AppButtonTypes {
  elevated('ELEVATED'),
  filled('FILLED'),
  filledTonal('FILLED_TONAL'),
  outline('OUTLINE'),
  text('TEXT');

  const AppButtonTypes(this.value);
  final String value;
}

enum AppButtonIconPosition {
  leading('LEADING'),
  trailing('TRAILING');

  const AppButtonIconPosition(this.value);
  final String value;
}
