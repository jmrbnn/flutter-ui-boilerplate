import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/router/routers.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/change-password/presentation/widgets/change_password_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordScreen extends ConsumerWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      return FormLayout(
        isScrollable: constraints.maxHeight < 500,
        child: Transform.translate(
          offset: Offset(0, constraints.maxHeight * 0.01),
          child: ChangePasswordApp(
            onBack: () => GoRouter.of(context).go(Routes.home.url),
          ),
        ),
      );
    });
  }
}
