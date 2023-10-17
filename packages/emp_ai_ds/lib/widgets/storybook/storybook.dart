import 'package:emp_ai_auth/features/change-password/presentation/widgets/change_password_app.dart';
import 'package:emp_ai_auth/features/forgot-password/presentation/widgets/password_recovery_app.dart';
import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/storybook/stories/alerts.dart';
import 'package:emp_ai_ds/widgets/storybook/stories/buttons.dart';
import 'package:emp_ai_ds/widgets/storybook/stories/category_inputs.dart';
import 'package:emp_ai_ds/widgets/storybook/stories/colors.dart';
import 'package:emp_ai_ds/widgets/storybook/stories/dropdown_inputs.dart';
import 'package:emp_ai_ds/widgets/storybook/stories/inputs.dart';
import 'package:emp_ai_ds/widgets/storybook/stories/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class DesignSystemStorybook extends ConsumerStatefulWidget {
  const DesignSystemStorybook({super.key});

  @override
  ConsumerState<DesignSystemStorybook> createState() =>
      _DesignSystemStorybookState();
}

class _DesignSystemStorybookState extends ConsumerState<DesignSystemStorybook> {
  @override
  Widget build(
    BuildContext context,
  ) =>
      Storybook(
        wrapperBuilder: (context, child) {
          return Scaffold(
            backgroundColor: ref.watch(colorProvider).background,
            body: Column(children: [
              // Container(
              //   color: ref.watch(colorProvider).primaryContainer,
              //   margin: const EdgeInsets.only(bottom: 48),
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 48, horizontal: 48),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Northstar Design system",
              //         style: TextUtil(
              //           context,
              //           color: ref.watch(colorProvider).primary,
              //         ).displayL(),
              //       ),
              //       const SizedBox(height: 8),
              //       Text(
              //         "Northstar will be the Design System used by Emapta Superapps.",
              //         style: TextUtil(context,
              //                 color: ref.watch(colorProvider).contentBlack)
              //             .labelL(),
              //       ),
              //     ],
              //   ),
              // ),
              child ?? DsUtils.emptyWidget
            ]),
          );
        },
        stories: [
          Story(
            name: 'DS Foundation/Typography',
            description: 'Helper class for rendering text style',
            builder: (context) => const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: StoryTypography()),
                ],
              ),
            ),
          ),
          Story(
            name: 'DS Foundation/Color roles',
            description: 'Palette of colors based on role',
            builder: (context) => const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: StoryColors()),
                ],
              ),
            ),
          ),
          Story(
            name: 'Atom Widgets/Buttons',
            description:
                'Buttons are user interface components that allow users to trigger an action or interaction within a digital interface.',
            builder: (context) => const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: StoryButton()),
                ],
              ),
            ),
          ),
          Story(
            name: 'Molecule Widgets/Inputs',
            description:
                'Input fields are typically defined through a set of guidelines or specifications that outline their appearance, behavior, and usage.',
            builder: (context) => const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: StoryInputs()),
                ],
              ),
            ),
          ),
          Story(
            name: 'Molecule Widgets/Category Inputs',
            description: 'A variation of a text and a dropdown input',
            builder: (context) => const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: StoryCategoryInputs()),
                ],
              ),
            ),
          ),
          Story(
            name: 'Molecule Widgets/Dropdown Inputs',
            description:
                'The dropdown input allows users to select a value from a list of options',
            builder: (context) => const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: StoryDropdownInputs()),
                ],
              ),
            ),
          ),
          Story(
            name: 'Molecule Widgets/Alerts',
            description:
                'Alerts are dynamic, they are displayed for a short period of time and typically contain system\'s feedback to user\'s micro interactions',
            builder: (context) => const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: StoryAlert()),
                ],
              ),
            ),
          ),
          Story(
            name: 'Modular Widgets/Change password',
            description:
                'This module is responsible for interacting with the IMS\' change password API endpoint',
            builder: (context) => const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: ChangePasswordApp()),
                ],
              ),
            ),
          ),
          Story(
            name: 'Modular Widgets/Reset password',
            description:
                'This module is responsible for interacting with the IMS\' recover password API endpoint',
            builder: (context) => const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: PasswordRecoveryApp()),
                ],
              ),
            ),
          ),
        ],
      );
}
