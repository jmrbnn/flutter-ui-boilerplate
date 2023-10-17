import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/alert_utils.dart';
import 'package:emp_ai_ds/utils/text_util.dart';
import 'package:emp_ai_ds/widgets/app_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class StoryAlert extends ConsumerStatefulWidget {
  const StoryAlert({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StoryAlertState();
}

class _StoryAlertState extends ConsumerState<StoryAlert> {
  @override
  Widget build(BuildContext context) {
    AlertUtils alert = AlertUtils(
      context,
      title: context.knobs.text(
        label: 'Alert title',
        description: 'This is the alert title',
        initial: 'Alert title',
      ),
      description: context.knobs.text(
        label: 'Alert description',
        description: 'This is the alert description',
        initial: 'Alert description',
      ),
      // position: context.knobs.options(
      //     label: 'Alert position',
      //     description: 'Alert position',
      //     initial: AlertPosition.bottomLeft,
      //     options: [
      //       const Option(
      //         label: 'Top',
      //         value: AlertPosition.top,
      //       ),
      //       const Option(
      //         label: 'Bottom',
      //         value: AlertPosition.bottom,
      //       ),
      //       const Option(
      //         label: 'Bottom left',
      //         value: AlertPosition.bottomLeft,
      //       ),
      //     ]),
      alertColor: context.knobs.options(
          label: 'Alert color',
          description: 'Alert color',
          initial: ref.read(colorProvider).primary,
          options: [
            Option(
              label: 'Neutral',
              value: ref.read(colorProvider).primary,
            ),
            Option(
              label: 'Success',
              value: ref.read(colorProvider).success,
            ),
            Option(
              label: 'Error',
              value: ref.read(colorProvider).error,
            ),
            Option(
              label: 'Warning',
              value: ref.read(colorProvider).warning,
            ),
          ]),
      action: context.knobs.options(
          label: 'Alert action',
          description: 'Alert action',
          initial: Text(
            'Plain text',
            style: TextUtil(context, weight: FontWeight.w700).labelS(),
          ),
          options: [
            Option(
              label: 'Plain text',
              value: Text(
                'Plain text',
                style: TextUtil(context, weight: FontWeight.w700).labelS(),
              ),
            ),
            Option(
              label: 'Anchor',
              value: GestureDetector(
                onTap: () {
                  launchUrlString('https://google.com');
                },
                child: Text(
                  'Anchor',
                  style: TextUtil(context, weight: FontWeight.w700).labelS(),
                ),
              ),
            ),
          ]),
    );
    return Column(
      children: [
        AppCustomButton(
          labelText: 'Toggle alert',
          onPressed: () {
            alert.trigger();
          },
        ),
      ],
    );
  }
}
