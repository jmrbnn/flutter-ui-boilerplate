import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class NavigationTitle extends ConsumerStatefulWidget {
  final Widget? title;
  final String? titleText;
  final Function? onTitlePressed;
  const NavigationTitle(
      {super.key, this.title, this.titleText, this.onTitlePressed});

  @override
  ConsumerState<NavigationTitle> createState() => _NavigationTitleState();
}

class _NavigationTitleState extends ConsumerState<NavigationTitle> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Visibility(
        visible: ResponsiveBreakpoints.of(context).largerThan(MOBILE),
        child: GestureDetector(
          onTap: () => widget.onTitlePressed ?? () {},
          child: Visibility(
            visible: widget.title != null || widget.titleText != null,
            child: widget.title ??
                Text(
                  widget.titleText ?? '',
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
