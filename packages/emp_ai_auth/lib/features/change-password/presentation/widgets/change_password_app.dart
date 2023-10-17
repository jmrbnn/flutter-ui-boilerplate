// ignore_for_file: depend_on_referenced_packages

import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_login_providers.dart';
import 'package:emp_ai_ds/entities/password_policy_model.dart';
import 'package:emp_ai_ds/utils/base_passwords_controller.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/app_card.dart';
import 'package:emp_ai_ds/widgets/app_modal.dart';
import 'package:emp_ai_ds/widgets/app_passwords_field.dart';
import 'package:emp_ai_ds/widgets/app_text_input.dart';
import 'package:emp_ai_auth/features/change-password/presentation/providers/change_password_provider.dart';
import 'package:emp_ai_auth/features/change-password/presentation/providers/state/change_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class ChangePasswordApp extends ConsumerStatefulWidget {
  final Function()? onBack;
  final Function()? onSuccess;
  final bool isDense;
  const ChangePasswordApp({
    super.key,
    this.onBack,
    this.onSuccess,
    this.isDense = false,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangePasswordAppState();
}

class _ChangePasswordAppState extends ConsumerState<ChangePasswordApp> {
  final changePasswordForm = GlobalKey<FormState>();
  bool isProcessing = false;
  bool isConfirming = false;
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  FocusNode passwordFocus = FocusNode();
  FocusNode newPasswordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

  final passwordsController_ = Get.put(BasePasswordsController());
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
    final state = ref.watch(changePasswordProvider);

    ref.listen(
      changePasswordProvider.select((value) => value),
      ((previous, next) {
        if (next is Failure) {
          DsUtils.showSnackBar(context, next.exception.message.toString(),
              type: SnackBarTypes.error);
        } else if (next is Success) {
          if (widget.onSuccess != null) widget.onSuccess!();

          _reset();
          DsUtils.showSnackBar(
              context, next.data['message'] ?? 'Password updated successfully!',
              type: SnackBarTypes.success);
        }
      }),
    );

    return Form(
      key: changePasswordForm,
      child: AppCard(
        borderRadiusGeometry: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(4),
          bottomLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
        content: state.maybeMap(
            processing: (e) => const SizedBox(
                  height: 200,
                  width: 200,
                  child: RiveAnimation.asset(
                    'assets/rive/error_success.riv',
                    fit: BoxFit.cover,
                    animations: [
                      'Loading',
                    ],
                  ),
                ),
            orElse: () => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    widget.isDense
                        ? DsUtils.emptyWidget
                        : Wrap(
                            children: [
                              widget.onBack != null
                                  ? IconButton(
                                      onPressed: () => widget.onBack != null
                                          ? widget.onBack!()
                                          : null,
                                      icon: const Icon(Icons.arrow_back),
                                    )
                                  : DsUtils.emptyWidget,
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                ),
                                child: Text(
                                  'Change Password',
                                  textAlign: TextAlign.left,
                                  style: TypeUtil(
                                    context: context,
                                    weight: FontWeight.w700,
                                    fontFamily: DsUtils.themeConfiguration(ref)
                                        .fontFamily,
                                  ).h4(),
                                ),
                              ),
                            ],
                          ),
                    widget.isDense
                        ? DsUtils.emptyWidget
                        : const SizedBox(height: 8),
                    widget.isDense
                        ? DsUtils.emptyWidget
                        : Text(
                            'Please input your current password in order for us to confirm your identity',
                            textAlign: TextAlign.left,
                            style: TypeUtil(
                              context: context,
                              fontFamily:
                                  DsUtils.themeConfiguration(ref).fontFamilyAlt,
                            ).small(),
                          ),
                    widget.isDense
                        ? DsUtils.emptyWidget
                        : const SizedBox(height: 24),
                    AppTextInput(
                      inputLabel: 'Current password',
                      isRequired: true,
                      isPassword: true,
                      hintText: 'Please input your current password',
                      focusNode: passwordFocus,
                      onDone: () => newPasswordFocus.requestFocus(),
                      controller: passwordController,
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    PasswordFields(
                      policy: PasswordPolicy.fromJson(
                          GeneralUtils.parsePasswordPolicy(passwordPolicy)),
                      setPasswordLabel: 'New password',
                      passwordControl: newPasswordController,
                      passwordFocusNode: newPasswordFocus,
                      confirmPasswordLabel: 'Re-enter your new password',
                      confirmPasswordControl: confirmPasswordController,
                      confirmPasswordFocusNode: confirmPasswordFocus,
                      custombasePasswordsController: passwordsController_,
                      onComplete: () => _confirmChangePassword(ref),
                    ),
                    AppButton(
                      isDisabled: ref.watch(changePasswordProvider) ==
                          const ChangePasswordState.processing(),
                      labelText: 'Change password',
                      isBlock: true,
                      onPressed: () => _confirmChangePassword(ref),
                    ),
                    const SizedBox(height: 16),
                  ],
                )),
      ),
    );
  }

  _confirmChangePassword(WidgetRef ref) {
    setState(() {
      isConfirming = true;
    });
    if (changePasswordForm.currentState!.validate()) {
      double width_ = 600;
      AppModal(
          width: width_,
          barrierDismissible: false,
          onDismiss: () => setState(() {
                isConfirming = false;
              }),
          header: Text(
            'CHANGE PASSWORD',
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
                        'Confirm changes',
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
                        'Do you want to change your password?',
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
              alignment: WrapAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                AppButton(
                  labelText: 'Cancel',
                  isDisabled: ref.watch(changePasswordProvider) ==
                      const ChangePasswordState.processing(),
                  type: AppButtonTypes.outline,
                  customColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                AppButton(
                  isDisabled: ref.watch(changePasswordProvider) ==
                      const ChangePasswordState.processing(),
                  labelText: 'Submit changes',
                  onPressed: () => _changePassword(),
                )
              ],
            ),
          )).toggleDialogModal(context);
    }
  }

  void _reset() {
    passwordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
    passwordsController_.clearData();
  }

  void _changePassword() {
    if (isConfirming) {
      Navigator.of(context).pop();
    }
    ref.read(changePasswordProvider.notifier).changePassword(
          passwordController.text,
          newPasswordController.text,
        );
  }
}
