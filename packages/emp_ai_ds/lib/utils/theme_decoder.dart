import 'dart:convert';

import 'package:flutter/services.dart';

Future<dynamic> getTheme() async {
  final themeStr = await rootBundle.loadString('sample/sample_theme.json');
  final themeJson = json.decode(themeStr);

  return themeJson;
}
