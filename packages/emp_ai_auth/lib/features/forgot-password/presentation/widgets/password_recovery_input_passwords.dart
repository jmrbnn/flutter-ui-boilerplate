// ignore_for_file: depend_on_referenced_packages

import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_login_providers.dart';
import 'package:emp_ai_ds/entities/password_policy_model.dart';
import 'package:emp_ai_ds/utils/base_passwords_controller.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/app_modal.dart';
import 'package:emp_ai_ds/widgets/app_passwords_field.dart';
import 'package:emp_ai_auth/features/forgot-password/presentation/providers/forgot_password_provider.dart';
import 'package:emp_ai_auth/features/forgot-password/presentation/providers/state/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class PasswordRecoveryInputPasswords extends ConsumerStatefulWidget {
  final String code;
  final String username;
  const PasswordRecoveryInputPasswords({
    super.key,
    required this.username,
    required this.code,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordRecoveryInputPasswordsState();
}

class _PasswordRecoveryInputPasswordsState
    extends ConsumerState<PasswordRecoveryInputPasswords> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  FocusNode newPasswordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

  bool isConfirming = false;
  final passwordsController_ = Get.put(BasePasswordsController());
  final recoveryLinkForm = GlobalKey<FormState>();

  String? error;

  List passwordPolicy = [];
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(microseconds: 200), () async {
      List passwordPolicy_ = await ref
          .watch(oAuthStateNotifierProvider.notifier)
          .getPasswordPolicy();
      GeneralUtils.isolateDebug(passwordPolicy);

      setState(() {
        passwordPolicy = passwordPolicy_;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      forgotPasswordProvider.select((value) => value),
      ((previous, next) {
        if (next is Failure) {
          DsUtils.showSnackBar(context, next.exception.message.toString(),
              type: SnackBarTypes.error);
        } else if (next is Success) {
          _reset();
        } else if (next is InputCode) {
        } else if (next is InputPasswords) {
          error = next.exception?.message;
        }
      }),
    );

    return Form(
      key: recoveryLinkForm,
      child: Column(
        children: [
          DsUtils.themeConfiguration(ref).createNewPasswordHeader ??
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: DsUtils.loadSvgFile(
                      path:
                          'assets/images/svg/emapta-outsourcing-reimagined.svg',
                      package: 'emp_ai_ds',
                      height: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 24),
                  Text(
                    'Create new password',
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
                          'Your new password must be different from previously used passwords',
                      style: TypeUtil(
                        context: context,
                        fontFamily:
                            DsUtils.themeConfiguration(ref).fontFamilyAlt,
                      ).body(),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
          PasswordFields(
            policy: PasswordPolicy.fromJson(
                GeneralUtils.parsePasswordPolicy(passwordPolicy)),
            setPasswordLabel: 'Set password',
            passwordControl: newPasswordController,
            passwordFocusNode: newPasswordFocus,
            confirmPasswordLabel: 'Confirm password',
            confirmPasswordControl: confirmPasswordController,
            confirmPasswordFocusNode: confirmPasswordFocus,
            custombasePasswordsController: passwordsController_,
            errorText: error,
            showHintsOnload:
                DsUtils.themeConfiguration(ref).showPasswordHintsOnLoad,
            onComplete: () =>
                DsUtils.themeConfiguration(ref).confirmModalsInAuth
                    ? _confirmResetPassword(ref)
                    : _resetForgotPassword(ref),
          ),
          AppButton(
            isDisabled: ref.watch(forgotPasswordProvider) ==
                const ForgotPasswordState.processing(),
            labelText: 'Reset password',
            isBlock: true,
            onPressed: () => DsUtils.themeConfiguration(ref).confirmModalsInAuth
                ? _confirmResetPassword(ref)
                : _resetForgotPassword(ref),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  _confirmResetPassword(WidgetRef ref) {
    setState(() {
      isConfirming = true;
    });
    if (recoveryLinkForm.currentState!.validate()) {
      double width_ = 600;
      AppModal(
          width: width_,
          barrierDismissible: false,
          onDismiss: () => setState(() {
                isConfirming = false;
              }),
          header: Text(
            'RESET PASSWORD',
            style: TypeUtil(
              weight: FontWeight.w600,
              color: DsUtils.color(context, ColorSets.neutral, variant: 50),
              fontFamily: 'Inter',
            ).body(),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth < width_
                    ? constraints.maxWidth
                    : width_,
                child: Wrap(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    SizedBox(
                      width: constraints.maxWidth < width_
                          ? constraints.maxWidth
                          : width_,
                      child: Text(
                        'Reset password',
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style: TypeUtil(
                                context: context,
                                fontFamily: 'Inter',
                                weight: FontWeight.w700)
                            .h4(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: constraints.maxWidth < width_
                          ? constraints.maxWidth
                          : width_,
                      child: Text(
                        'You are about to change your password. Do you want to proceed?',
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style: TypeUtil(context: context, fontFamily: 'Inter')
                            .h5(),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          hasFooter: true,
          footer: Align(
            alignment: Alignment.bottomRight,
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                AppButton(
                  labelText: 'Cancel',
                  type: AppButtonTypes.outline,
                  customColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                AppButton(
                  labelText: 'Yes, change password',
                  onPressed: () => _resetForgotPassword(ref),
                )
              ],
            ),
          )).toggleDialogModal(context);
    }
  }

  _resetForgotPassword(WidgetRef ref) {
    if (isConfirming) {
      Navigator.of(context).pop();
    }

    ref.read(forgotPasswordProvider.notifier).resetPassword(
          widget.code,
          widget.username,
          newPasswordController.text,
        );
  }

  void _reset() {
    passwordsController_.clearData();
  }
}
