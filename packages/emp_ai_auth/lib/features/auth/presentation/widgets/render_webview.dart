import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class RenderWebview extends ConsumerStatefulWidget {
  final String uri;
  const RenderWebview({
    super.key,
    required this.uri,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RenderWebviewState();
}

InAppWebViewController? webViewController;
ValueNotifier<String> _oAuthCodeUrl = ValueNotifier<String>('');

class _RenderWebviewState extends ConsumerState<RenderWebview> {
  final GlobalKey webViewKey = GlobalKey();

  // InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
  //     crossPlatform: InAppWebViewOptions(
  //       useShouldOverrideUrlLoading: true,
  //       mediaPlaybackRequiresUserGesture: false,
  //     ),
  //     android: AndroidInAppWebViewOptions(
  //       useHybridComposition: true,
  //     ),
  //     ios: IOSInAppWebViewOptions(
  //       allowsInlineMediaPlayback: true,
  //     ));

  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _oAuthCodeUrl.addListener(() {
      Uri url_ =
          Uri.dataFromString(Uri.decodeFull(_oAuthCodeUrl.value.toString()));

      if (url_.queryParameters.containsKey('code') &&
          url_.queryParameters.containsKey('state')) {
        //On success action
        // onRedirectAttempt(url_);
      }
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: url == '' ? 0 : MediaQuery.of(context).size.height - 230,
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
            // androidOnPermissionRequest: (controller, origin, resources) async {
            //   return PermissionRequestResponse(
            //       resources: resources,
            //       action: PermissionRequestResponseAction.GRANT);
            // },
            shouldOverrideUrlLoading: (controller, navigationAction) async {
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
            onUpdateVisitedHistory: (controller, url, androidIsReload) async {
              setState(() {
                this.url = url.toString();
                urlController.text = this.url;
              });

              _oAuthCodeUrl.value = url.toString();
            },
          ),
        ),
        progress < 1.0 ? LinearProgressIndicator(value: progress) : Container(),
      ],
    );
  }
}
