import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/text_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/demo/demo/button_demo.dart';
import 'package:emp_ai_ds/widgets/demo/demo/colors_demo.dart';
import 'package:emp_ai_ds/widgets/demo/demo/typography_demo.dart';
import 'package:emp_ai_ds/widgets/layout/page_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DesignSystem extends ConsumerStatefulWidget {
  const DesignSystem({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DesignSystemState();
}

class _DesignSystemState extends ConsumerState<DesignSystem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppButton(
              icon: Icon(ref.read(themeModeProvider).name == 'light'
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode),
              onPressed: () {
                DsUtils.setBrightnessMode(
                  ref,
                  mode: ref.read(themeModeProvider).name == 'light'
                      ? ThemeMode.dark
                      : ThemeMode.light,
                );
                // DsUtils.handleBrightnessChange(ref);
              },
            ),
          ),
        ],
      ),
      body: PageLayout(
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 12,
              md: 3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 48, horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Buttons",
                          style: TextUtil(
                            context,
                            color: ref.watch(colorProvider).primary,
                          ).displayL(),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Buttons are user interface components that allow users to trigger an action or interaction within a digital interface.",
                          style: TextUtil(context).labelL(),
                        ),
                      ],
                    ),
                  ),
                  const ButtonDemo(),
                ],
              ),
            ),
            ResponsiveGridCol(
              xs: 12,
              md: 3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 48, horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Color roles",
                          style: TextUtil(
                            context,
                            color: ref.watch(colorProvider).primary,
                          ).displayL(),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "A scheme is the group of tones assigned to specific roles that get mapped to components. The tone pairings in color roles provide accessible contrast by default and inform tone adjustments for any additional custom color to work harmoniously with an existing scheme.",
                          style: TextUtil(context).labelL(),
                        ),
                      ],
                    ),
                  ),
                  const ColorsDemo(),
                ],
              ),
            ),
            ResponsiveGridCol(
              xs: 12,
              md: 6,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Typography",
                          style: TextUtil(
                            context,
                            color: ref.watch(colorProvider).primary,
                          ).displayL(),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Inter has a simple and clean design, with clear and well-defined letterforms that are easy to read at different sizes and on different screens. It also has a wide range of characters, including various punctuation marks, symbols, and accents, making it suitable for use in a variety of languages and writing systems.",
                          style: TextUtil(context).labelL(),
                        ),
                      ],
                    ),
                    const TypographyDemo(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
