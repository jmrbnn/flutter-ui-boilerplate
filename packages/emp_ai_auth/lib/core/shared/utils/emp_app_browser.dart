import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class EmpAppBrowser extends InAppBrowser {
  final Function(dynamic)? onBrowserClose;
  final Function(dynamic)? onRedirect;

  EmpAppBrowser({
    this.onBrowserClose,
    this.onRedirect,
  });

  Uri? url_;

  @override
  void onUpdateVisitedHistory(Uri? url, bool? isReload) {
    if (kDebugMode) {
      print("Updated history: $url");
    }
    url_ = url;
    if (onRedirect != null) onRedirect!(url_);
  }

  @override
  Future onBrowserCreated() async {
    if (kDebugMode) {
      print("Browser Created!");
    }
  }

  @override
  Future onLoadStart(url) async {
    if (kDebugMode) {
      print("Started $url");
    }
    url_ = url;
  }

  @override
  Future onLoadStop(url) async {
    if (kDebugMode) {
      print("Stopped $url");
    }
    url_ = url;
  }

  @override
  void onLoadError(url, code, message) {
    if (kDebugMode) {
      print("Can't load $url.. Error: $message");
    }
  }

  @override
  void onProgressChanged(progress) {
    if (kDebugMode) {
      print("Progress: $progress");
    }
  }

  @override
  void onExit() {
    if (kDebugMode) {
      print("Browser closed! $url_");
    }
    if (onBrowserClose != null) onBrowserClose!(url_);
  }
}
