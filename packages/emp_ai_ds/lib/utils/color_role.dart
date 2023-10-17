import 'package:emp_ai_ds/entities/theme_config.dart';
import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorRole {
  static ColorRolesConfig config(WidgetRef ref) {
    return ref.watch(colorProvider);
  }
}
