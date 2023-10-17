import 'dart:async';

import 'package:emp_ai_auth/features/auth/shared/auth_providers.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginMiniApp extends ConsumerStatefulWidget {
  final Widget? header;
  final Widget? footer;
  const LoginMiniApp({
    super.key,
    this.header,
    this.footer,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginMiniAppState();
}

class _LoginMiniAppState extends ConsumerState<LoginMiniApp> {
  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.header ??
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 66),
                  child: DsUtils.loadSvgFile(
                    path: 'assets/images/svg/emapta-outsourcing-reimagined.svg',
                    package: 'emp_ai_ds',
                    width: 160,
                  ),
                ),
            const Expanded(
              child: _LoginForm(),
            ),
            SizedBox(
                height: 500,
                width: 300,
                child: WebViewWidget(controller: controller)),
            widget.footer ??
                Image.asset(
                  'assets/images/png/login-graphic.png',
                  package: 'emp_ai_auth',
                  scale: .8,
                ),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends ConsumerStatefulWidget {
  const _LoginForm();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __LoginFormState();
}

class __LoginFormState extends ConsumerState<_LoginForm> {
  @override
  Widget build(BuildContext context) {
    return FormLayout(
      paddingX: 32,
      paddingY: 32,
      child: Form(
        child: AppButton(
          labelText: 'Login',
          height: 62,
          textStyle: TypeUtil(
            weight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onPrimary,
            fontFamily: DsUtils.themeConfiguration(ref).fontFamilyAlt,
          ).h5(),
          isBlock: true,
          onPressed: _login,
        ),
      ),
    );
  }

  _login() async {
    await ref.read(authNotifierProvider.notifier).signIn(
          authorizationCallback: (authorizationUrl) async {
            final completer = Completer<Uri>();

            _handleAuthorizationCallback(
              context,
              authorizationUrl,
              (redirectedUrl) {
                completer.complete(redirectedUrl);
              },
            );

            return completer.future;
          },
          onSuccess: (e) => DsUtils.showSnackBar(context, 'Logged in'),
        );
  }

  _handleAuthorizationCallback(
    BuildContext context,
    Uri url,
    Function(dynamic) onRedirectAttempt,
  ) {
    if (kDebugMode) {
      print(url);
    }
  }
}
