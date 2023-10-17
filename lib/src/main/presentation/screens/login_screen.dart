// ignore_for_file: avoid_print, avoid_web_libraries_in_flutter, use_build_context_synchronously

import 'dart:async';

import 'package:emp_ai_auth/core/shared/domain/providers/keycloak/keycloak_config.dart';
import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/state/auth_state.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/app_card.dart';
import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:emp_ai_auth/features/auth/shared/auth_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// import 'dart:html' as html;
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher_string.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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
    ref.listen(
      authNotifierProvider.select((value) => value),
      ((previous, next) {
        // if (next is Authenticated) {
        //   DsUtils.showSnackBar(context, 'sas');
        // }
      }),
    );

    return LayoutBuilder(builder: (context, constraints) {
      final state = ref.watch(authNotifierProvider);
      return FormLayout(
        isScrollable: constraints.maxHeight < 900,
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                // color: MediaQuery.of(context).size.width < 1400
                //     ? null
                //     : DsUtils.color(context, ColorSets.primary, variant: 10),
                // image: MediaQuery.of(context).size.width < 1400
                //     ? null
                //     : const DecorationImage(
                //         image: NetworkImage(
                //             'https://emapta.com/wp-content/uploads/2021/03/IMG_1303.jpg'),
                //         fit: BoxFit.cover,
                //       ),
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

                              // 'https://emapta.com/wp-content/uploads/2021/03/IMG_1303.jpg',
                            ),
                          ),
                          // child: Center(
                          //     child: DsUtils.loadSvgFile(
                          //   path:
                          //       'assets/images/svg/emapta-outsourcing-reimagined.svg',
                          //   package: 'emp_ai_ds',
                          //   width: 100,
                          //   height: 100,
                          // )),
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
                          width: 450,
                          content: Column(
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
                              const SizedBox(height: 8),
                              Text(
                                'Hello, I\'m Emapta\'s Chatbot!',
                                textAlign: TextAlign.left,
                                style: TypeUtil(
                                  context: context,
                                  weight: FontWeight.w700,
                                  fontFamily: DsUtils.themeConfiguration(ref)
                                      .fontFamily,
                                ).h4(),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Please sign in to continue',
                                textAlign: TextAlign.left,
                                style: TypeUtil(
                                  context: context,
                                  fontFamily: DsUtils.themeConfiguration(ref)
                                      .fontFamilyAlt,
                                ).body(),
                              ),
                              const SizedBox(height: 8),
                              const Divider(),
                              const SizedBox(height: 24),
                              AppButton(
                                label: state.maybeMap(
                                    authorizing: (e) => SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary
                                                .withOpacity(.5),
                                            strokeWidth: 2.5,
                                          ),
                                        ),
                                    orElse: () => Text(
                                          'Sign in via Emapta Account',
                                          style: TypeUtil(
                                                  context: context,
                                                  weight: FontWeight.w600,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary)
                                              .small(),
                                        )),
                                customColor:
                                    Theme.of(context).colorScheme.primary,
                                isBlock: true,
                                isDisabled:
                                    state == const AuthState.authorizing(),
                                margin: const EdgeInsets.all(5),
                                onPressed: () async {
                                  _signIn(context);
                                },
                              ),
                              AppButton(
                                label: state.maybeMap(
                                    authorizing: (e) => SizedBox(
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
                                    orElse: () => Text(
                                          'Sign in via MyEmapta Account',
                                          style: TypeUtil(
                                                  context: context,
                                                  weight: FontWeight.w600)
                                              .small(),
                                        )),
                                type: AppButtonTypes.outline,
                                customColor:
                                    Theme.of(context).colorScheme.primary,
                                isBlock: true,
                                isDisabled:
                                    state == const AuthState.authorizing(),
                                margin: const EdgeInsets.all(5),
                                onPressed: () async {
                                  _signWithMFA(context);
                                },
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
    Uri authorizationUrl = await EmpAuth().getAuthorization!(ref,
        customConfig: KeycloakConfig(keyCloakClientId: 'EMAPTA'));
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
        spawnPopup(context, authorizationUrl, (redirectedUrl) {
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

    // Future.delayed(const Duration(seconds: 1), () async {
    // });
    // await ref.read(authNotifierProvider.notifier).signIn(
    //       authorizationCallback: (authorizationUrl) async {
    //         final completer = Completer<Uri>();

    //         spawnPopup(context, authorizationUrl, (redirectedUrl) {
    //           completer.complete(redirectedUrl);
    //         });

    //         return completer.future;
    //       },
    //       onSuccess: (e) {
    //         // GoRouter.of(context).push(Routes.home.url);
    //       },
    //       customKeycloakConfig: KeycloakConfig(
    //         keyCloakClientId: 'EMAPTA',
    //         // keycloakAuthenticationUrl: 'http://localhost:3002/auth',
    //         // keycloakUserUrl: 'http://localhost:3001/user',
    //       ),
    //     );
  }

  _signWithMFA(BuildContext context) async {
    // Get authorization url
    Uri authorizationUrl = await EmpAuth().getAuthorization!(ref,
        customConfig: KeycloakConfig(keyCloakClientId: 'EMAPTA-MYEMAPTA'));
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
        spawnPopup(context, authorizationUrl, (redirectedUrl) {
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
    // await ref.read(authNotifierProvider.notifier).signIn(
    //       authorizationCallback: (authorizationUrl) async {
    //         final completer = Completer<Uri>();

    //         spawnPopup(context, authorizationUrl, (redirectedUrl) {
    //           completer.complete(redirectedUrl);
    //         });

    //         return completer.future;
    //       },
    //       onSuccess: (e) {
    //         // GoRouter.of(context).push(Routes.home.url);
    //       },
    //       customKeycloakConfig: KeycloakConfig(
    //         keyCloakClientId: 'EMAPTA-MYEMAPTA',
    //         // keycloakAuthenticationUrl: 'http://localhost:3002/auth',
    //         // keycloakUserUrl: 'http://localhost:3001/user',
    //       ),
    //     );
  }

  spawnPopup(
    BuildContext context,
    Uri url,
    Function(dynamic) onRedirectAttempt,
  ) {
    const features = {
      "popup": "yes",
      "width": 450,
      "height": 750,
      "top": "auto",
      "left": "auto",
      "toolbar": "no",
      "menubar": "no",
    };

    final windowFeatures = generateWindowFeatures(features, context);
    url.toString();
    html.WindowBase popup =
        html.window.open(url.toString(), 'sample', windowFeatures);
    if (popup.closed!) {
      throw ("Popups blocked");
    }

    html.window.addEventListener("message", (event) {
      return receiveMessage(
        event,
        onReceive: onRedirectAttempt,
      );
    }, false);
    html.window.onMessage.listen((event) {
      receiveMessage(
        event,
        onReceive: onRedirectAttempt,
      );
    });
  }

  receiveMessage(event, {onReceive}) {
    if (event.data == 'AUTH_REQUEST_FLOW_ABORTED') {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text('Authentication flow aborted')));
    } else {
      onReceive(Uri.parse('${event.data}'));

      // messageSubscription?.cancel();
    }
  }

  String generateWindowFeatures(
      Map<String, dynamic> features, BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    String strWindowsFeatures = features.entries.map((entry) {
      final key = entry.key;
      final value = entry.value;

      if (value == "auto") {
        if (key == "top") {
          final v =
              ((screenSize.height / 2) - (features['height'] / 2)).round();
          return 'top=$v,';
        } else if (key == "left") {
          final v = ((screenSize.width / 2) - (features['width'] / 2)).round();
          return 'left=$v,';
        }
      }

      return '$key=$value,';
    }).join();

    // Remove the trailing comma
    return strWindowsFeatures.substring(0, strWindowsFeatures.length - 1);
  }
}
