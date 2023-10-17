// ignore_for_file: avoid_web_libraries_in_flutter, non_constant_identifier_names

import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/core/shared/utils/oauth_utils.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/state/auth_state.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_login_providers.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_state.dart';
import 'package:emp_ai_auth/features/auth/presentation/widgets/setup_mfa.dart';
import 'package:emp_ai_auth/features/auth/shared/auth_providers.dart';
import 'package:emp_ai_auth/features/forgot-password/presentation/widgets/password_recovery_app.dart';
import 'package:emp_ai_ds/constants/themes/default/default_theme.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/app_card.dart';
import 'package:emp_ai_ds/widgets/app_text_input.dart';
import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

import 'package:universal_html/html.dart' as html;

import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OAuthLoginScreen extends ConsumerStatefulWidget {
  final bool formOnly;
  final bool isDense;
  const OAuthLoginScreen({
    super.key,
    this.formOnly = false,
    this.isDense = true,
  });
  @override
  ConsumerState<OAuthLoginScreen> createState() => _OAuthLoginScreenState();
}

class _OAuthLoginScreenState extends ConsumerState<OAuthLoginScreen> {
  bool promptUpdatePassword = false;
  bool successResetPassword = false;
  bool hasLoginError = false;
  String? authErrorMessage;
  String invokeCloseEvent = 'AUTH_REQUEST_FLOW_ABORTED';

  String MFA_VALIDATE_URL = '/validate-mfa';
  String MFA_SETUP_URL = '/set-mfa';
  String RECOVER_PASSWORD = '/recover-password';

  @override
  void initState() {
    super.initState();

    html.window.addEventListener("beforeunload", (e) {
      html.window.opener?.postMessage(invokeCloseEvent, '*');
    }, false);
  }

  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  TextEditingController pinCodeController = TextEditingController();

  final loginForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(oAuthStateNotifierProvider);

    FocusNode usernameFocus = FocusNode();
    FocusNode passwordFocus = FocusNode();
    // var globalVariables = ref.watch(globalAppVariablesProvider);

    Map params = getUriParameters();
    if (params.containsKey('error')) {
      state = OAuthState.error(params['error'], params['errorMessage']);
    }

    ref.listen(
      oAuthStateNotifierProvider.select((value) => value),
      ((previous, next) async {
        //show Snackbar on failure
        if (next is Redirect) {
          launchUrlString(
            next.url,
            mode: LaunchMode.inAppWebView,
            webOnlyWindowName: '_self',
          );
        } else if (next is Failure) {
          setState(() {
            hasLoginError = true;
            authErrorMessage =
                next.exception.message == 'Invalid user credentials'
                    ? 'Invalid username and/or password'
                    : next.exception.message ?? 'Unknown error occured';
          });
        } else if (next is SetupMfa) {
          launchUrlString(
            '${Uri.base.origin}/#$MFA_SETUP_URL?totpUrl=${OAuthUtils.stringToBase64Encode(next.qr)}',
            mode: LaunchMode.inAppWebView,
            webOnlyWindowName: '_self',
          );
        } else if (next is AskTOTP) {
          launchUrlString(
            '${Uri.base.origin}/#$MFA_VALIDATE_URL',
            mode: LaunchMode.inAppWebView,
            webOnlyWindowName: '_self',
          );
        } else if (next is PromptUpdatePassword) {
          setState(() {
            promptUpdatePassword = true;
          });
        } else if (next is Success) {
          setState(() {
            invokeCloseEvent = next.data.toString();
          });
          Future.delayed(const Duration(seconds: 3), () {
            html.window.close();
          });

          // GoRouter.of(context).go(Routes.dashboard.url);
        }
      }),
    );
    ref.listen(
      authNotifierProvider.select((value) => value),
      ((previous, next) {
        //show Snackbar on failure
        if (next is Failed) {
          if (next.failure != null) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(next.failure!.message.toString())));
          }
        } else if (next is Success) {
          //   // setState(() {
          //   //   invokeCloseEvent = next.data.toString();
          //   // });
          //   // Future.delayed(const Duration(seconds: 3), () {
          //   //   html.window.close();
          //   // });

          //   // // GoRouter.of(context).go(Routes.dashboard.url);
        }
      }),
    );

    Widget form = AppCard(
      hasShadow: !widget.formOnly && !widget.isDense,
      borderRadiusGeometry: widget.formOnly || widget.isDense
          ? null
          : const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
      content: Column(
        children: [
          widget.formOnly || widget.isDense
              ? DsUtils.emptyWidget
              : Column(
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
                    const SizedBox(height: 24)
                  ],
                ),
          widget.formOnly || widget.isDense
              ? DsUtils.emptyWidget
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    children: [
                      Text(
                        'Welcome back!',
                        style: TypeUtil(
                          context: context,
                          weight: FontWeight.w700,
                          fontFamily:
                              DsUtils.themeConfiguration(ref).fontFamily,
                        ).h4(),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Please sign in to continue.',
                        style: TypeUtil(
                          context: context,
                        ).small(),
                      ),
                    ],
                  ),
                ),
          Visibility(
            visible: DsUtils.themeConfiguration(ref).loginHeader != null,
            child: DsUtils.themeConfiguration(ref).loginHeader ??
                DsUtils.emptyWidget,
          ),
          Visibility(
              visible: authErrorMessage != null,
              child: Container(
                width: 350,
                margin: const EdgeInsets.only(bottom: 24),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$authErrorMessage',
                      style: TypeUtil(
                        fontFamily: 'Inter',
                        color: Theme.of(context).colorScheme.onBackground,
                      ).small(),
                    ),
                    Transform.rotate(
                        angle: 95,
                        child: Icon(
                          Icons.add_circle_outline_rounded,
                          color: Theme.of(context).colorScheme.error,
                        ))
                  ],
                ),
              )),
          Form(
            key: loginForm,
            child: FocusTraversalGroup(
              policy: OrderedTraversalPolicy(),
              child: Column(
                children: [
                  AppTextInput(
                    // width: 300,
                    hintText: 'Username',
                    customIconColor:
                        DsUtils.themeConfiguration(ref).textInputIconColor,

                    disabled: state is Loading,
                    controller: usernameController,
                    isRequired: true,
                    prefix: const Icon(UniconsLine.user),
                    onDone: () => passwordFocus.requestFocus(),
                    status: hasLoginError
                        ? AppInputStatus.error
                        : AppInputStatus.idle,
                    onChange: (e) => {
                      setState(() {
                        hasLoginError = false;
                        authErrorMessage = null;
                      })
                    },
                    focusNode: usernameFocus,
                  ),
                  AppTextInput(
                    // width: 300,
                    labelText: 'Password',
                    hintText: 'Password',
                    customIconColor:
                        DsUtils.themeConfiguration(ref).textInputIconColor,
                    disabled: state is Loading,
                    controller: passwordController,
                    isPassword: true,
                    isRequired: true,
                    prefix: const Icon(UniconsLine.lock_alt),
                    onDone: () => _login(),
                    status: hasLoginError
                        ? AppInputStatus.error
                        : AppInputStatus.idle,
                    onChange: (e) => {
                      setState(() {
                        hasLoginError = false;
                        authErrorMessage = null;
                      })
                    },
                    focusNode: passwordFocus,
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      children: [
                        GestureDetector(
                          onTap: () => GoRouter.of(context).goNamed(
                            RECOVER_PASSWORD,
                            extra: Uri.base.toString(),
                          ),
                          child: Text(
                            'Forgot your password?',
                            style: TypeUtil(
                              context: context,
                              weight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                              fontFamily: config_.fontFamilyAlt,
                            ).small(),
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  state.maybeMap(
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
                        usernameFocus.unfocus();
                        passwordFocus.unfocus();
                        _login();
                      },
                      labelText:
                          DsUtils.themeConfiguration(ref).loginButtonText ??
                              'Login',
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
          ),
          Visibility(
            visible: DsUtils.themeConfiguration(ref).loginFooter != null,
            child: DsUtils.themeConfiguration(ref).loginFooter ??
                DsUtils.emptyWidget,
          ),
        ],
      ),
    );
    return widget.formOnly
        ? form
        : LayoutBuilder(builder: (context, constraints) {
            return FormLayout(
              isScrollable: constraints.maxHeight < 500,
              isVerticallyCentered: !GeneralUtils.checkIfMobileBrowser(context),
              child: Transform.translate(
                offset: Offset(0, constraints.maxHeight * 0.01),
                child: state.maybeMap(
                    passwordExpired: (e) {
                      return PasswordRecoveryApp(
                        onSuccess: () => html.window.close(),
                        predefinedUsername: usernameController.text,
                      );
                    },
                    changePassword: (e) {
                      return PasswordRecoveryApp(
                        onSuccess: () => launchUrlString(
                          e.response.url,
                          mode: LaunchMode.inAppWebView,
                          webOnlyWindowName: '_self',
                        ),
                        loggedIn: e.response,
                        predefinedUsername: usernameController.text,
                      );
                    },
                    promptUpdatePassword: (value) {
                      return AppCard(
                        borderRadiusGeometry: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 24),
                            Text(
                              'Time to change your password',
                              textAlign: TextAlign.center,
                              style: TypeUtil(
                                context: context,
                                weight: FontWeight.w700,
                                fontFamily:
                                    DsUtils.themeConfiguration(ref).fontFamily,
                              ).h4(),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Your password will expire in ${value.response.passwordExpiryDays ?? 0} day${(value.response.passwordExpiryDays ?? 0) > 1 ? 's' : ''}',
                              textAlign: TextAlign.center,
                              style: TypeUtil(
                                context: context,
                                fontFamily: DsUtils.themeConfiguration(ref)
                                    .fontFamilyAlt,
                              ).small(),
                            ),
                            const SizedBox(height: 24),
                            AppButton(
                              labelText: 'Update password now',
                              isBlock: true,
                              onPressed: () => ref
                                  .watch(oAuthStateNotifierProvider.notifier)
                                  .initChangePassword(
                                    username: usernameController.text,
                                    response: value.response,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            AppButton(
                                labelText: 'Waive password change',
                                isBlock: true,
                                type: AppButtonTypes.outline,
                                customColor:
                                    Theme.of(context).colorScheme.primary,
                                onPressed: () => launchUrlString(
                                      value.response.url,
                                      mode: LaunchMode.inAppWebView,
                                      webOnlyWindowName: '_self',
                                    )),
                            const SizedBox(height: 24),
                          ],
                        ),
                      );
                    },
                    setupMFA: (
                      setup,
                    ) {
                      Map qrDetails =
                          Uri.dataFromString(setup.qr ?? '').queryParameters;
                      return SetupMfaApp(
                        secret: qrDetails['secret'] ?? '',
                        qr: setup.qr ?? '',
                        errorMessage: authErrorMessage,
                      );
                    },
                    error: (error) => Column(
                          children: [
                            const SizedBox(
                              height: 200,
                              width: 200,
                              child: RiveAnimation.asset(
                                'assets/rive/error_success.riv',
                                fit: BoxFit.cover,
                                animations: [
                                  'Err',
                                ],
                              ),
                            ),
                            Text(
                              error.statusCode.toString(),
                              style: TypeUtil(
                                      context: context, weight: FontWeight.w600)
                                  .h2(),
                            ),
                            Text(
                              Uri.decodeFull(error.message.toString()),
                              style: TypeUtil(context: context).body(),
                            ),
                          ],
                        ),
                    success: (res) => Column(
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
                              'Authentication successful!',
                              style: TypeUtil(
                                      context: context,
                                      weight: FontWeight.w600,
                                      fontFamily:
                                          DsUtils.themeConfiguration(ref)
                                              .fontFamily)
                                  .h4(),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'This window will dismiss in 3 seconds',
                              style: TypeUtil(
                                      context: context,
                                      fontFamily:
                                          DsUtils.themeConfiguration(ref)
                                              .fontFamily)
                                  .small(),
                            ),
                          ],
                        ),
                    orElse: () => form),
              ),
            );
          });
  }

  void _login() {
    if (loginForm.currentState!.validate()) {
      // validate email and password

      if (widget.formOnly) {
        ref.read(authNotifierProvider.notifier).signInViaPassword(
            username: usernameController.text,
            password: passwordController.text,
            onSuccess: () => GoRouter.of(context).go('/'));
      } else {
        ref.read(oAuthStateNotifierProvider.notifier).loginUser(
              usernameController.text,
              passwordController.text,
            );
      }
    }
  }
}
