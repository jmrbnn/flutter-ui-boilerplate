import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:emp_ai_auth/features/change-password/presentation/widgets/change_password_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangePasswordScreen extends ConsumerWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      return FormLayout(
        isScrollable: true,
        isVerticallyCentered: !GeneralUtils.checkIfMobileBrowser(context),
        child: Transform.translate(
          offset: Offset(0, constraints.maxHeight * 0.01),
          child: const ChangePasswordApp(
              // onBack: () => GoRouter.of(context).go(Routes.home.url),
              ),
        ),
      );
    });
  }
}
