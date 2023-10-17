import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/state/auth_state.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_login_providers.dart';
import 'package:emp_ai_auth/features/auth/shared/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';
// import 'dart:html' as html;
import 'package:universal_html/html.dart' as html;

import 'package:rive/rive.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OAuthCallbackScreen extends ConsumerStatefulWidget {
  const OAuthCallbackScreen({super.key});
  @override
  ConsumerState<OAuthCallbackScreen> createState() =>
      _OAuthCallbackScreenState();
}

class _OAuthCallbackScreenState extends ConsumerState<OAuthCallbackScreen> {
  String invokeCloseEvent = 'AUTH_REQUEST_FLOW_ABORTED';

  Map params = getUriParameters();
  @override
  void initState() {
    super.initState();

    html.window.addEventListener("beforeunload", (e) {
      html.window.opener!.postMessage(invokeCloseEvent, '*');
    }, false);

    Future.delayed(Duration.zero, () {
      if (GeneralUtils.checkIfMobileBrowser(context) ||
          (html.window.opener == null && html.window.opener != html.window)) {
        ref.watch(authNotifierProvider.notifier).exchangeAuthCode(
              payload: params,
              onSuccess: (e) {},
              onFailure: (e) {},
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(authNotifierProvider);

    if (params.containsKey('error')) {
      state = AuthState.error(params['error'], params['errorMessage']);
    } else if (params.containsKey('state') && params.containsKey('code')) {
      setState(() {
        invokeCloseEvent = Uri.base.toString();
      });
      GeneralUtils.isolateDebug(invokeCloseEvent);
      // _exchangeAuthCodeForToken(params['state'], params['code']);
      state = const AuthState.authenticated(null);
    }

    return LayoutBuilder(builder: (context, constraints) {
      return FormLayout(
        isScrollable: constraints.maxHeight < 500,
        child: Transform.translate(
          offset: Offset(0, constraints.maxHeight * 0.01),
          child: state.maybeMap(
              authorizing: (e) => const Column(
                    children: [
                      SizedBox(
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
                    ],
                  ),
              error: (Error error) => Column(
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
                        style:
                            TypeUtil(context: context, weight: FontWeight.w600)
                                .h2(),
                      ),
                      Text(
                        Uri.decodeFull(error.message.toString()),
                        style: TypeUtil(context: context).body(),
                      ),
                    ],
                  ),
              authenticated: (res) => Countdown(
                    seconds: 10,
                    onFinished: () => onRedirect(),
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
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            'We\'re logging you in!',
                            style: TypeUtil(
                                    context: context,
                                    weight: FontWeight.w600,
                                    fontFamily: DsUtils.themeConfiguration(ref)
                                        .fontFamily)
                                .h4(),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          AppButton(
                            width: 350,
                            labelText:
                                GeneralUtils.checkIfMobileBrowser(context) ==
                                        true
                                    ? 'Redirect to home'
                                    : 'Close this window',
                            onPressed: () async {
                              onRedirect();
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'This window will be dismissed in ${time.toString()} seconds ',
                            style: TypeUtil(context: context).xsmall(),
                          )
                        ],
                      );
                    },
                  ),
              orElse: () => const SizedBox(
                    height: 200,
                    width: 200,
                    child: RiveAnimation.asset(
                      'assets/rive/error_success.riv',
                      fit: BoxFit.cover,
                      animations: [
                        'Loading',
                      ],
                    ),
                  )),
        ),
      );
    });
  }

  onRedirect() {
    if (GeneralUtils.checkIfMobileBrowser(context) == true ||
        (html.window.opener == null && html.window.opener != html.window)) {
      Uri redirect = Uri.parse(EmpAuth().redirectUrl);
      html.window.location.href = redirect.origin;
    } else {
      html.window.close();
    }
  }

  // _exchangeAuthCodeForToken(String? state, String? code) async {
  //   await ref
  //       .watch(oAuthStateNotifierProvider.notifier)
  //       .exchangeAuthCode(authState: state, authCode: code);
  // }
}
