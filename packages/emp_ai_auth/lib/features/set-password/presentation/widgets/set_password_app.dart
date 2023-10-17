import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_login_providers.dart';
import 'package:emp_ai_ds/entities/password_policy_model.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/app_card.dart';
import 'package:emp_ai_ds/widgets/app_passwords_field.dart';
import 'package:emp_ai_auth/features/set-password/presentation/providers/set_password_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:timer_count_down/timer_count_down.dart';

class SetPasswordApp extends ConsumerStatefulWidget {
  final String? appName;
  final String? code;
  final Function()? onRedirect;
  const SetPasswordApp({
    super.key,
    this.appName,
    this.code,
    this.onRedirect,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SetPasswordAppState();
}

class _SetPasswordAppState extends ConsumerState<SetPasswordApp> {
  final setupPasswordForm = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
    final state = ref.watch(setPasswordProvider);
    final setPasswordNotifier = ref.read(setPasswordProvider.notifier);

    return Form(
      key: setupPasswordForm,
      child: AppCard(
        hasShadow: false,
        // borderRadiusGeometry: const BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   topRight: Radius.circular(4),
        //   bottomLeft: Radius.circular(4),
        //   bottomRight: Radius.circular(4),
        // ),
        content: state.maybeMap(
          orElse: () => Column(
            children: [
              // Center(
              //   child: CircleAvatar(
              //     radius: 30,
              //     backgroundColor: Theme.of(context).colorScheme.surface,
              //     child: DsUtils.loadSvgFile(
              //       path: 'assets/images/svg/logo-emapta.svg',
              //       package: 'emp_ai_ds',
              //       width: 40,
              //       height: 40,
              //     ),
              //   ),
              // ),

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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Set your password',
                      style: TypeUtil(
                        context: context,
                        weight: FontWeight.w700,
                        fontFamily: DsUtils.themeConfiguration(ref).fontFamily,
                      ).h4(),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: [
                          const TextSpan(text: 'Please secure your account '),
                          TextSpan(
                            text: widget.appName != null ? 'for ' : '',
                            style: TypeUtil(
                                    context: context,
                                    height: 1.5,
                                    fontFamily: DsUtils.themeConfiguration(ref)
                                        .fontFamilyAlt)
                                .small(),
                          ),
                          TextSpan(
                            text: widget.appName != null
                                ? '${widget.appName} '
                                : '',
                            style: TypeUtil(
                                    context: context,
                                    weight: FontWeight.w600,
                                    height: 1.5,
                                    fontFamily: DsUtils.themeConfiguration(ref)
                                        .fontFamilyAlt)
                                .small(),
                          ),
                          const TextSpan(text: 'with a strong password'),
                        ],
                        style: TypeUtil(
                                context: context,
                                height: 1.5,
                                fontFamily: DsUtils.themeConfiguration(ref)
                                    .fontFamilyAlt)
                            .small(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              PasswordFields(
                policy: PasswordPolicy.fromJson(
                    GeneralUtils.parsePasswordPolicy(passwordPolicy)),
                setPasswordLabel: 'New password',
                passwordControl: passwordController,
                confirmPasswordLabel: 'Confirm password',
                confirmPasswordControl: confirmPasswordController,
              ),
              AppButton(
                  labelText: 'Set new password',
                  isBlock: true,
                  onPressed: () {
                    if (setupPasswordForm.currentState!.validate()) {
                      // validate email and password
                      setPasswordNotifier.setPassword(
                        passwordController.text,
                        widget.code,
                      );
                    }
                  }),
              const SizedBox(height: 24),
            ],
          ),
          checkCode: (value) => Column(
            children: [
              const Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: RiveAnimation.asset(
                    'assets/rive/error_success.riv',
                    fit: BoxFit.cover,
                    animations: [
                      'Loading',
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Text(
                      'Verifying code',
                      style: TypeUtil(
                        context: context,
                        weight: FontWeight.w700,
                        fontFamily: DsUtils.themeConfiguration(ref).fontFamily,
                      ).h4(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
          success: (value) => Column(
            children: [
              const Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: RiveAnimation.asset(
                    'assets/rive/error_success.riv',
                    fit: BoxFit.cover,
                    animations: [
                      'Check',
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Text(
                      'Password set successfully',
                      style: TypeUtil(
                        context: context,
                        weight: FontWeight.w700,
                        fontFamily: DsUtils.themeConfiguration(ref).fontFamily,
                      ).h4(),
                    ),
                    const SizedBox(height: 24),
                    Countdown(
                      seconds: 10,
                      onFinished: () => widget.onRedirect!(),
                      build: (BuildContext context, double time) {
                        return Column(
                          children: [
                            AppButton(
                              width: 350,
                              labelText: 'Go home',
                              onPressed: () async {
                                widget.onRedirect!();
                              },
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
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
          failure: (e) => Column(
            children: [
              const Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: RiveAnimation.asset(
                    'assets/rive/error_success.riv',
                    fit: BoxFit.cover,
                    animations: [
                      'Err',
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Text(
                      e.exception.message,
                      style: TypeUtil(
                        context: context,
                        weight: FontWeight.w700,
                        fontFamily: DsUtils.themeConfiguration(ref).fontFamily,
                      ).h4(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                              text:
                                  'Kindly request a new invite from your administrator '),
                          TextSpan(
                            text: widget.appName != null ? 'for ' : '',
                            style: TypeUtil(
                                    context: context,
                                    height: 1.5,
                                    fontFamily: DsUtils.themeConfiguration(ref)
                                        .fontFamilyAlt)
                                .small(),
                          ),
                          TextSpan(
                            text: widget.appName != null
                                ? '${widget.appName} '
                                : '',
                            style: TypeUtil(
                                    context: context,
                                    weight: FontWeight.w600,
                                    height: 1.5,
                                    fontFamily: DsUtils.themeConfiguration(ref)
                                        .fontFamilyAlt)
                                .small(),
                          ),
                          const TextSpan(
                              text: 'to proceed with setting up your account'),
                        ],
                        style: TypeUtil(
                                context: context,
                                height: 1.5,
                                fontFamily: DsUtils.themeConfiguration(ref)
                                    .fontFamilyAlt)
                            .small(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Countdown(
                      seconds: 10,
                      onFinished: () => widget.onRedirect!(),
                      build: (BuildContext context, double time) {
                        return Column(
                          children: [
                            AppButton(
                              width: 350,
                              labelText: 'Go home',
                              onPressed: () async {
                                widget.onRedirect!();
                              },
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
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
