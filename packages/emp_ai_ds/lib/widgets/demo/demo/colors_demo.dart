import 'package:emp_ai_ds/entities/theme_config.dart';
import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/text_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorsDemo extends ConsumerStatefulWidget {
  final ThemeMode? themeMode;
  const ColorsDemo({
    super.key,
    this.themeMode,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ColorsDemoState();
}

class _ColorsDemoState extends ConsumerState<ColorsDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.themeMode != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          DsUtils.setBrightnessMode(ref,
              mode: widget.themeMode ?? ThemeMode.light));
    }
    return ColorRolesView(
      colorRoles: ref.watch(colorProvider),
    );
  }
}

class ColorRolesView extends StatelessWidget {
  const ColorRolesView({super.key, required this.colorRoles});

  final ColorRolesConfig? colorRoles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColorGroup(children: [
          ColorChip(
            label: 'Primary',
            color: colorRoles?.primary,
            onColor: colorRoles?.contentWhite,
          ),
          ColorChip(
            label: 'Primary Variant',
            color: colorRoles?.primaryVariant,
            onColor: colorRoles?.contentWhite,
          ),
          ColorChip(
            label: 'Primary Container',
            color: colorRoles?.primaryContainer,
            onColor: colorRoles?.onPrimaryContainer,
          ),
          ColorChip(
            label: 'On Primary Container',
            color: colorRoles?.onPrimaryContainer,
            onColor: colorRoles?.primaryContainer,
          ),
        ]),
        Divider(color: colorRoles?.divider),
        ColorGroup(children: [
          ColorChip(
            label: 'Secondary',
            color: colorRoles?.secondary,
            onColor: colorRoles?.contentWhite,
          ),
          ColorChip(
            label: 'Secondary Variant',
            color: colorRoles?.secondaryVariant,
            onColor: colorRoles?.contentWhite,
          ),
          ColorChip(
            label: 'Secondary Container',
            color: colorRoles?.secondaryContainer,
            onColor: colorRoles?.onSecondaryContainer,
          ),
          ColorChip(
              label: 'On Secondary Container',
              color: colorRoles?.onSecondaryContainer,
              onColor: colorRoles?.secondaryContainer),
        ]),
        Divider(color: colorRoles?.divider),
        ColorGroup(
          children: [
            ColorChip(
                label: 'Error',
                color: colorRoles?.error,
                onColor: colorRoles?.contentWhite),
            ColorChip(
                label: 'Error Variant',
                color: colorRoles?.errorVariant,
                onColor: colorRoles?.contentWhite),
            ColorChip(
                label: 'Error Container',
                color: colorRoles?.errorContainer,
                onColor: colorRoles?.onErrorContainer),
            ColorChip(
                label: 'On Error Container',
                color: colorRoles?.onErrorContainer,
                onColor: colorRoles?.errorContainer),
          ],
        ),
        Divider(color: colorRoles?.divider),
        ColorGroup(
          children: [
            ColorChip(
                label: 'Success',
                color: colorRoles?.success,
                onColor: colorRoles?.contentWhite),
            ColorChip(
                label: 'Success Variant',
                color: colorRoles?.successVariant,
                onColor: colorRoles?.contentBlack),
            ColorChip(
                label: 'Success Container',
                color: colorRoles?.successContainer,
                onColor: colorRoles?.onSuccessContainer),
            ColorChip(
                label: 'On Success Container',
                color: colorRoles?.onSuccessContainer,
                onColor: colorRoles?.successContainer),
          ],
        ),
        Divider(color: colorRoles?.divider),
        ColorGroup(
          children: [
            ColorChip(
                label: 'Warning',
                color: colorRoles?.warning,
                onColor: colorRoles?.contentWhite),
            ColorChip(
                label: 'Warning Variant',
                color: colorRoles?.warningVariant,
                onColor: colorRoles?.contentBlack),
            ColorChip(
                label: 'Warning Container',
                color: colorRoles?.warningContainer,
                onColor: colorRoles?.onWarningContainer),
            ColorChip(
                label: 'On Warning Container',
                color: colorRoles?.onWarningContainer,
                onColor: colorRoles?.warningContainer),
          ],
        ),
        Divider(color: colorRoles?.divider),
        ColorGroup(
          children: [
            ColorChip(
                label: 'Background Dim',
                color: colorRoles?.backgroundDim,
                onColor: colorRoles?.contentBlack),
            ColorChip(
                label: 'Background',
                color: colorRoles?.background,
                onColor: colorRoles?.contentBlack),
            ColorChip(
                label: 'Background Bright',
                color: colorRoles?.backgroundBright,
                onColor: colorRoles?.contentBlack),
          ],
        ),
        Divider(color: colorRoles?.divider),
        ColorGroup(
          children: [
            ColorChip(
                label: 'Card 0',
                color: colorRoles?.card0,
                onColor: colorRoles?.contentBlack),
            ColorChip(
                label: 'Card 10',
                color: colorRoles?.card10,
                onColor: colorRoles?.contentBlack),
            ColorChip(
                label: 'Card 20',
                color: colorRoles?.card20,
                onColor: colorRoles?.contentBlack),
            ColorChip(
                label: 'Card 30',
                color: colorRoles?.card30,
                onColor: colorRoles?.contentBlack),
            ColorChip(
                label: 'Card 40',
                color: colorRoles?.card40,
                onColor: colorRoles?.contentBlack),
          ],
        ),
        Divider(color: colorRoles?.divider),
        ColorGroup(
          children: [
            ColorChip(
                label: 'Content Black',
                color: colorRoles?.contentBlack,
                onColor: colorRoles?.contentWhite),
            ColorChip(
                label: 'Content Gray',
                color: colorRoles?.contentGray,
                onColor: colorRoles?.contentWhite),
            ColorChip(
                label: 'Content White',
                color: colorRoles?.contentWhite,
                onColor: colorRoles?.contentBlack),
          ],
        ),
        Divider(color: colorRoles?.divider),
        ColorGroup(
          children: [
            ColorChip(
                label: 'Border',
                color: colorRoles?.border,
                onColor: colorRoles?.contentBlack),
          ],
        ),
        Divider(color: colorRoles?.divider),
        ColorGroup(
          children: [
            ColorChip(
                label: 'Divider',
                color: colorRoles?.divider,
                onColor: colorRoles?.contentBlack),
          ],
        ),
      ],
    );
  }
}

class ColorGroup extends StatelessWidget {
  const ColorGroup({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: children,
        ),
      ),
    );
  }
}

class ColorChip extends StatelessWidget {
  const ColorChip({
    super.key,
    this.color,
    required this.label,
    this.onColor,
  });

  final Color? color;
  final Color? onColor;
  final String label;

  static Color contrastColor(Color color) {
    final brightness = ThemeData.estimateBrightnessForColor(color);
    switch (brightness) {
      case Brightness.dark:
        return Colors.white;
      case Brightness.light:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color? labelColor = onColor;

    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Row(
          children: [
            Expanded(
                child: RichText(
                    text: TextSpan(children: [
              TextSpan(
                text: label,
                style: TextUtil(
                  context,
                  color: labelColor,
                  weight: FontWeight.w700,
                ).labelL(),
              ),
              TextSpan(
                text: color != null
                    ? '\n(${colorToHex(color as Color).toUpperCase()})'
                    : '\nHex value not available',
                style: TextUtil(
                  context,
                  color: labelColor,
                ).labelS(),
              ),
            ])))
          ],
        ),
      ),
    );
  }
}
