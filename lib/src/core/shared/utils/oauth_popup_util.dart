// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';

import 'package:flutter/foundation.dart';

class OAuthPopupUtil {
  static const String clientId =
      'YOUR_CLIENT_ID_HERE'; // Replace with your client ID

  static void setupOAuth() {
    final Uri url = Uri.https('github.com', '/login/oauth/authorize', {
      'client_id': clientId,
    });

    final AnchorElement popupA =
        querySelector('#oauth-github-popup') as AnchorElement;
    popupA.href = url.toString();

    popupA.onClick.listen((MouseEvent event) {
      event.preventDefault();

      final Map<String, dynamic> features = {
        'popup': 'yes',
        'width': 600,
        'height': 700,
        'top': 'auto',
        'left': 'auto',
        'toolbar': 'no',
        'menubar': 'no',
      };

      String strWindowsFeatures = features.entries.map((entry) {
        final key = entry.key;
        final value = entry.value;

        if (value == 'auto') {
          if (key == 'top') {
            final v =
                (window.innerHeight! / 2 - features['height'] / 2).round();
            return 'top=$v,';
          } else if (key == 'left') {
            final v = (window.innerWidth! / 2 - features['width'] / 2).round();
            return 'left=$v,';
          }
        }

        return '$key=$value,';
      }).join();

      strWindowsFeatures =
          strWindowsFeatures.substring(0, strWindowsFeatures.length - 1);

      window.open(url.toString(), '_blank', strWindowsFeatures);
    });

    window.onMessage.listen((MessageEvent event) {
      if (event.origin != window.location.origin) {
        if (kDebugMode) {
          print('Message received by ${event.origin}; IGNORED.');
        }
        return;
      }

      final String accessToken = event.data;
      if (kDebugMode) {
        print(accessToken);
      } // save this in storage, cookie and use it with GitHub REST API
    });
  }
}
