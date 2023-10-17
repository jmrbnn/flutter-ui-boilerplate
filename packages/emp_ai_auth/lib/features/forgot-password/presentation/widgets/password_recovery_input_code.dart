import 'dart:async';

import 'package:emp_ai_auth/features/forgot-password/presentation/providers/state/forgot_password_state.dart';
import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_auth/features/forgot-password/presentation/providers/forgot_password_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PasswordRecoveryInputCode extends ConsumerStatefulWidget {
  final String username;
  const PasswordRecoveryInputCode({
    super.key,
    required this.username,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordRecoveryInputCodeState();
}

class _PasswordRecoveryInputCodeState
    extends ConsumerState<PasswordRecoveryInputCode> {
  TextEditingController pinCodeController = TextEditingController();
  StreamController<ErrorAnimationType> errorAnimationController =
      StreamController<ErrorAnimationType>();
  String? error;
  @override
  void dispose() {
    errorAnimationController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(forgotPasswordProvider);

    ref.listen(
      forgotPasswordProvider.select((value) => value),
      ((previous, next) {
        if (next is InputCode) {
          error = next.exception?.message;
          if (error != null) {
            errorAnimationController.add(ErrorAnimationType.shake);
          }
        }
      }),
    );

    return Column(
      children: [
        DsUtils.themeConfiguration(ref).confirmIdentityHeader ??
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: DsUtils.loadSvgFile(
                    path: 'assets/images/svg/emapta-outsourcing-reimagined.svg',
                    package: 'emp_ai_ds',
                    height: 20,
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 24),
                Text(
                  'We\'ve sent you an email!',
                  textAlign: TextAlign.left,
                  style: TypeUtil(
                    context: context,
                    weight: FontWeight.w700,
                    fontFamily: DsUtils.themeConfiguration(ref).fontFamily,
                  ).h4(),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text:
                        'We sent an email to the email address associated with the username that you\'ve provided.',
                    children: [
                      const TextSpan(
                          text: '\n\nDidn\'t get the email? Try these '),
                      TextSpan(
                        text: 'tips from our Help Center',
                        style: TypeUtil(
                          context: context,
                          color: Theme.of(context).colorScheme.primary,
                          weight: FontWeight.w700,
                          fontFamily:
                              DsUtils.themeConfiguration(ref).fontFamilyAlt,
                        ).body(),
                      ),
                      const TextSpan(text: '.\n\n'),
                    ],
                    style: TypeUtil(
                      context: context,
                      fontFamily: DsUtils.themeConfiguration(ref).fontFamilyAlt,
                    ).body(),
                  ),
                ),
              ],
            ),
        PinCodeTextField(
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          appContext: context,
          autoFocus: true,
          cursorColor: Theme.of(context).colorScheme.outline,
          autoDismissKeyboard: false,
          onChanged: (e) {
            setState(() {
              error = null;
            });
          },
          errorAnimationController: errorAnimationController,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 50,
            activeFillColor: Colors.white,
            errorBorderColor: ref.read(colorProvider).error,
            activeColor: Theme.of(context).colorScheme.outline,
            inactiveColor: Theme.of(context).colorScheme.outline,
            selectedFillColor: Theme.of(context).colorScheme.error,
          ),
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Theme.of(context).colorScheme.surfaceTint,
          // enableActiveFill: true,
          controller: pinCodeController,
          onCompleted: (verificationCode) {
            ref
                .read(forgotPasswordProvider.notifier)
                .verifyCode(verificationCode, widget.username);
          },
          beforeTextPaste: (text) {
            return true;
          },
        ),
        const SizedBox(height: 8),
        Visibility(
            visible: error != null,
            child: Text(
              error == 'Invalid verification code'
                  ? 'One-time code used is invalid'
                  : error ?? 'One-time code used is invalid',
              style: TypeUtil(
                fontFamily: 'Inter',
                color: Theme.of(context).colorScheme.error,
              ).small(),
            )),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
              text: 'Not your email address? ',
              children: [
                TextSpan(
                    text: ' Switch account',
                    style: TypeUtil(
                      context: context,
                      weight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: DsUtils.themeConfiguration(ref).fontFamilyAlt,
                    ).small(),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        ref.read(forgotPasswordProvider.notifier).reset();
                      }),
              ],
              style: TypeUtil(
                context: context,
                fontFamily: DsUtils.themeConfiguration(ref).fontFamilyAlt,
              ).small()),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
