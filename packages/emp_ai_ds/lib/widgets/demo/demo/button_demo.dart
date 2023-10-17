import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/text_util.dart';
import 'package:emp_ai_ds/widgets/app_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicons/unicons.dart';

class ButtonDemo extends ConsumerWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        // Variants
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Types",
                style: TextUtil(context, weight: FontWeight.w700).headingL(),
              ),
            ],
          ),
        ),
        Divider(color: ref.watch(colorProvider).divider),

        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.large,
          iconTrailing: UniconsLine.plus,
          // iconLeading: UniconsLine.minus,
        ),
        Text(
          "Auto-layout type",
          style: TextUtil(context, weight: FontWeight.w700).bodyL(),
        ),
        const SizedBox(height: 24),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.large,
          iconTrailing: UniconsLine.plus,
          // iconLeading: UniconsLine.minus,
          isBlock: true,
        ),
        Text(
          "Grid type",
          style: TextUtil(context, weight: FontWeight.w700).bodyL(),
        ),
        const SizedBox(height: 24),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.large,
          iconTrailing: UniconsLine.plus,
          // iconLeading: UniconsLine.minus,
          isBlock: true,
          type: AppCustomButtonTypes.fixedIcon,
        ),
        Text(
          "Fixed icon type",
          style: TextUtil(context, weight: FontWeight.w700).bodyL(),
        ),
        const SizedBox(height: 24),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.large,
          iconTrailing: UniconsLine.plus,
          // iconLeading: UniconsLine.minus,
          type: AppCustomButtonTypes.iconOnly,
        ),
        Text(
          "Icon only type",
          style: TextUtil(context, weight: FontWeight.w700).bodyL(),
        ),
        // Primary
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Primary",
                style: TextUtil(context, weight: FontWeight.w700).headingL(),
              ),
            ],
          ),
        ),
        Divider(color: ref.watch(colorProvider).divider),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.large,
          iconTrailing: UniconsLine.baseball_ball,
          iconLeading: UniconsLine.baseball_ball,
          isDisabled: true,
        ),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.large,
          iconTrailing: UniconsLine.baseball_ball,
          iconLeading: UniconsLine.baseball_ball,
        ),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.medium,
          iconTrailing: UniconsLine.baseball_ball,
          iconLeading: UniconsLine.baseball_ball,
        ),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.small,
          iconTrailing: UniconsLine.baseball_ball,
          iconLeading: UniconsLine.baseball_ball,
        ),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.xsmall,
          iconTrailing: UniconsLine.baseball_ball,
          iconLeading: UniconsLine.baseball_ball,
        ),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.xsmall,
          iconTrailing: UniconsLine.plus,
          // iconLeading: UniconsLine.minus,
          type: AppCustomButtonTypes.iconOnly,
        ),
        // Secondary
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Secondary",
                style: TextUtil(context, weight: FontWeight.w700).headingL(),
              ),
            ],
          ),
        ),
        Divider(color: ref.watch(colorProvider).divider),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.large,
          iconTrailing: UniconsLine.baseball_ball,
          iconLeading: UniconsLine.baseball_ball,
          isDisabled: true,
          variant: AppCustomButtonVariant.secondary,
        ),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.large,
          iconTrailing: UniconsLine.baseball_ball,
          iconLeading: UniconsLine.baseball_ball,
          variant: AppCustomButtonVariant.secondary,
        ),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.medium,
          iconTrailing: UniconsLine.baseball_ball,
          iconLeading: UniconsLine.baseball_ball,
          variant: AppCustomButtonVariant.secondary,
        ),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.small,
          iconTrailing: UniconsLine.baseball_ball,
          iconLeading: UniconsLine.baseball_ball,
          variant: AppCustomButtonVariant.secondary,
        ),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.xsmall,
          iconTrailing: UniconsLine.baseball_ball,
          iconLeading: UniconsLine.baseball_ball,
          variant: AppCustomButtonVariant.secondary,
        ),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.xsmall,
          iconTrailing: UniconsLine.plus,
          // iconLeading: UniconsLine.minus,
          variant: AppCustomButtonVariant.secondary,
          type: AppCustomButtonTypes.iconOnly,
        ),
        // Tertiary
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tertiary",
                style: TextUtil(context, weight: FontWeight.w700).headingL(),
              ),
            ],
          ),
        ),
        Divider(color: ref.watch(colorProvider).divider),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.large,
          iconTrailing: UniconsLine.baseball_ball,
          iconLeading: UniconsLine.baseball_ball,
          isDisabled: true,
          variant: AppCustomButtonVariant.tertiary,
        ),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.large,
          iconTrailing: UniconsLine.baseball_ball,
          iconLeading: UniconsLine.baseball_ball,
          variant: AppCustomButtonVariant.tertiary,
        ),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.medium,
          iconTrailing: UniconsLine.baseball_ball,
          iconLeading: UniconsLine.baseball_ball,
          variant: AppCustomButtonVariant.tertiary,
        ),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.small,
          iconTrailing: UniconsLine.baseball_ball,
          iconLeading: UniconsLine.baseball_ball,
          variant: AppCustomButtonVariant.tertiary,
        ),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.xsmall,
          iconTrailing: UniconsLine.baseball_ball,
          iconLeading: UniconsLine.baseball_ball,
          variant: AppCustomButtonVariant.tertiary,
        ),
        const AppCustomButton(
          labelText: 'Button',
          size: AppCustomButtonSize.xsmall,
          iconTrailing: UniconsLine.plus,
          // iconLeading: UniconsLine.minus,
          variant: AppCustomButtonVariant.tertiary,
          type: AppCustomButtonTypes.iconOnly,
        ),
      ],
    );
  }
}
