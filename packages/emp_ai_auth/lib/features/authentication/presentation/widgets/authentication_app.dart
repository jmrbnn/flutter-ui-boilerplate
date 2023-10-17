import 'dart:async';

import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/state/auth_state.dart';
import 'package:emp_ai_auth/features/auth/shared/auth_providers.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

InAppWebViewController? webViewController;

class AuthenticationApp extends ConsumerStatefulWidget {
  final Widget? header;
  final Widget? footer;
  const AuthenticationApp({
    super.key,
    this.header,
    this.footer,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthenticationAppState();
}

ValueNotifier<String> _oAuthCodeUrl = ValueNotifier<String>('');

class _AuthenticationAppState extends ConsumerState<AuthenticationApp> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewSettings options = InAppWebViewSettings(
      // crossPlatform: InAppWebViewOptions(
      //   useShouldOverrideUrlLoading: true,
      //   mediaPlaybackRequiresUserGesture: false,
      // ),
      // android: AndroidInAppWebViewOptions(
      //   useHybridComposition: true,
      // ),
      // ios: IOSInAppWebViewOptions(
      //   allowsInlineMediaPlayback: true,
      // ),
      );

  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(authNotifierProvider);

    ref.listen(
      authNotifierProvider.select((value) => value),
      ((previous, next) {
        if (next is Authenticated) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Is logged in'.toString())));
        }
      }),
    );

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: state.maybeMap(
          orElse: () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height:
                    url != '' ? MediaQuery.of(context).size.height - 230 : 0,
                child: InAppWebView(
                  key: webViewKey,
                  // initialOptions: options,
                  onWebViewCreated: (controller) {
                    webViewController = controller;
                  },
                  onLoadStart: (controller, url) {
                    setState(() {
                      this.url = url.toString();
                      urlController.text = this.url;
                    });
                  },
                  // androidOnPermissionRequest:
                  //     (controller, origin, resources) async {
                  //   return PermissionRequestResponse(
                  //       resources: resources,
                  //       action: PermissionRequestResponseAction.GRANT);
                  // },
                  shouldOverrideUrlLoading:
                      (controller, navigationAction) async {
                    var uri = navigationAction.request.url!;

                    if (![
                      "http",
                      "https",
                      "file",
                      "chrome",
                      "data",
                      "javascript",
                      "about"
                    ].contains(uri.scheme)) {
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(
                          Uri.parse(url),
                        );
                        return NavigationActionPolicy.CANCEL;
                      }
                    }

                    return NavigationActionPolicy.ALLOW;
                  },
                  onLoadStop: (controller, url_) async {
                    setState(() {
                      url = url_.toString();
                      urlController.text = url;
                    });
                    _oAuthCodeUrl.value = url_.toString();
                  },
                  onProgressChanged: (controller, progress) {
                    setState(() {
                      this.progress = progress / 100;
                      urlController.text = url;
                    });
                  },
                  onUpdateVisitedHistory:
                      (controller, url, androidIsReload) async {
                    setState(() {
                      this.url = url.toString();
                      urlController.text = this.url;
                    });

                    _oAuthCodeUrl.value = this.url.toString();
                  },
                ),
              ),
              progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container(),
              Visibility(
                visible: url == '',
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 65,
                  child: Column(
                    children: [
                      widget.header ??
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 66),
                            child: DsUtils.loadSvgFile(
                              path:
                                  'assets/images/svg/emapta-outsourcing-reimagined.svg',
                              package: 'emp_ai_ds',
                              width: 160,
                            ),
                          ),
                      const Expanded(
                        child: _LoginForm(),
                      ),
                      widget.footer ??
                          Image.asset(
                            'assets/images/png/login-graphic.png',
                            package: 'emp_ai_auth',
                            scale: .8,
                          ),
                    ],
                  ),
                ),
              )
            ],
          ),
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
          onPressed: () => _login(context, ref),
        ),
      ),
    );
  }
}

_login(BuildContext context, WidgetRef ref) async {
  await ref.read(authNotifierProvider.notifier).signIn(
    authorizationCallback: (authorizationUrl) async {
      final completer = Completer<Uri>();

      _handleAuthorizationCallback(
        context,
        WebUri(authorizationUrl.toString()),
        (redirectedUrl) {
          completer.complete(redirectedUrl);
        },
      );

      return completer.future;
    },
    onSuccess: (e) {
      EmpAuth().onSuccessfulAuthentication!(e);
    },
  );
}

_handleAuthorizationCallback(
  BuildContext context,
  WebUri url,
  Function(dynamic) onRedirectAttempt,
) async {
  _oAuthCodeUrl.addListener(() {
    Uri url_ =
        Uri.dataFromString(Uri.decodeFull(_oAuthCodeUrl.value.toString()));

    if (url_.queryParameters.containsKey('code') &&
        url_.queryParameters.containsKey('state')) {
      onRedirectAttempt(url_);
    }
  });

  webViewController?.loadUrl(urlRequest: URLRequest(url: url));
}
