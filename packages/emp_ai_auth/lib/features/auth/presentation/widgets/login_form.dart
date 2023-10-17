import 'package:emp_ai_ds/constants/themes/default/default_theme.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/app_text_input.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  final GlobalKey<FormState>? formKey;
  final Function(dynamic) onLogin;
  final Function()? onForgotPassword;
  final OAuthState state;
  final TextEditingController usernameController;
  final FocusNode usernameFocus;
  final TextEditingController passwordController;
  final FocusNode passwordFocus;
  const LoginForm({
    super.key,
    this.formKey,
    required this.onLogin,
    this.onForgotPassword,
    required this.state,
    required this.usernameController,
    required this.usernameFocus,
    required this.passwordController,
    required this.passwordFocus,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: FocusTraversalGroup(
        policy: OrderedTraversalPolicy(),
        child: Column(
          children: [
            AppTextInput(
              // width: 300,
              hintText: 'Username',
              disabled: widget.state is Loading,
              controller: widget.usernameController,
              isRequired: true,
              prefix: const Icon(Icons.person_3_outlined),
              onDone: () => widget.passwordFocus.requestFocus(),
              focusNode: widget.usernameFocus,
            ),
            AppTextInput(
              // width: 300,
              labelText: 'Password',
              hintText: 'Password',
              disabled: widget.state is Loading,
              controller: widget.passwordController,
              isPassword: true,
              isRequired: true,
              prefix: const Icon(Icons.lock_outline_rounded),
              onDone: () => widget.onLogin(''),
              focusNode: widget.passwordFocus,
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                children: [
                  GestureDetector(
                    onTap: () => widget.onForgotPassword!(),
                    child: Text(
                      'Forgot my password',
                      style: TypeUtil(
                        context: context,
                        weight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: config_.fontFamilyAlt,
                      ).small(),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 36),
            widget.state.maybeMap(
              loading: (_) => AppButton(
                isDisabled: true,
                isBlock: true,
                label: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onBackground,
                    strokeWidth: 2.5,
                  ),
                ),
              ),
              orElse: () => AppButton(
                isBlock: true,
                onPressed: () {
                  widget.onLogin('');
                },
                labelText: 'Login',
              ),
            ),
            // const AppButton(
            //   labelText: 'Login',
            //   customColor: Color(0xFF53c01e),
            //   isBlock: true,
            // )
          ],
        ),
      ),
    );
  }
}
