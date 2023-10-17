import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasePasswordsController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isObscure = true.obs;
  RxBool showPasswordRequirements = false.obs;
  RxBool showConfirmPasswordRequirements = false.obs;

  RxBool hasLengthOfMinimum = false.obs;
  RxBool hasLengthOfMaximum = false.obs;
  RxBool hasCapitalletter = false.obs;
  RxBool hasMinimumCapitalletter = false.obs;
  RxBool hasLowercase = false.obs;
  RxBool hasMinimumLowercase = false.obs;
  RxBool hasNumber = false.obs;
  RxBool hasMinimumNumber = false.obs;
  RxBool hasSpecialChar = false.obs;
  RxBool hasMinimumSpecialChar = false.obs;
  RxBool passwordIsValid = false.obs;
  RxBool passwordDoesMatch = false.obs;

  RxInt minimunPasswordLength = 8.obs;
  RxInt maximumPasswordLength = 64.obs;
  RxInt minimumUpperCaseCount = 1.obs;
  RxInt minimumLowerCaseCount = 1.obs;
  RxInt minimumNumberCount = 1.obs;
  RxInt minimumSpecialCharCount = 1.obs;
  final lowerCaseRegex = RegExp(r'[a-z]');
  final numericRegex = RegExp(r'[0-9]');
  final specialCharacterRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  Timer? _debounce;

  void clearData() {
    passwordController.text = "";
    confirmPasswordController.text = "";
    showPasswordRequirements(false);
    showConfirmPasswordRequirements(false);
    isObscure(true);
    hasLengthOfMinimum(false);
    hasCapitalletter(false);
    hasMinimumCapitalletter(false);
    hasLowercase(false);
    hasMinimumLowercase(false);
    hasNumber(false);
    hasMinimumNumber(false);
    hasSpecialChar(false);
    hasMinimumSpecialChar(false);
    passwordIsValid(false);
    passwordDoesMatch(false);
  }

  onPasswordChanged(String password) {
    // passwordController.text = password;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        // (GetUtils.isLengthGreaterThan(password, 0))
        //     ? showPasswordRequirements(true)
        //     : showPasswordRequirements(false);

        (minimunPasswordLength.value == 0
                ? true
                : GetUtils.isLengthGreaterOrEqual(
                    password, minimunPasswordLength.value))
            ? hasLengthOfMinimum(true)
            : hasLengthOfMinimum(false);

        (maximumPasswordLength.value == 0
                ? true
                : GetUtils.isLengthLessOrEqual(
                    password, maximumPasswordLength.value))
            ? hasLengthOfMaximum(true)
            : hasLengthOfMaximum(false);

        (minimumUpperCaseCount.value == 0
                ? true
                : GetUtils.hasCapitalletter(password))
            ? hasCapitalletter(true)
            : hasCapitalletter(false);

        // (DsUtils.countCharactersInCase(password, CaseType.uppercase) >=
        //         minimumUpperCaseCount.value)
        //     ? hasMinimumCapitalletter(true)
        //     : hasMinimumCapitalletter(false);

        (minimumLowerCaseCount.value == 0
                ? true
                : lowerCaseRegex.hasMatch(password))
            ? hasLowercase(true)
            : hasLowercase(false);

        // (DsUtils.countCharactersInCase(password, CaseType.lowercase) >=
        //         minimumLowerCaseCount.value)
        //     ? hasMinimumLowercase(true)
        //     : hasMinimumLowercase(false);

        // (lowerCaseRegex.hasMatch(password))
        //     ? hasLowercase(true)
        //     : hasLowercase(false);

        (minimumNumberCount.value == 0 ? true : numericRegex.hasMatch(password))
            ? hasNumber(true)
            : hasNumber(false);

        (minimumSpecialCharCount.value == 0
                ? true
                : specialCharacterRegex.hasMatch(password))
            ? hasSpecialChar(true)
            : hasSpecialChar(false);

        (password == confirmPasswordController.text)
            ? passwordDoesMatch(true)
            : passwordDoesMatch(false);
      },
    );
  }

  onConfirmPasswordChange(String confirmPassword) {
    // confirmPasswordController.text = confirmPassword;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      (GetUtils.isLengthGreaterThan(confirmPassword, 0))
          ? showConfirmPasswordRequirements(true)
          : showConfirmPasswordRequirements(false);

      (confirmPassword == passwordController.text)
          ? passwordDoesMatch(true)
          : passwordDoesMatch(false);
    });
  }
}
