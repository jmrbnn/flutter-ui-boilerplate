import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_login_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OAuthExceptionScreen extends ConsumerStatefulWidget {
  const OAuthExceptionScreen({super.key});

  @override
  ConsumerState<OAuthExceptionScreen> createState() =>
      _OAuthExceptionScreenState();
}

class _OAuthExceptionScreenState extends ConsumerState<OAuthExceptionScreen> {
  String? error;
  String? errorMessage;
  String? redirectUrl;
  String? clientId;

  @override
  void initState() {
    super.initState();

    Map params = getUriParameters();
    error = Uri.decodeFull(params['error'] ?? '');
    errorMessage = Uri.decodeFull(params['errorMessage'] ?? '');
    redirectUrl = Uri.decodeFull(params['redirectUrl'] ?? '');
    clientId = Uri.decodeFull(params['clientId'] ?? '');

    // if (params['exception'] != '') {
    //   String? base64Client = params['exception'];
    //   if (base64Client != '' && base64Client.runtimeType == String) {
    //     List<String> clientDetails =
    //         utf8.decode(base64.decode(base64Client)).toString().split(':');

    //     setState(() {
    //       appName = clientDetails[1];
    //       clientId = clientDetails[0];
    //     });

    if (clientId != '') {
      Future.delayed(const Duration(microseconds: 100), () {
        DsUtils.changeThemeData(ref, clientId ?? '');
      });
    }
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return FormLayout(
        isScrollable: constraints.maxHeight < 500,
        child: Transform.translate(
          offset: Offset(0, constraints.maxHeight * 0.01),
          child: SizedBox(
            width: (constraints.maxWidth < 500 ? constraints.maxWidth : 500),
            child: Column(
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
                  'Oops, something went wrong',
                  style:
                      TypeUtil(context: context, weight: FontWeight.w600).h2(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  errorMessage != ''
                      ? errorMessage ?? ''
                      : 'Yikes, looks like something went wrong on our end. If the issue persists, please shoot us a note so we can help out',
                  style: TypeUtil(context: context).h5(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Visibility(
                  visible: redirectUrl != '',
                  child: Countdown(
                    seconds: 10,
                    onFinished: () => _redirect(),
                    build: (BuildContext context, double time) {
                      return Column(
                        children: [
                          AppButton(
                            width: 350,
                            labelText: 'Go home',
                            onPressed: () async {
                              _redirect();
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
                    // onFinished: () {
                    //   print('Timer is done!');
                    // },
                  ),
                ),
                const SizedBox(height: 24),
                Visibility(
                  visible: error != '',
                  child: Text(
                    'HTTP CODE $error',
                    style: TypeUtil(context: context, weight: FontWeight.w600)
                        .small(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  _redirect() async {
    if (redirectUrl != '') {
      await launchUrlString(
        redirectUrl ?? '',
        mode: LaunchMode.inAppWebView,
        webOnlyWindowName: '_self',
      );
    }
  }
}
