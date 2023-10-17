import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class GeneralUtils {
  static Map<String, String> getUriParameters() {
    final uri = Uri.dataFromString(Uri.base.toString());
    return uri.queryParameters;
  }

  static Map<String, dynamic> cleanMap(Map<dynamic, dynamic> map_) {
    return Map.fromEntries(
      map_.entries
          .where((entry) =>
              entry.value != null &&
              entry.value.toString().isNotEmpty &&
              entry.key != 'accessToken')
          .map((entry) =>
              MapEntry<String, dynamic>(entry.key.toString(), entry.value)),
    );
  }

  static void isolateDebug(dynamic obj) {
    if (kDebugMode) {
      print('ISOLATED: ${obj.toString()}');
    }
  }

  static parsePasswordPolicy(List response) {
    Map<String, dynamic> passwordPolicy = {};

    for (String line in response) {
      final parts = line.split(': ');
      if (parts.length == 2) {
        final key = parts[0];
        final value = parts[1];

        // Check if the value is a numeric string and parse it as an integer
        dynamic parsedValue = int.tryParse(value);

        // If it's not numeric, treat it as a string
        parsedValue ??= value;

        // Handle boolean values
        if (parsedValue == '1') {
          parsedValue = true;
        } else if (parsedValue == '0') {
          parsedValue = false;
        }

        passwordPolicy[key] = parsedValue;
      } else {
        // Handle cases where there is no value (e.g., "notEmail", "notUsername")
        passwordPolicy[line] = true;
      }
    }

    return passwordPolicy;
  }

  int countCharactersInCase(String input, CaseType caseType) {
    int count = 0;

    for (int i = 0; i < input.length; i++) {
      final char = input[i];
      if (caseType == CaseType.lowercase && char == char.toLowerCase()) {
        count++;
      } else if (caseType == CaseType.uppercase && char == char.toUpperCase()) {
        count++;
      }
    }

    return count;
  }

  static bool checkIfMobileBrowser(BuildContext context) {
    return (Theme.of(context).platform == TargetPlatform.iOS ||
            Theme.of(context).platform == TargetPlatform.android) &&
        kIsWeb;
  }

  static spawnPopup(
    BuildContext context,
    Uri url,
    Function(dynamic) onRedirectAttempt,
  ) {
    const features = {
      "popup": "yes",
      "width": 450,
      "height": 750,
      "top": "auto",
      "left": "auto",
      "toolbar": "no",
      "menubar": "no",
    };

    final windowFeatures = generateWindowFeatures(features, context);
    url.toString();
    html.WindowBase? popup =
        html.window.open(url.toString(), 'sample', windowFeatures);
    if (popup.closed ?? false) {
      throw ("Popups blocked");
    }

    html.window.addEventListener("message", (event) {
      return receiveMessage(
        event,
        onReceive: onRedirectAttempt,
      );
    }, false);
    html.window.onMessage.listen((event) {
      receiveMessage(
        event,
        onReceive: onRedirectAttempt,
      );
    });
  }

  static receiveMessage(event, {onReceive}) {
    if (event.data == 'AUTH_REQUEST_FLOW_ABORTED') {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text('Authentication flow aborted')));
    } else {
      onReceive(Uri.parse('${event.data}'));

      // messageSubscription?.cancel();
    }
  }

  static String generateWindowFeatures(
      Map<String, dynamic> features, BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    String strWindowsFeatures = features.entries.map((entry) {
      final key = entry.key;
      final value = entry.value;

      if (value == "auto") {
        if (key == "top") {
          final v =
              ((screenSize.height / 2) - (features['height'] / 2)).round();
          return 'top=$v,';
        } else if (key == "left") {
          final v = ((screenSize.width / 2) - (features['width'] / 2)).round();
          return 'left=$v,';
        }
      }

      return '$key=$value,';
    }).join();

    // Remove the trailing comma
    return strWindowsFeatures.substring(0, strWindowsFeatures.length - 1);
  }

  static String fixQueryParam(String queryString) {
    // Split the query string by '?' and '&'
    List<String> parts = queryString.split(RegExp(r'[?&]'));

    // Create a map to store the query parameters
    Map<String, String> params = {};

    // Iterate through the parts and split them into key-value pairs
    for (String part in parts) {
      List<String> keyValue = part.split('=');
      if (keyValue.length == 2) {
        // Decode the key and value and store them in the map
        String key = Uri.decodeComponent(keyValue[0]);
        String value = Uri.decodeComponent(keyValue[1]);
        params[key] = value;
      }
    }

    // Build a new query string from the parameters
    List<String> fixedParams = [];
    params.forEach((key, value) {
      fixedParams.add('$key=$value');
    });

    // Join the fixed parameters with '&' to create the new query string
    String fixedQueryString = fixedParams.join('&');

    return fixedQueryString;
  }
}

enum CaseType {
  lowercase,
  uppercase,
}
