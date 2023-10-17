// ignore_for_file: avoid_web_libraries_in_flutter
import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_otp_textfield.dart';
import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:emp_ai_auth/core/shared/utils/oauth_utils.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/state/auth_state.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_login_providers.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_state.dart';
import 'package:emp_ai_auth/features/auth/presentation/widgets/setup_mfa.dart';
import 'package:emp_ai_auth/features/auth/shared/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:html' as html;

import 'package:url_launcher/url_launcher_string.dart';

class OAuthSetupMFAScreen extends ConsumerStatefulWidget {
  const OAuthSetupMFAScreen({super.key});
  @override
  ConsumerState<OAuthSetupMFAScreen> createState() =>
      _OAuthSetupMFAScreenState();
}

class _OAuthSetupMFAScreenState extends ConsumerState<OAuthSetupMFAScreen> {
  String invokeCloseEvent = 'AUTH_REQUEST_FLOW_ABORTED';
  bool hasError = false;
  String? authErrorMessage;

  @override
  void initState() {
    super.initState();

    html.window.addEventListener("beforeunload", (e) {
      html.window.opener!.postMessage(invokeCloseEvent, '*');
    }, false);
  }

  final OtpFieldController otpFieldController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var state = ref.watch(oAuthStateNotifierProvider);

    Map params = getUriParameters();
    if (params.containsKey('error')) {
      state = OAuthState.error(params['error'], params['errorMessage']);
    }
    ref.listen(
      oAuthStateNotifierProvider.select((value) => value),
      ((previous, next) async {
        //show Snackbar on failure
        if (next is Redirect) {
          if (GeneralUtils.checkIfMobileBrowser(context)) {
            html.window.location.href = next.url;
            DsUtils.showSnackBar(context, next.url);
          } else {
            launchUrlString(
              next.url,
              mode: LaunchMode.inAppWebView,
              webOnlyWindowName: '_self',
            );
          }
        } else if (next is Failure) {
          setState(() {
            hasError = true;
            authErrorMessage =
                next.exception.message ?? 'Unknown error occured';
          });
          await Future.delayed(const Duration(seconds: 3), () {});
          setState(() {
            hasError = false;
            authErrorMessage = null;
          });
        } else if (next is Success) {
          setState(() {
            invokeCloseEvent = next.data.toString();
          });
          Future.delayed(const Duration(seconds: 3), () {
            html.window.close();
          });
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
        }
      }),
    );

    return LayoutBuilder(builder: (context, constraints) {
      String totp = params['totpUrl'] ?? '';
      String totpQr = OAuthUtils.base64ToStringDecode(totp);
      Map qrDetails = Uri.dataFromString(OAuthUtils.base64ToStringDecode(totp))
          .queryParameters;
      return FormLayout(
        isScrollable: constraints.maxHeight < 700,
        isVerticallyCentered: !GeneralUtils.checkIfMobileBrowser(context),
        child: Transform.translate(
          offset: Offset(0, constraints.maxHeight * 0.01),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SetupMfaApp(
                  secret: qrDetails['secret'] ?? '',
                  qr: totpQr,
                ),
                state is Loading
                    ? const CircularProgressIndicator()
                    : Visibility(
                        visible: authErrorMessage != null,
                        child: Text(
                          authErrorMessage == 'Invalid code'
                              ? 'One-time code used is invalid'
                              : authErrorMessage ??
                                  'One-time code used is invalid',
                          style: TypeUtil(
                            fontFamily: 'Inter',
                            color: Theme.of(context).colorScheme.error,
                          ).small(),
                        )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
