import 'package:emp_ai_flutter_boilerplate/src/main/domain/providers/interface_repository_provider.dart';
import 'package:emp_ai_flutter_boilerplate/src/main/domain/repositories/interface_repository.dart';
import 'package:emp_ai_flutter_boilerplate/src/main/states/global_notifier.dart';
import 'package:emp_ai_flutter_boilerplate/src/main/states/global_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalProvider = StateNotifierProvider<GlobalNotifier, GlobalAppState>(
  (ref) {
    final InterfaceRepository interfaceRepository =
        ref.watch(interfaceRepositoryProvider);
    return GlobalNotifier(
      interfaceRepository: interfaceRepository,
    );
  },
);
