import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/text_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomInAppBrowser extends ConsumerStatefulWidget {
  final String url;
  final void Function(InAppWebViewController controller)? onWebViewCreated;
  final Function(InAppWebViewController controller, Uri? url)? onLoadStart;
  final void Function(InAppWebViewController controller, Uri? url)? onLoadStop;
  final void Function(
          InAppWebViewController controller, Uri? url, bool? androidIsReload)?
      onUpdateVisitedHistory;
  final void Function(InAppWebViewController controller, String? title)?
      onTitleChanged;
  final void Function(InAppWebViewController controller, int progress)?
      onProgressChanged;

  const CustomInAppBrowser({
    Key? key,
    required this.url,
    this.onWebViewCreated,
    this.onLoadStart,
    this.onLoadStop,
    this.onUpdateVisitedHistory,
    this.onTitleChanged,
    this.onProgressChanged,
  }) : super(key: key);

  @override
  ConsumerState<CustomInAppBrowser> createState() => _CustomInAppBrowserState();
}

class _CustomInAppBrowserState extends ConsumerState<CustomInAppBrowser> {
  final GlobalKey webViewKey = GlobalKey();

  List<String> showUrlBar = [
    'https://emp-identity-management.playground.emaptagtsrnd.xyz/#/terms-and-conditions',
    'https://emapta.com/privacy-policy/',
  ];
  String url = '';
  String title = '';
  double progress = 0;
  bool? isSecure;
  InAppWebViewController? webViewController;

  @override
  void initState() {
    super.initState();
    url = widget.url;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: DsUtils.emptyWidget,
          leadingWidth: 0,
          excludeHeaderSemantics: true,
          elevation: 1,
          shadowColor: Colors.black,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              webViewController == null
                  ? DsUtils.emptyWidget
                  : FutureBuilder<WebUri?>(
                      future: webViewController?.getUrl(),
                      builder: (context, snapshot) {
                        return !showUrlBar.contains(snapshot.data?.rawValue)
                            ? DsUtils.emptyWidget
                            : snapshot.data?.rawValue == null
                                ? DsUtils.emptyWidget
                                : SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    child: DsUtils.textWithEllipsis(
                                        snapshot.data?.rawValue ?? '',
                                        style: TextUtil(
                                          context,
                                          color: ref
                                              .read(colorProvider)
                                              .contentGray,
                                        ).bodyL()));
                      },
                    ),
              FutureBuilder<bool>(
                future: webViewController?.canGoBack() ?? Future.value(false),
                builder: (context, snapshot) {
                  final canGoBack = snapshot.hasData ? snapshot.data! : false;
                  return IconButton(
                    color: Theme.of(context).colorScheme.primary,
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: !canGoBack
                        ? null
                        : () {
                            webViewController?.goBack();
                          },
                  );
                },
              ),
              FutureBuilder<bool>(
                future:
                    webViewController?.canGoForward() ?? Future.value(false),
                builder: (context, snapshot) {
                  final canGoForward =
                      snapshot.hasData ? snapshot.data! : false;
                  return IconButton(
                    color: Theme.of(context).colorScheme.primary,
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: !canGoForward
                        ? null
                        : () {
                            webViewController?.goForward();
                          },
                  );
                },
              )
            ],
          ),
          actions: [
            IconButton(
              color: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.refresh),
              onPressed: () {
                webViewController?.reload();
              },
            ),
            PopupMenuButton<int>(
              onSelected: (item) => handleClick(item),
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(Icons.close),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Dismiss')
                      ],
                    )),
              ],
            ),
          ],
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: InAppWebView(
                  key: webViewKey,
                  initialUrlRequest: URLRequest(url: WebUri(widget.url)),
                  // implementation: WebViewImplementation.NATIVE,
                  initialSettings: InAppWebViewSettings(
                    cacheEnabled: false,
                    clearCache: true,
                    incognito: true,
                    cacheMode: CacheMode.LOAD_NO_CACHE,
                    sharedCookiesEnabled: true,
                  ),

                  onCreateWindow: (controller, createWindowAction) async {
                    webViewController = controller;

                    webViewController?.clearCache();
                    CookieManager cookieManager = CookieManager.instance();
                    cookieManager.deleteAllCookies();
                    return null;
                  },
                  onWebViewCreated: (controller) async {
                    webViewController = controller;
                  },
                  onLoadStart: (controller, url) {
                    if (url != null) {
                      setState(() {
                        this.url = url.toString();
                      });
                    }

                    if (widget.onLoadStart != null) {
                      widget.onLoadStart!(controller, url);
                    }
                  },
                  onLoadStop: (controller, url) async {
                    if (url != null) {
                      setState(() {
                        this.url = url.toString();
                      });
                    }
                    if (widget.onLoadStop != null) {
                      widget.onLoadStop!(controller, url);
                    }
                  },
                  onUpdateVisitedHistory: (controller, url, isReload) {
                    if (url != null) {
                      setState(() {
                        this.url = url.toString();
                      });
                    }
                    if (widget.onUpdateVisitedHistory != null) {
                      widget.onUpdateVisitedHistory!(controller, url, isReload);
                    }
                  },
                  onTitleChanged: (controller, title) {
                    if (title != null) {
                      setState(() {
                        this.title = title;
                      });
                    }
                    if (widget.onTitleChanged != null) {
                      widget.onTitleChanged!(controller, title);
                    }
                  },
                  onProgressChanged: (controller, progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                    if (widget.onProgressChanged != null) {
                      widget.onProgressChanged!(controller, progress);
                    }
                  },
                  // shouldOverrideUrlLoading: (controller, navigationAction) async {
                  //   final url = navigationAction.request.url;
                  //   if (navigationAction.isForMainFrame &&
                  //       url != null &&
                  //       ![
                  //         'http',
                  //         'https',
                  //         'file',
                  //         'chrome',
                  //         'data',
                  //         'javascript',
                  //         'about'
                  //       ].contains(url.scheme)) {
                  //     if (await canLaunchUrl(url)) {
                  //       launchUrl(url);
                  //       return NavigationActionPolicy.CANCEL;
                  //     }
                  //   }
                  //   return NavigationActionPolicy.ALLOW;
                  // },
                ),
              ),
              progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container(),
            ],
          )),
        ]),
      ),
    );
  }

  void handleClick(int item) async {
    switch (item) {
      case 0:
        webViewController?.clearCache();
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
        break;
    }
  }
}
