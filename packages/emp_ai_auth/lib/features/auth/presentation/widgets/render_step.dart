// ignore_for_file: deprecated_member_use

import 'package:emp_ai_auth/features/auth/presentation/screen/oauth_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RenderStep extends ConsumerWidget {
  final WebUri url;
  final Function(dynamic) onSubmitResponse;
  const RenderStep({
    super.key,
    required this.url,
    required this.onSubmitResponse,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: _getMiniApp(
        url.path.toString(),
      ),
    );
  }

  _getMiniApp(String? tag) {
    if (tag?.endsWith('/auth') ?? false) {
      // List<Cookie>? cookies;

      // Visit authorization url to get cookie
      HeadlessInAppWebView headlessWebView = HeadlessInAppWebView(
        initialUrlRequest: URLRequest(url: url),
        onLoadStop: (controller, url_) {
          // debugPrint(url_!.origin);
          // print(url_);
          // EmpAuth().cookieManager?.ios.getAllCookies().then((list) {
          //   if (list.isNotEmpty) {
          //     var filteredList = list
          //         .where((element) =>
          //             element.domain == 'ai.playground.emaptagtsrnd.xyz' &&
          //             element.isSecure == true)
          //         .toList();
          //     print(filteredList);
          //     if (filteredList.isNotEmpty) {
          //       for (var element in filteredList) {
          //         debugPrint('${element.name} :   ${element.value}');
          //       }
          //     }
          //   }
          // });
        },
        initialOptions: InAppWebViewGroupOptions(
            ios: IOSInAppWebViewOptions(
                sharedCookiesEnabled: true,
                minimumZoomScale: 1.0,
                maximumZoomScale: 1.0),
            crossPlatform: InAppWebViewOptions(
              javaScriptEnabled: true,
              supportZoom: false,
            )),
      );
      Future.delayed(const Duration(seconds: 1), () async {
        await headlessWebView.run();

        // cookies = await EmpAuth().cookieManager?.getCookies(url: url);
        // print(await EmpAuth().cookieManager?.ios.getAllCookies());
        // print('Cookies: $cookies');

        // headlessWebView.dispose();
      });

      // Map customParams = Uri.dataFromString(url.toString()).queryParameters;
      return const Scaffold(
        body: OAuthLoginScreen(
          formOnly: true,
          // customParams: customParams,
        ),
      );
    }
  }
}
