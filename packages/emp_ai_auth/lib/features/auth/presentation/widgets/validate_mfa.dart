import 'dart:async';

import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_card.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_login_providers.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ValidateMfaApp extends ConsumerStatefulWidget {
  const ValidateMfaApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ValidateMfaAppState();
}

class _ValidateMfaAppState extends ConsumerState<ValidateMfaApp> {
  TextEditingController pinCodeController = TextEditingController();
  StreamController<ErrorAnimationType> errorAnimationController =
      StreamController<ErrorAnimationType>();

  @override
  void dispose() {
    errorAnimationController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(oAuthStateNotifierProvider);
    ref.listen(
      oAuthStateNotifierProvider.select((value) => value),
      ((previous, next) {
        if (next is Failure) {
          errorAnimationController.add(ErrorAnimationType.shake);
        }
      }),
    );

    return AppCard(
      hasShadow: false,
      padding: DsUtils.themeConfiguration(ref).setupMfaHeader != null
          ? const EdgeInsets.only(right: 24, left: 24)
          : const EdgeInsets.only(right: 24, left: 24, top: 24),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: DsUtils.themeConfiguration(ref).verifyMfaHeader == null,
            replacement: DsUtils.themeConfiguration(ref).verifyMfaHeader ??
                DsUtils.emptyWidget,
            child: Column(
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
                  'Verify your identity',
                  textAlign: TextAlign.center,
                  style: TypeUtil(
                    context: context,
                    weight: FontWeight.w700,
                    fontFamily: DsUtils.themeConfiguration(ref).fontFamily,
                  ).h4(),
                ),
                const SizedBox(height: 8),
                Text(
                  'To make sure your account is secure, we have to verify your identity. Use the authenticator app on your mobile device to check the verification code.',
                  textAlign: TextAlign.center,
                  style: TypeUtil(
                    context: context,
                    fontFamily: DsUtils.themeConfiguration(ref).fontFamilyAlt,
                  ).small(),
                ),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 16),
                Text(
                  'Enter the verification code below',
                  textAlign: TextAlign.center,
                  style: TypeUtil(
                    context: context,
                    weight: FontWeight.w700,
                    fontFamily: DsUtils.themeConfiguration(ref).fontFamily,
                  ).body(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          PinCodeTextField(
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            appContext: context,
            autoFocus: true,
            cursorColor: Theme.of(context).colorScheme.outline,
            enabled: state is! Loading,
            autoDismissKeyboard: false,
            errorAnimationController: errorAnimationController,
            pinTheme: PinTheme(
              disabledColor: ref.read(colorProvider).border.withOpacity(.2),
              disabledBorderWidth: .5,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 55,
              fieldWidth: 48,
              activeFillColor: Colors.white,
              errorBorderColor: ref.read(colorProvider).error,
              activeColor: Theme.of(context).colorScheme.outline,
              inactiveColor: Theme.of(context).colorScheme.outline,
              selectedFillColor: Theme.of(context).colorScheme.error,
            ),
            // animationDuration: const Duration(milliseconds: 300),
            backgroundColor: Theme.of(context).colorScheme.surfaceTint,
            // enableActiveFill: true,
            controller: pinCodeController,

            onCompleted: (verificationCode) async {
              await ref
                  .read(oAuthStateNotifierProvider.notifier)
                  .validateMfa(verificationCode);
            },
            beforeTextPaste: (text) {
              return true;
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
