import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/oauth/oauth_mfa_response_model.dart';
import 'package:emp_ai_ds/utils/color_utils.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/app_card.dart';
import 'package:emp_ai_ds/widgets/app_modal.dart';
import 'package:emp_ai_ds/widgets/app_text_input.dart';
import 'package:emp_ai_auth/features/forgot-password/presentation/providers/forgot_password_provider.dart';
import 'package:emp_ai_auth/features/forgot-password/presentation/providers/state/forgot_password_state.dart';
import 'package:emp_ai_auth/features/forgot-password/presentation/widgets/password_recovery_input_code.dart';
import 'package:emp_ai_auth/features/forgot-password/presentation/widgets/password_recovery_input_passwords.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PasswordRecoveryApp extends ConsumerStatefulWidget {
  final Function? onSuccess;
  final String? predefinedUsername;
  final String? redirectUrl;
  final bool isExpiredPassword;
  final OAuthMfaResponse? loggedIn;
  const PasswordRecoveryApp({
    super.key,
    this.onSuccess,
    this.predefinedUsername,
    this.redirectUrl,
    this.isExpiredPassword = true,
    this.loggedIn,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordRecoveryAppState();
}

class _PasswordRecoveryAppState extends ConsumerState<PasswordRecoveryApp> {
  final recoveryLinkForm = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  bool isConfirming = false;
  bool isProcessing = false;
  String? errorText;

  FocusNode emailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(forgotPasswordProvider);

    if (widget.predefinedUsername != null &&
        widget.predefinedUsername is String) {
      usernameController.text = widget.predefinedUsername as String;
    }

    ref.listen(
      forgotPasswordProvider.select((value) => value),
      ((previous, next) {
        if (next is Failure) {
          DsUtils.showSnackBar(context, next.exception.message.toString(),
              type: SnackBarTypes.error);
        } else if (next is Idle) {
          if (next.exception != null) {
            setState(() {
              errorText = next.exception?.message;

              isProcessing = false;
            });
          } else {
            setState(() {
              isProcessing = false;
            });
            usernameController.clear();
          }
        } else if (next is InputCode) {
          if (next.exception != null) {
            setState(() {
              errorText = next.exception?.message;
            });
          }
        } else if (next is InputPasswords) {
          if (next.exception != null) {
            setState(() {
              errorText = next.exception?.message;
            });
          }
        } else if (next is Success) {
          _reset();
        }
      }),
    );

    return Form(
      key: recoveryLinkForm,
      child: AppCard(
        padding: GeneralUtils.checkIfMobileBrowser(context)
            ? EdgeInsets.zero
            : const EdgeInsets.all(24),
        margin: DsUtils.themeConfiguration(ref).setupMfaHeader != null
            ? const EdgeInsets.symmetric(vertical: 48)
            : const EdgeInsets.symmetric(vertical: 24),
        borderRadiusGeometry: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(4),
          bottomLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
        hasShadow:
            DsUtils.themeConfiguration(ref).resetPasswordHeader == null &&
                !GeneralUtils.checkIfMobileBrowser(context),
        content: state.mapOrNull(
            inputPasswords: (e) => PasswordRecoveryInputPasswords(
                  code: e.code,
                  username: e.username,
                ),
            inputCode: (e) => PasswordRecoveryInputCode(
                  username: e.username,
                ),
            processing: (value) => const CircularProgressIndicator(),
            success: (e) => Countdown(
                  seconds: 10,
                  onFinished: _onRedirect,
                  build: (BuildContext context, double time) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 200,
                          width: 200,
                          child: RiveAnimation.asset(
                            'assets/rive/error_success.riv',
                            fit: BoxFit.cover,
                            animations: [
                              'Check',
                            ],
                          ),
                        ),
                        Text(
                          'Password changed successfully!',
                          textAlign: TextAlign.center,
                          style: TypeUtil(
                                  context: context,
                                  weight: FontWeight.w600,
                                  fontFamily: DsUtils.themeConfiguration(ref)
                                      .fontFamily)
                              .h4(),
                        ),
                        const SizedBox(height: 32),
                        AppButton(
                          width: 350,
                          labelText: 'Try logging in',
                          onPressed: _onRedirect,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'You will be automatically redirected in ${time.toString()} seconds ',
                          style: TypeUtil(context: context).xsmall(),
                        )
                      ],
                    );
                  },
                ),
            idle: (e) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DsUtils.themeConfiguration(ref).resetPasswordHeader ??
                        Column(
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
                              widget.predefinedUsername != null
                                  ? 'Hi ${widget.predefinedUsername}, ${widget.isExpiredPassword ? 'your password has expired.' : ''}'
                                  : 'Reset your password',
                              textAlign: TextAlign.left,
                              style: TypeUtil(
                                context: context,
                                weight: FontWeight.w700,
                                fontFamily:
                                    DsUtils.themeConfiguration(ref).fontFamily,
                              ).h4(),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.predefinedUsername != null
                                  ? 'We\'ll send you an email with instructions to reset your password.'
                                  : 'Enter your username and we\'ll send you an email with instructions to reset your password.',
                              textAlign: TextAlign.left,
                              style: TypeUtil(
                                context: context,
                                fontFamily: DsUtils.themeConfiguration(ref)
                                    .fontFamilyAlt,
                              ).small(),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                    Visibility(
                      visible: widget.predefinedUsername == null,
                      child: Column(
                        children: [
                          AppTextInput(
                            inputLabel: 'Username',
                            isRequired: true,

                            hintText: 'Please input your username',
                            // focusNode: emailFocus,
                            disabled: widget.predefinedUsername != null ||
                                isProcessing ||
                                ref.watch(forgotPasswordProvider) ==
                                    const ForgotPasswordState.processing(),
                            errorText: errorText,
                            onChange: (e) {
                              setState(() {
                                errorText = null;
                              });
                            },
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            // customValidator: (val) {
                            //   return DsUtils.validateEmail(val);
                            // },
                            // onDone: () => widget.predefinedUsername != null
                            //     ? _sendRecoveryEmail()
                            //     : _confirmSendRecoveryLink(),
                            controller: usernameController,
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                    AppButton(
                      labelText: widget.predefinedUsername != null
                          ? 'Send change password link'
                          : 'Send reset link',
                      isBlock: true,
                      isDisabled: isProcessing,
                      onPressed: () => widget.predefinedUsername != null
                          ? _sendRecoveryEmail()
                          : _confirmSendRecoveryLink(
                              mustConfirm: DsUtils.themeConfiguration(ref)
                                  .confirmModalsInAuth,
                            ),
                    ),
                    const SizedBox(height: 16),
                    Visibility(
                      visible: widget.predefinedUsername != null,
                      child: Wrap(
                        spacing: 3,
                        children: [
                          Text('Not you?',
                              style: TypeUtil(
                                context: context,
                                fontFamily: DsUtils.themeConfiguration(ref)
                                    .fontFamilyAlt,
                              ).small()),
                          GestureDetector(
                            onTap: () => launchUrlString(
                              'https://emp-identity-management.playground.emaptagtsrnd.xyz/#/recover-password',
                              mode: LaunchMode.inAppWebView,
                              webOnlyWindowName: '_self',
                            ),
                            child: Text('Click here',
                                style: TypeUtil(
                                  context: context,
                                  weight: FontWeight.w700,
                                  fontFamily: DsUtils.themeConfiguration(ref)
                                      .fontFamilyAlt,
                                ).small()),
                          )
                        ],
                      ),
                    ),
                    DsUtils.themeConfiguration(ref).resetPasswordFooter ??
                        Column(
                          children: [
                            const SizedBox(height: 24),
                            RichText(
                                text: TextSpan(
                                    text:
                                        'If you don\'t receive an email from us within a few minutes, check your spam filter as it sometimes end up in there. The email will be from ',
                                    children: [
                                      TextSpan(
                                          text: 'no-reply@emapta.com',
                                          style: TypeUtil(
                                            context: context,
                                            color: DsUtils.color(
                                                context, ColorSets.neutral,
                                                variant: 50),
                                            weight: FontWeight.w700,
                                            fontFamily:
                                                DsUtils.themeConfiguration(ref)
                                                    .fontFamilyAlt,
                                          ).xsmall()),
                                    ],
                                    style: TypeUtil(
                                      context: context,
                                      color: DsUtils.color(
                                          context, ColorSets.neutral,
                                          variant: 50),
                                      fontFamily:
                                          DsUtils.themeConfiguration(ref)
                                              .fontFamilyAlt,
                                    ).xsmall()))
                          ],
                        ),
                  ],
                )),
      ),
    );
  }

  _confirmSendRecoveryLink({bool mustConfirm = true}) {
    setState(() {
      isConfirming = true;
    });
    if (recoveryLinkForm.currentState!.validate()) {
      double width_ = 600;
      if (mustConfirm) {
        AppModal(
            width: width_,
            barrierDismissible: false,
            onDismiss: () => setState(() {
                  isConfirming = false;
                }),
            header: Text(
              'SEND RECOVERY LINK',
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
                          'Send recovery link',
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
                          'We\'ll send the link to the email associated with this username. Do you want to proceed?',
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
                    labelText: 'Send email',
                    onPressed: () => _sendRecoveryEmail(),
                  )
                ],
              ),
            )).toggleDialogModal(context);
      } else {
        _sendRecoveryEmail();
      }
    }
  }

  void _onRedirect() {
    if (widget.onSuccess != null) {
      widget.onSuccess!();
    } else {
      widget.redirectUrl != null
          ? launchUrlString(
              widget.redirectUrl ?? '',
              mode: LaunchMode.platformDefault,
              webOnlyWindowName: '_self',
            )
          : widget.loggedIn != null && widget.loggedIn?.url != null
              ? launchUrlString(
                  widget.loggedIn?.url ?? '',
                  mode: LaunchMode.platformDefault,
                  webOnlyWindowName: '_self',
                )
              : widget.onSuccess != null
                  ? widget.onSuccess!()
                  : null;
    }
  }

  void _reset() {
    usernameController.clear();
  }

  void _sendRecoveryEmail() {
    if (isConfirming) {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    }

    setState(() {
      isProcessing = true;
    });
    ref
        .read(forgotPasswordProvider.notifier)
        .forgotPassword(usernameController.text, (response) {
      DsUtils.showSnackBar(
          response.data['result']['message'], 'Password updated successfully!',
          type: SnackBarTypes.success);
    });
  }
}
