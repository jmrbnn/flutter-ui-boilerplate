import 'package:emp_ai_flutter_boilerplate/src/main/domain/providers/keycloak/keycloak_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KeycloakConfigNotifier extends StateNotifier<KeycloakConfig> {
  KeycloakConfigNotifier() : super(KeycloakConfig());

  void updateConfig(KeycloakConfig config) {
    state = config;
  }
}
