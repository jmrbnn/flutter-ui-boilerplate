import 'package:emp_ai_ds/entities/app_dropdown_option.dart';
import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/widgets/app_category_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:unicons/unicons.dart';

class StoryCategoryInputs extends ConsumerStatefulWidget {
  const StoryCategoryInputs({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StoryCategoryInputsState();
}

class _StoryCategoryInputsState extends ConsumerState<StoryCategoryInputs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCategoryInput(
          width: context.knobs.slider(
            label: 'Input width',
            description: 'Input width',
            min: 450,
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
          customLeadingIcon: context.knobs.options(
            label: 'Prefix element',
            description: 'Prefix element',
            initial: null,
            options: [
              const Option(
                label: 'none',
                value: null,
              ),
              const Option(
                label: 'confused',
                value: Icon(UniconsLine.confused),
              ),
              const Option(
                label: 'multiply',
                value: Icon(UniconsLine.multiply),
              ),
              const Option(
                label: 'plus',
                value: Icon(UniconsLine.plus),
              ),
              const Option(
                label: 'exit',
                value: Icon(UniconsLine.exit),
              ),
            ],
          ),
          customTrailingIcon: context.knobs.options(
            label: 'Suffix element',
            description: 'Suffix element',
            initial: null,
            options: [
              const Option(
                label: 'none',
                value: null,
              ),
              const Option(
                label: 'confused',
                value: Icon(UniconsLine.confused),
              ),
              const Option(
                label: 'multiply',
                value: Icon(UniconsLine.multiply),
              ),
              const Option(
                label: 'plus',
                value: Icon(UniconsLine.plus),
              ),
              const Option(
                label: 'exit',
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
          isRequired: context.knobs.boolean(
            label: 'Is required?',
            description: 'Is input required?',
          ),
          isDense: context.knobs.boolean(
            label: 'Is dense?',
            description: 'Is input dense?',
          ),
          options: [
            AppDropdownOption(label: 'Option 1', value: 'option1'),
            AppDropdownOption(label: 'Option 2', value: 'option2'),
            AppDropdownOption(label: 'Option 3', value: 'option3'),
            AppDropdownOption(label: 'Option 4', value: 'option4'),
            AppDropdownOption(label: 'Option 5', value: 'option5'),
          ],
          // enableClear: context.knobs.boolean(
          //   label: 'Has clear button?',
          //   description: 'Has clear button?',
          // ),
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
