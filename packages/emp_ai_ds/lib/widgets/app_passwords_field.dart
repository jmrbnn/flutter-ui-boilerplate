import 'package:emp_ai_ds/entities/password_policy_model.dart';
import 'package:emp_ai_ds/utils/base_passwords_controller.dart';
import 'package:emp_ai_ds/utils/stateful_wrapper.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final passwordsController_ = Get.put(BasePasswordsController());

class PasswordFields extends StatefulWidget {
  final PasswordPolicy? policy;
  final String setPasswordLabel;
  final String confirmPasswordLabel;
  final String? errorText;
  final FocusNode? passwordFocusNode;
  final TextEditingController passwordControl;
  final TextEditingController confirmPasswordControl;
  final FocusNode? confirmPasswordFocusNode;
  final Function()? onComplete;
  final BasePasswordsController? custombasePasswordsController;
  final bool showHintsOnload;
  const PasswordFields({
    Key? key,
    this.policy,
    this.setPasswordLabel = 'Set password',
    this.confirmPasswordLabel = 'Confirm password',
    this.errorText,
    this.passwordFocusNode,
    required this.passwordControl,
    required this.confirmPasswordControl,
    this.confirmPasswordFocusNode,
    this.onComplete,
    this.custombasePasswordsController,
    this.showHintsOnload = true,
  }) : super(key: key);

  @override
  State<PasswordFields> createState() => _PasswordFieldsState();
}

class _PasswordFieldsState extends State<PasswordFields> {
  // final passwordController = TextEditingController().obs;
  // final confirmPasswordController = TextEditingController().obs;

  @override
  Widget build(BuildContext context) {
    final FocusNode passwordFocus_ = widget.passwordFocusNode ?? FocusNode();
    final FocusNode confirmPasswordFocus_ =
        widget.confirmPasswordFocusNode ?? FocusNode();

    BasePasswordsController passwordsController =
        widget.custombasePasswordsController ?? passwordsController_;

    passwordsController.showPasswordRequirements(widget.showHintsOnload);
    return StatefulWrapper(
      onInit: () {
        passwordsController.clearData();
      },
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Focus(
                  child: AppTextInput(
                    isObscured: passwordsController.isObscure.value,
                    onTap: () {
                      passwordsController.showPasswordRequirements(true);
                    },
                    onChange: (password) {
                      passwordsController.showPasswordRequirements(true);
                      passwordsController.onPasswordChanged(password);
                      setState(() {
                        widget.passwordControl.text = password;
                      });
                    },
                    focusNode: passwordFocus_,
                    errorText: widget.errorText,
                    onDone: () => confirmPasswordFocus_.requestFocus(),
                    controller: passwordsController.passwordController,
                    keyboardType: TextInputType.text,
                    autoValidateMode: AutovalidateMode.disabled,
                    isPassword: true,
                    inputLabel: widget.setPasswordLabel,
                    hintText: 'Please input your new password',
                    isRequired: true,
                    customValidator: (value) {
                      // if (value != '') {
                      //   return "This field is required";
                      // }
                      if (passwordsController.hasLengthOfMinimum.isFalse ||
                          passwordsController.hasCapitalletter.isFalse ||
                          passwordsController.hasLowercase.isFalse ||
                          passwordsController.hasNumber.isFalse ||
                          passwordsController.hasSpecialChar.isFalse) {
                        return "Password doesn't pass criteria";
                      }

                      if (passwordsController.passwordDoesMatch.isFalse) {
                        return "Passwords don't match";
                      }

                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
          Obx(
            () {
              int? minLength = widget.policy?.length;
              if (widget.policy?.length != null) {
                passwordsController.minimunPasswordLength(minLength);
              }
              return passwordsController.minimunPasswordLength.value == 0
                  ? DsUtils.emptyWidget
                  : passwordsController.hasLengthOfMinimum.isTrue
                      ? passwordRequirement(
                          'At least ${passwordsController.minimunPasswordLength} characters',
                          Icons.check,
                          const Color(0xff4CA758),
                          passwordsController)
                      : passwordRequirement(
                          'At least ${passwordsController.minimunPasswordLength} characters',
                          widget.passwordControl.text == ''
                              ? Icons.circle_outlined
                              : Icons.close,
                          widget.passwordControl.text == ''
                              ? Colors.grey
                              : Colors.red,
                          passwordsController,
                        );
            },
          ),
          Obx(
            () {
              int? maxLength = widget.policy?.maxLength;
              if (widget.policy?.maxLength != null) {
                passwordsController.maximumPasswordLength(maxLength);
              }
              return passwordsController.maximumPasswordLength.value == 0
                  ? DsUtils.emptyWidget
                  : passwordsController.hasLengthOfMaximum.isTrue
                      ? passwordRequirement(
                          'Max of ${passwordsController.maximumPasswordLength} characters',
                          Icons.check,
                          const Color(0xff4CA758),
                          passwordsController)
                      : passwordRequirement(
                          'Max of ${passwordsController.maximumPasswordLength} characters',
                          widget.passwordControl.text == ''
                              ? Icons.circle_outlined
                              : Icons.close,
                          widget.passwordControl.text == ''
                              ? Colors.grey
                              : Colors.red,
                          passwordsController,
                        );
            },
          ),
          Obx(
            () {
              int? upperCase = widget.policy?.upperCase;
              if (widget.policy?.upperCase != null) {
                passwordsController.minimumUpperCaseCount(upperCase);
              }
              return passwordsController.minimumUpperCaseCount.value == 0
                  ? DsUtils.emptyWidget
                  : (passwordsController.hasCapitalletter.isTrue)
                      ? passwordRequirement(
                          'At least ${passwordsController.minimumUpperCaseCount} uppercase letter',
                          Icons.check,
                          const Color(0xff4CA758),
                          passwordsController)
                      : passwordRequirement(
                          'At least ${passwordsController.minimumUpperCaseCount} uppercase letter',
                          widget.passwordControl.text == ''
                              ? Icons.circle_outlined
                              : Icons.close,
                          widget.passwordControl.text == ''
                              ? Colors.grey
                              : Colors.red,
                          passwordsController,
                        );
            },
          ),
          Obx(
            () {
              int? lowerCase = widget.policy?.lowerCase;
              if (widget.policy?.lowerCase != null) {
                passwordsController.minimumLowerCaseCount(lowerCase);
              }
              return passwordsController.minimumLowerCaseCount.value == 0
                  ? DsUtils.emptyWidget
                  : passwordsController.hasLowercase.isTrue
                      ? passwordRequirement(
                          'At least ${passwordsController.minimumLowerCaseCount} lowercase letter',
                          Icons.check,
                          const Color(0xff4CA758),
                          passwordsController)
                      : passwordRequirement(
                          'At least ${passwordsController.minimumLowerCaseCount} lowercase letter',
                          widget.passwordControl.text == ''
                              ? Icons.circle_outlined
                              : Icons.close,
                          widget.passwordControl.text == ''
                              ? Colors.grey
                              : Colors.red,
                          passwordsController,
                        );
            },
          ),
          Obx(
            () {
              int? digits = widget.policy?.digits;
              if (widget.policy?.digits != null) {
                passwordsController.minimumNumberCount(digits);
              }
              return passwordsController.minimumNumberCount.value == 0
                  ? DsUtils.emptyWidget
                  : passwordsController.hasNumber.isTrue
                      ? passwordRequirement(
                          'At least ${passwordsController.minimumNumberCount} number',
                          Icons.check,
                          const Color(0xff4CA758),
                          passwordsController)
                      : passwordRequirement(
                          'At least ${passwordsController.minimumNumberCount} number',
                          widget.passwordControl.text == ''
                              ? Icons.circle_outlined
                              : Icons.close,
                          widget.passwordControl.text == ''
                              ? Colors.grey
                              : Colors.red,
                          passwordsController,
                        );
            },
          ),
          Obx(
            () {
              int? specialChars = widget.policy?.specialChars;
              if (widget.policy?.specialChars != null) {
                passwordsController.minimumSpecialCharCount(specialChars);
              }
              return passwordsController.minimumSpecialCharCount.value == 0
                  ? DsUtils.emptyWidget
                  : passwordsController.hasSpecialChar.isTrue
                      ? passwordRequirement(
                          'At least ${passwordsController.minimumSpecialCharCount} special character (e.g. !@#\$%)',
                          Icons.check,
                          const Color(0xff4CA758),
                          passwordsController)
                      : passwordRequirement(
                          'At least ${passwordsController.minimumSpecialCharCount} special character (e.g. !@#\$%)',
                          widget.passwordControl.text == ''
                              ? Icons.circle_outlined
                              : Icons.close,
                          widget.passwordControl.text == ''
                              ? Colors.grey
                              : Colors.red,
                          passwordsController,
                        );
            },
          ),
          const SizedBox(height: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => AppTextInput(
                  isObscured: passwordsController.isObscure.value,
                  // disableHoverEffects: true,
                  onChange: (confirmPassword) {
                    passwordsController
                        .onConfirmPasswordChange(confirmPassword);
                    setState(() {
                      widget.confirmPasswordControl.text = confirmPassword;
                    });
                  },
                  controller: passwordsController.confirmPasswordController,
                  keyboardType: TextInputType.text,
                  autoValidateMode: AutovalidateMode.disabled,
                  isPassword: true,
                  inputLabel: widget.confirmPasswordLabel,
                  hintText: 'Please confirm new password',
                  isRequired: true,
                  focusNode: confirmPasswordFocus_,
                  onDone: () => widget.onComplete!(),
                  customValidator: (value) {
                    // if (value != '') {
                    //   return "This field is required";
                    // }
                    if (passwordsController.passwordDoesMatch.isFalse) {
                      return "Password does not match";
                    }

                    return null;
                  },
                ),
              ),
            ],
          ),
          Obx(
            () => passwordsController.passwordDoesMatch.isTrue
                ? confirmPasswordRequirement('Password matches', Icons.check,
                    const Color(0xff4CA758), passwordsController)
                : confirmPasswordRequirement(
                    'Password does not match',
                    widget.passwordControl.text == ''
                        ? Icons.circle_outlined
                        : Icons.close,
                    widget.passwordControl.text == ''
                        ? Colors.grey
                        : Colors.red,
                    passwordsController,
                  ),
          ),
          const SizedBox(height: 38),
        ],
      ),
    );
  }

  Widget passwordRequirement(
    String description,
    IconData icon,
    Color color,
    BasePasswordsController passwordsController,
  ) {
    return Obx(
      () => AnimatedOpacity(
        opacity:
            passwordsController.showPasswordRequirements.isTrue ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: Visibility(
          visible: passwordsController.showPasswordRequirements.isTrue,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 14,
                ),
                const SizedBox(width: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF505256),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget confirmPasswordRequirement(
    String description,
    IconData icon,
    Color color,
    BasePasswordsController passwordsController,
  ) {
    return Obx(
      () => AnimatedOpacity(
        opacity: passwordsController.showConfirmPasswordRequirements.isTrue
            ? 1.0
            : 0.0,
        duration: const Duration(milliseconds: 200),
        child: Visibility(
          visible: passwordsController.showConfirmPasswordRequirements.isTrue,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 14,
                ),
                const SizedBox(width: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF505256),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
