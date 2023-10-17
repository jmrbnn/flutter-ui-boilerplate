import 'package:emp_ai_flutter_boilerplate/src/core/shared/domain/models/global_app_variables.dart';

import 'package:emp_ai_flutter_boilerplate/src/main/env.dart';
import 'package:emp_ai_flutter_boilerplate/src/main/states/global_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final globalAppProvider =
//     StateNotifierProvider<GlobalAppNotifier, GlobalAppState>((ref) {
//   return GlobalAppNotifier();
// });

// class GlobalAppNotifier extends StateNotifier<GlobalAppState> {
//   GlobalAppNotifier() : super(GlobalAppState.idle);

//   void update(GlobalAppState state) {
//     state = state;
//   }
// }

final globalAppVariablesProvider =
    StateNotifierProvider<GlobalAppVariablesNotifier, GlobalAppVariables?>(
  (ref) => GlobalAppVariablesNotifier(
    GlobalAppVariables(
      keycloakClientAuthUrl: Env.kcClientId,
      keycloakClientId: Env.kcClientSecret,
      keycloakClientSecret: Env.kcAuthenticationUrl,
    ),
  ),
);

class GlobalAppVariablesNotifier extends StateNotifier<GlobalAppVariables?> {
  GlobalAppVariablesNotifier(GlobalAppVariables? token) : super(null);

  void update(GlobalAppVariables? configuration) {
    state = configuration;
  }
}

final globalAppStateProvider =
    StateNotifierProvider<GlobalAppStateNotifier, GlobalAppState>(
        (ref) => GlobalAppStateNotifier(const GlobalAppState.idle()));

class GlobalAppStateNotifier extends StateNotifier<GlobalAppState> {
  GlobalAppStateNotifier(GlobalAppState boolean)
      : super(const GlobalAppState.idle());

  void updateState(GlobalAppState state_) {
    state = state_;
  }
}
