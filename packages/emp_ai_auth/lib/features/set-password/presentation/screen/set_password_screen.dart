// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/features/set-password/presentation/providers/set_password_providers.dart';
import 'package:emp_ai_auth/features/set-password/presentation/providers/state/set_password_state.dart';
import 'package:emp_ai_auth/features/set-password/presentation/widgets/set_password_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SetPasswordScreen extends ConsumerStatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SetPasswordScreenState();
}

class _SetPasswordScreenState extends ConsumerState<SetPasswordScreen> {
  String? appName;
  String clientId = '';
  String redirectUrl = '';
  String code = '';
  bool willRedirect = false;

  final setupPasswordForm = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Map params = GeneralUtils.getUriParameters();
    if (params['redirectUrl'] != null) redirectUrl = params['redirectUrl'];
    if (params['code'] != null) code = params['code'];

    if (params['code'] != null) {
      Future.delayed(const Duration(microseconds: 100), () {
        ref.read(setPasswordProvider.notifier).checkCode(code);
      });
    }

    if (params['client'] != null) {
      String? base64Client = params['client'];
      try {
        if (base64Client != null && base64Client.runtimeType == String) {
          List<String> clientDetails =
              utf8.decode(base64.decode(base64Client)).toString().split(':');

          setState(() {
            appName = clientDetails[1];
            clientId = clientDetails[0];
          });

          if (clientId != '') {
            Future.delayed(const Duration(microseconds: 100), () {
              DsUtils.changeThemeData(ref, clientId);
            });
          }
        }
      } catch (e) {
        setState(() {
          appName = null;
          clientId = '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen for state change on SetPasswordNotifier
    ref.listen(
      setPasswordProvider.select((value) => value),
      ((previous, next) {
        if (next is Failure) {
          DsUtils.showSnackBar(
            context,
            next.exception.message,
            type: SnackBarTypes.error,
          );
        } else if (next is Success) {
          DsUtils.showSnackBar(context, next.data['result']['message']);
        }
      }),
    );

    return LayoutBuilder(builder: (context, constraints) {
      return FormLayout(
        isScrollable: true,
        isVerticallyCentered: !GeneralUtils.checkIfMobileBrowser(context),
        child: Transform.translate(
          offset: Offset(0, constraints.maxHeight * 0.01),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 48),
                  child: SetPasswordApp(
                    appName: appName,
                    code: code,
                    onRedirect: _redirect,
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
        redirectUrl,
        mode: LaunchMode.inAppWebView,
        webOnlyWindowName: '_self',
      );
    }
  }
}
