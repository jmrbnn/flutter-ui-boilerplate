import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/demo/demo/colors_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StoryColors extends ConsumerStatefulWidget {
  const StoryColors({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StoryColorsState();
}

class _StoryColorsState extends ConsumerState<StoryColors> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          height: MediaQuery.of(context).size.height - 50,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width < 500
                ? 16
                : MediaQuery.of(context).size.width * .1,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ColorsDemo(
                  themeMode: context.knobs.options(
                    label: 'Brightness mode',
                    description: 'This is the application\'s brightness mode',
                    initial: ThemeMode.light,
                    options: [
                      const Option(
                        label: 'Light mode',
                        value: ThemeMode.light,
                      ),
                      const Option(
                        label: 'Dark mode',
                        value: ThemeMode.dark,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
