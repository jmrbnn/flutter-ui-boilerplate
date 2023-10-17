import 'package:emp_ai_flutter_boilerplate/src/main/domain/repositories/interface_repository.dart';
import 'package:emp_ai_flutter_boilerplate/src/main/states/global_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalNotifier extends StateNotifier<GlobalAppState> {
  final InterfaceRepository interfaceRepository;

  GlobalNotifier({
    required this.interfaceRepository,
  }) : super(const GlobalAppState.initial());

  Future<Map<String, dynamic>?> getConfigurations(String identifier) async {
    final response = await interfaceRepository.getAppConfiguration(identifier);
    Map<String, dynamic>? configurations;
    state = await response.fold(
      (failure) => GlobalAppState.failure(failure),
      (response) {
        configurations = response;
        return GlobalAppState.success(data: response);
      },
    );

    return configurations;
  }
}
