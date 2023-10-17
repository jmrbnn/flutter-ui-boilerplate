import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/widgets/app_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:unicons/unicons.dart';

class StoryInputs extends ConsumerStatefulWidget {
  const StoryInputs({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StoryInputsState();
}

class _StoryInputsState extends ConsumerState<StoryInputs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextInput(
          width: context.knobs.slider(
            label: 'Input width',
            description: 'Input width',
            min: 250,
            max: 800,
          ),
          hintText: context.knobs.text(
            label: 'Hint text',
            description: 'Input hint text',
            initial: 'Hint text',
          ),
          inputLabel: context.knobs.text(
            label: 'Label text',
            description: 'Input label text',
            initial: 'Label text',
          ),
          inputGuide: context.knobs.text(
            label: 'Input helper phrase',
            description: 'Input helper phrase',
            initial: 'This is an input helper',
          ),
          prefix: context.knobs.options(
            label: 'Prefix element',
            description: 'Prefix element',
            initial: null,
            options: [
              const Option(
                label: 'Icon none',
                value: null,
              ),
              const Option(
                label: 'Icon confused',
                value: Icon(UniconsLine.confused),
              ),
              const Option(
                label: 'Icon multiply',
                value: Icon(UniconsLine.multiply),
              ),
              const Option(
                label: 'Icon plus',
                value: Icon(UniconsLine.plus),
              ),
              const Option(
                label: 'Icon exit',
                value: Icon(UniconsLine.exit),
              ),
            ],
          ),
          suffix: context.knobs.options(
            label: 'Suffix element',
            description: 'Suffix element',
            initial: null,
            options: [
              const Option(
                label: 'none',
                value: null,
              ),
              const Option(
                label: 'Text widget',
                value: Text('PHP'),
              ),
              const Option(
                label: 'Icon confused',
                value: Icon(UniconsLine.confused),
              ),
              const Option(
                label: 'Icon multiply',
                value: Icon(UniconsLine.multiply),
              ),
              const Option(
                label: 'Icon plus',
                value: Icon(UniconsLine.plus),
              ),
              const Option(
                label: 'Icon exit',
                value: Icon(UniconsLine.exit),
              ),
            ],
          ),
          helperText: context.knobs.text(
            label: 'Description phrase',
            description: 'Input description phrase',
            initial: 'This is an input description phrase',
          ),
          errorText: context.knobs.text(
            label: 'Error text',
            description: 'Input error text',
            initial: '',
          ),
          isPassword: context.knobs.boolean(
            label: 'Is password field?',
            description: 'Is password field?',
          ),
          isRequired: context.knobs.boolean(
            label: 'Is required?',
            description: 'Is input required?',
          ),
          enableClear: context.knobs.boolean(
            label: 'Has clear button?',
            description: 'Has clear button?',
          ),
          customColor: context.knobs.options(
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
        ),
        Container(),
      ],
    );
  }
}
