// ignore_for_file: avoid_web_libraries_in_flutter, use_build_context_synchronously
import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/widgets/app_otp_textfield.dart';
import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_login_providers.dart';
import 'package:emp_ai_auth/features/auth/domain/providers/oauth_state.dart';
import 'package:emp_ai_auth/features/auth/presentation/widgets/validate_mfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:html' as html;

import 'package:url_launcher/url_launcher_string.dart';

class OAuthValidateMFAScreen extends ConsumerStatefulWidget {
  const OAuthValidateMFAScreen({super.key});
  @override
  ConsumerState<OAuthValidateMFAScreen> createState() =>
      _OAuthValidateMFAScreenState();
}

class _OAuthValidateMFAScreenState
    extends ConsumerState<OAuthValidateMFAScreen> {
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
        if (next is Redirect) {
          if (GeneralUtils.checkIfMobileBrowser(context)) {
            html.window.location.href = next.url;
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

    return LayoutBuilder(builder: (context, constraints) {
      return FormLayout(
        isScrollable: constraints.maxHeight < 600,
        isVerticallyCentered: !GeneralUtils.checkIfMobileBrowser(context),
        child: Transform.translate(
          offset: Offset(0, constraints.maxHeight * 0.01),
          child: Column(
            children: [
              const ValidateMfaApp(),
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
                          color: ref.read(colorProvider).error,
                        ).small(),
                      )),
            ],
          ),
        ),
      );
    });
  }
}
