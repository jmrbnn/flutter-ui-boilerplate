import 'package:emp_ai_auth/core/shared/domain/providers/keycloak/keycloak_config.dart';
import 'package:emp_ai_auth/core/shared/domain/providers/keycloak/keycloak_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final keycloakConfigProvider =
    StateNotifierProvider<KeycloakConfigNotifier, KeycloakConfig>((ref) {
  return KeycloakConfigNotifier();
});
