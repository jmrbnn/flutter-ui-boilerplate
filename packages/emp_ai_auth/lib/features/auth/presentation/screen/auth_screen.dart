// ignore_for_file: avoid_print, avoid_web_libraries_in_flutter, use_build_context_synchronously

import 'dart:async';

import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/app_card.dart';
import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:emp_ai_auth/features/auth/presentation/screen/oauth_login_screen.dart';
import 'package:emp_ai_auth/features/auth/shared/auth_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// import 'dart:html' as html;
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher_string.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  StreamSubscription<html.MessageEvent>? messageSubscription;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      EmpAuth().silentLogin(ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authNotifierProvider);
    ref.listen(
      authNotifierProvider.select((value) => value),
      ((previous, next) {
        // if (next is Authenticated) {
        //   DsUtils.showSnackBar(context, 'sas');
        // }
      }),
    );

    return LayoutBuilder(builder: (context, constraints) {
      return FormLayout(
        isScrollable: constraints.maxHeight < 900,
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: [
                  MediaQuery.of(context).size.width < 1400
                      ? DsUtils.emptyWidget
                      : SizedBox(
                          width: constraints.maxWidth,
                          height: MediaQuery.of(context).size.height,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: DsUtils.loadSvgFile(
                              path: 'assets/images/svg/emapta-login-splash.svg',
                              package: 'emp_ai_ds',
                              height: MediaQuery.of(context).size.height,
                            ),
                          ),
                        ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width < 1400
                              ? 0
                              : MediaQuery.of(context).size.height * 0.25,
                        ),
                        AppCard(
                          borderRadiusGeometry: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          ),
                          // hasShadow: false,
                          padding: const EdgeInsets.all(8),
                          width: 450,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const OAuthLoginScreen(
                                formOnly: true,
                              ),
                              const SizedBox(height: 8),
                              const Divider(),
                              const SizedBox(height: 24),
                              state.maybeMap(
                                authorizing: (_) => AppButton(
                                  isDisabled: true,
                                  isBlock: true,
                                  label: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                          .withOpacity(.5),
                                      strokeWidth: 2.5,
                                    ),
                                  ),
                                  type: AppButtonTypes.outline,
                                  customColor: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(.5),
                                  margin: const EdgeInsets.all(5),
                                ),
                                orElse: () => AppButton(
                                  isBlock: true,
                                  label:
                                      Text('Sign in via ${EmpAuth().clientId}'),
                                  type: AppButtonTypes.outline,
                                  customColor:
                                      Theme.of(context).colorScheme.primary,
                                  margin: const EdgeInsets.all(5),
                                  onPressed: () => _signIn(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      );
    });
  }

  _signIn(BuildContext context) async {
    // Get authorization url
    Uri authorizationUrl = await EmpAuth().getAuthorization!(ref);
    print(authorizationUrl);

    // Render auth page
    if (kIsWeb) {
      if (Theme.of(context).platform == TargetPlatform.iOS ||
          Theme.of(context).platform == TargetPlatform.android) {
        //Redirect route
        launchUrlString(
          authorizationUrl.toString(),
          mode: LaunchMode.inAppWebView,
          webOnlyWindowName: '_self',
        );
      } else {
        // Working implementation in desktop web
        GeneralUtils.spawnPopup(context, authorizationUrl, (redirectedUrl) {
          Map parameters =
              Uri.dataFromString(redirectedUrl.toString()).queryParameters;
          // print(parameters);

          if (parameters.containsKey('code') &&
              parameters.containsKey('state')) {
            // Exchange auth code for token
            EmpAuth().exchangeCodeForToken!(
              ref: ref,
              payload: parameters,
              onSuccess: (e) {
                if (parameters.containsKey('willUpdatePassword')) {
                  GoRouter.of(context).go('/change-password');
                  DsUtils.showSnackBar(context, 'Please update your password');
                } else {
                  GoRouter.of(context).go('/');
                }
              },
              onFailure: (e) {
                print(e);
              },
            );
          }
        });
      }
    } else {
      // Implement flow for mobile
      throw UnimplementedError();
    }
  }
}
