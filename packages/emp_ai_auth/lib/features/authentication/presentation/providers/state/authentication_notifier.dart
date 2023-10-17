import 'package:emp_ai_auth/core/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:emp_ai_auth/core/shared/domain/providers/keycloak/keycloak_config.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/state/auth_notifier.dart';
import 'package:emp_ai_auth/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:emp_ai_auth/features/authentication/presentation/providers/state/authentication_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthenticationVerificationType {
  link('link'),
  code('code');

  const AuthenticationVerificationType(this.label);
  final String label;
}

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  AuthenticationNotifier({
    required this.authenticationRepository,
    required this.userRepository,
  }) : super(const AuthenticationState.checkCode());

  Future<void> signIn({
    required AuthUriCallBack authorizationCallback,
    required Function() onSuccess,
    KeycloakConfig? customKeycloakConfig,
  }) async {}
}
