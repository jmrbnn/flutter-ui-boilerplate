// ignore_for_file: depend_on_referenced_packages

import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

void main() {
  runApp(const ProviderScope(child: MyApp()));

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  CookieManager cookieManager = CookieManager.instance();
  String url = '';
  Map? stateAndCode;
  Map? tokens;
  Map? identity;

  EmpAuth auth = EmpAuth();

  bool isLoggedIn = false;
  // var options = InAppBrowserClassOptions(
  //     crossPlatform: InAppBrowserOptions(
  //       hideUrlBar: true,
  //       // hideToolbarTop: true,
  //     ),
  //     inAppWebViewGroupOptions: InAppWebViewGroupOptions(
  //         crossPlatform: InAppWebViewOptions(javaScriptEnabled: true)));

  @override
  void initState() {
    super.initState();

    auth.initialize(
      clientId: 'EMAPTA',
      kcAuthenticationUrl: 'https://ai.playground.emaptagtsrnd.xyz/auth',
      kcUserUrl: 'https://ai.playground.emaptagtsrnd.xyz/user',
      kcAuthorizationUrl:
          'https://ai.playground.emaptagtsrnd.xyz/authorization',
      redirectUrl: 'https://flutter.playground.emaptagtsrnd.xyz/#/callback',
      onSuccessfulRefresh: (e) {
        setState(() {
          isLoggedIn = true;
        });
      },
      onSuccessfulAuthentication: (e) {
        setState(() {
          isLoggedIn = true;
        });
      },
      onSuccessfulLogout: () {
        setState(() {
          isLoggedIn = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Visibility(
                visible: url == '' && stateAndCode == null,
                child: Column(
                  children: [
                    ElevatedButton(
                      child: const Text('Get authorization url'),
                      onPressed: () async {
                        // Step 1: Get authorization URL
                        Uri url_ = await EmpAuth().getAuthorization!(ref);
                        setState(() {
                          url = url_.toString();
                        });

                        // Step 2: Launch browser to access authorization URL to perform
                        // actions after getting the callback url together with the
                        // code and state query parameters just in case you don't
                        // have access to routing
                        EmpAuth().launchUrl!(
                            url: url_.toString(),
                            onRedirect: (redirectUrl) {
                              // If redirected URL matches the callback URL that you've set
                              // close the browser instance programatically.
                              if (redirectUrl
                                  .toString()
                                  .startsWith(EmpAuth().redirectUrl)) {
                                Future.delayed(
                                  const Duration(seconds: 10),
                                  () {
                                    if (EmpAuth().closeBrowser != null) {
                                      EmpAuth().closeBrowser!();
                                    }
                                  },
                                );
                              } else {
                                setState(() {
                                  url = '';
                                });
                              }
                            },
                            onBrowserClose: (urlOnClose) {
                              // You now have the state and code values from the
                              // redirectURL
                              Map parameters =
                                  Uri.dataFromString(urlOnClose.toString())
                                      .queryParameters;

                              if (parameters.containsKey('code') &&
                                  parameters.containsKey('state')) {
                                setState(() {
                                  stateAndCode = parameters;
                                });
                              } else {
                                setState(() {
                                  url = '';
                                });
                              }
                            });
                      },
                    ),
                    Text((stateAndCode ?? 'No state and code yet').toString()),
                  ],
                ),
              ),
              Visibility(
                visible: stateAndCode != null && tokens == null,
                child: Column(
                  children: [
                    ElevatedButton(
                      child: const Text('Exchange code for token'),
                      onPressed: () async {
                        // Step 3: Exchange auth code for token
                        EmpAuth().exchangeCodeForToken!(
                          ref: ref,
                          payload: stateAndCode,
                          onSuccess: (e) {
                            setState(() {
                              tokens = e.token.toJson();
                              identity = e.identity?.toJson();
                            });
                          },
                          onFailure: (e) {
                            setState(() {
                              tokens = null;
                              identity = null;
                            });
                          },
                        );
                      },
                    ),
                    Text((stateAndCode ?? 'No state and code yet').toString()),
                  ],
                ),
              ),
              Visibility(
                visible: stateAndCode != null && tokens != null,
                child: Column(
                  children: [
                    ElevatedButton(
                      child: const Text('Logout'),
                      onPressed: () async {
                        // Step 4: Store the access tokens securely and provide
                        // a logout interface
                        EmpAuth().logout(ref);
                        setState(() {
                          stateAndCode = null;
                          tokens = null;
                          url = '';
                        });
                      },
                    ),
                    ElevatedButton(
                      child: const Text('Refresh token'),
                      onPressed: () async {
                        // Step 4: Store the access tokens securely and provide
                        // a logout interface
                        await EmpAuth().refreshToken(ref,
                            refreshToken: tokens?['refresh_token']);
                      },
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height - 300,
                        child: SingleChildScrollView(
                            child: Column(
                          children: [
                            Text((tokens ?? 'No access tokens yet').toString()),
                            Text((identity ?? 'No identity yet').toString()),
                          ],
                        ))),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 500,
              //   child: EmpAuth().renderForm(
              //     url: Uri.parse(url),
              //     onSubmitResponse: (e) {},
              //   ),
              // ),
              // EmpAuth().renderWebView(
              //   url: Uri.parse(url),
              //   onSubmitResponse: (e) {},
              // ),
            ],
          ),
        ),
      ),
    );
    //   home: isLoggedIn
    //       ? FutureBuilder(
    //           future: EmpAuth().getCredentialsSignedIn(ref),
    //           builder: (context, snapshot) {
    //             if (snapshot.connectionState == ConnectionState.waiting) {
    //               return const CircularProgressIndicator();
    //             }
    //             return Scaffold(
    //               appBar: !snapshot.hasData
    //                   ? null
    //                   : AppBar(
    //                       actions: const [
    //                         LogoutButton(),
    //                       ],
    //                     ),
    //               body: snapshot.hasData
    //                   ? SafeArea(
    //                       child: ProtectedSection(
    //                           credential: snapshot.data?.toJson()),
    //                     )
    //                   : EmpAuth.instance.login,
    //             );
    //           })
    //       : FutureBuilder(
    //           future: EmpAuth().getCredentialsSignedIn(ref),
    //           builder: (context, snapshot) {
    //             if (snapshot.connectionState == ConnectionState.waiting) {
    //               return const CircularProgressIndicator();
    //             }
    //             return Scaffold(
    //               appBar: !snapshot.hasData
    //                   ? null
    //                   : AppBar(
    //                       actions: const [
    //                         LogoutButton(),
    //                       ],
    //                     ),
    //               body: snapshot.hasData
    //                   ? SafeArea(
    //                       child: ProtectedSection(
    //                           credential: snapshot.data?.toJson()),
    //                     )
    //                   : EmpAuth.instance.login,
    //             );
    //           }),
    // );
  }
}

// class LogoutButton extends ConsumerWidget {
//   const LogoutButton({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return IconButton(
//       onPressed: () => EmpAuth.instance.logout(ref),
//       icon: const Icon(
//         Icons.logout_outlined,
//       ),
//     );
//   }
// }

// class ProtectedSection extends ConsumerWidget {
//   final dynamic credential;
//   const ProtectedSection({super.key, this.credential});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//         padding: const EdgeInsets.all(24),
//         height: MediaQuery.of(context).size.height - 160,
//         child: SingleChildScrollView(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Auth tokens:',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             Text('$credential'),
//           ],
//         )));
//   }
// }

// class MyInAppBrowser extends InAppBrowser {
//   @override
//   Future onBrowserCreated() async {
//     print("Browser Created!");
//   }

//   @override
//   Future onLoadStart(url) async {
//     print("Started $url");
//   }

//   @override
//   Future onLoadStop(url) async {
//     print("Stopped $url");
//   }

//   @override
//   void onLoadError(url, code, message) {
//     print("Can't load $url.. Error: $message");
//   }

//   @override
//   void onProgressChanged(progress) {
//     print("Progress: $progress");
//   }

//   @override
//   void onExit() {
//     print("Browser closed!");
//   }
// }
