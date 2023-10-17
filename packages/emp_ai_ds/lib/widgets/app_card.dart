import 'package:emp_ai_ds/entities/theme_config.dart';
import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/app_shadows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppCard extends ConsumerWidget {
  final double width;
  final double? height;
  final bool isContentExpanded;
  final BoxShadow? boxShadow;
  final BoxDecoration? boxDecoration;
  final bool hasShadow;
  final Widget? title;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final EdgeInsets? footerPadding;
  final bool enableCloseButton;
  final List<Widget>? headerActions;
  final Widget? content;
  final Widget? footer;
  final BorderRadiusGeometry? borderRadiusGeometry;
  const AppCard({
    super.key,
    this.width = 400,
    this.height,
    this.isContentExpanded = false,
    this.boxShadow,
    this.boxDecoration,
    this.hasShadow = true,
    this.title,
    this.margin,
    this.padding,
    this.footerPadding,
    this.enableCloseButton = true,
    this.headerActions,
    this.content,
    this.footer,
    this.borderRadiusGeometry,
  });

  @override
  Widget build(BuildContext context, ref) {
    ThemeConfig config = ref.read(themeConfigProvider);
    double borderRadius = config.borderRadius ?? 8;
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: boxDecoration ??
          BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius:
                borderRadiusGeometry ?? BorderRadius.circular(borderRadius),
            boxShadow: hasShadow ? [(boxShadow ?? AppShadows.lowBottom)] : [],
          ),
      child: Column(
        children: [
          (headerActions != null && title != null)
              ? Padding(
                  padding: padding ??
                      const EdgeInsets.only(right: 24, left: 24, top: 24),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: (title ?? const SizedBox.shrink()),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Visibility(
                          visible: headerActions != null,
                          child: Wrap(
                            spacing: 5,
                            children: [
                              ...(headerActions ?? []),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          isContentExpanded
              ? Expanded(
                  child: Padding(
                    padding: padding ??
                        const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 24,
                        ),
                    child: content ?? const SizedBox.shrink(),
                  ),
                )
              : Padding(
                  padding: padding ??
                      const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                  child: content ?? const SizedBox.shrink(),
                ),
          LayoutBuilder(builder: (context, constraints) {
            return footer != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8),
                    child: Visibility(
                      visible: footer != null,
                      child: Container(
                        width: constraints.maxWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(borderRadius),
                          color: Theme.of(context).colorScheme.surfaceVariant,
                        ),
                        padding: footerPadding ?? const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(top: 16),
                        child: footer,
                      ),
                    ),
                  )
                : const SizedBox.shrink();
          })
        ],
      ),
    );
  }
}
