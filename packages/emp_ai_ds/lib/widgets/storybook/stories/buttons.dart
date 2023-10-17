import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/widgets/app_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:unicons/unicons.dart';

class StoryButton extends ConsumerStatefulWidget {
  const StoryButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StoryButtonState();
}

class _StoryButtonState extends ConsumerState<StoryButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCustomButton(
          labelText: context.knobs.text(
            label: 'Enabled',
            description: 'Button text',
            initial: 'Button',
          ),
          color: context.knobs.options(
              label: 'Custom color',
              description: 'Custom color',
              initial: null,
              options: [
                Option(
                  label: 'Primary',
                  value: ref.watch(colorProvider).primary,
                ),
                Option(
                  label: 'Error',
                  value: ref.watch(colorProvider).error,
                ),
                Option(
                  label: 'Warning',
                  value: ref.watch(colorProvider).warning,
                ),
                Option(
                  label: 'Success',
                  value: ref.watch(colorProvider).success,
                ),
              ]),
          type: context.knobs.options(
            label: 'Behavior type',
            description: 'Behavior type',
            initial: null,
            options: [
              const Option(
                label: 'Default behavior type',
                value: null,
              ),
              const Option(
                label: 'Auto-layout',
                value: AppCustomButtonTypes.autoLayout,
              ),
              const Option(
                label: 'Fixed icon',
                value: AppCustomButtonTypes.fixedIcon,
              ),
              const Option(
                label: 'Grid-based',
                value: AppCustomButtonTypes.gridBased,
              ),
              const Option(
                label: 'Icon only',
                value: AppCustomButtonTypes.iconOnly,
              ),
            ],
          ),
          iconLeading: context.knobs.options(
            label: 'Leading icon',
            description: 'Leading icon',
            initial: null,
            options: [
              const Option(
                label: 'none',
                value: null,
              ),
              const Option(
                label: 'check',
                value: UniconsLine.check,
              ),
              const Option(
                label: 'multiply',
                value: UniconsLine.multiply,
              ),
              const Option(
                label: 'plus',
                value: UniconsLine.plus,
              ),
              const Option(
                label: 'exit',
                value: UniconsLine.exit,
              ),
            ],
          ),
          iconTrailing: context.knobs.options(
            label: 'Trailing icon',
            description: 'Trailing icon',
            initial: UniconsLine.plus,
            options: [
              const Option(
                label: 'none',
                value: null,
              ),
              const Option(
                label: 'check',
                value: UniconsLine.check,
              ),
              const Option(
                label: 'multiply',
                value: UniconsLine.multiply,
              ),
              const Option(
                label: 'plus',
                value: UniconsLine.plus,
              ),
              const Option(
                label: 'exit',
                value: UniconsLine.exit,
              ),
            ],
          ),
          variant: context.knobs.options(
            label: 'Button variant',
            description: 'Button variant',
            initial: null,
            options: [
              Option(
                label: AppCustomButtonVariant.primary.name,
                value: AppCustomButtonVariant.primary,
              ),
              Option(
                label: AppCustomButtonVariant.secondary.name,
                value: AppCustomButtonVariant.secondary,
              ),
              Option(
                label: AppCustomButtonVariant.tertiary.name,
                value: AppCustomButtonVariant.tertiary,
              ),
            ],
          ),
          size: context.knobs.options(
            label: 'Button size',
            description: 'Button size',
            initial: AppCustomButtonSize.medium,
            options: [
              const Option(
                label: 'Default button size',
                value: AppCustomButtonSize.medium,
              ),
              Option(
                label: AppCustomButtonSize.large.name,
                value: AppCustomButtonSize.large,
              ),
              Option(
                label: AppCustomButtonSize.medium.name,
                value: AppCustomButtonSize.medium,
              ),
              Option(
                label: AppCustomButtonSize.small.name,
                value: AppCustomButtonSize.small,
              ),
              Option(
                label: AppCustomButtonSize.xsmall.name,
                value: AppCustomButtonSize.xsmall,
              ),
            ],
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
