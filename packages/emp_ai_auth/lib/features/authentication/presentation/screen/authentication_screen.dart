// ignore_for_file: avoid_print

import 'package:emp_ai_auth/features/authentication/presentation/providers/authentication_providers.dart';
import 'package:emp_ai_auth/features/authentication/presentation/providers/state/authentication_state.dart';
import 'package:emp_ai_auth/features/authentication/presentation/widgets/authentication_app.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationScreen extends ConsumerStatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthenticationScreenState();
}

class _AuthenticationScreenState extends ConsumerState<AuthenticationScreen> {
  String? appName;
  String clientId = '';
  String redirectUrl = '';
  String code = '';
  bool willRedirect = false;

  final setupPasswordForm = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Listen for state change on AuthenticationNotifier
    ref.listen(
      authenticationProvider.select((value) => value),
      ((previous, next) {
        if (next is Failure) {
          DsUtils.showSnackBar(
            context,
            next,
            type: SnackBarTypes.error,
          );
        } else if (next is Success) {
          DsUtils.showSnackBar(context, next);
        }
      }),
    );

    return LayoutBuilder(builder: (context, constraints) {
      return FormLayout(
        isScrollable: constraints.maxHeight < 500,
        child: Transform.translate(
          offset: Offset(0, constraints.maxHeight * 0.01),
          child: const AuthenticationApp(),
        ),
      );
    });
  }
}
