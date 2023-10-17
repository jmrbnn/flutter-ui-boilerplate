import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class EmpAppCSBrowser extends ChromeSafariBrowser {
  final Function()? onBrowserClose;
  final Function()? onRedirect;

  EmpAppCSBrowser({
    this.onBrowserClose,
    this.onRedirect,
  });

  @override
  void onOpened() {
    if (kDebugMode) {
      print("ChromeSafari browser opened");
    }
    onBrowserClose!();
  }

  // @override
  // void onCompletedInitialLoad() {
  //   if (kDebugMode) {
  //     print("ChromeSafari browser initial load completed");
  //   }
  // }

  @override
  void onClosed() {
    if (kDebugMode) {
      print("ChromeSafari browser closed");
    }
  }
}
