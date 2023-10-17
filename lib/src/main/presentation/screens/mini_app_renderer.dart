import 'package:emp_ai_auth/features/auth/domain/providers/oauth_login_providers.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/router/app_tags.dart';
import 'package:emp_ai_flutter_boilerplate/src/core/shared/domain/models/global_app_variables.dart';
import 'package:emp_ai_flutter_boilerplate/src/main/states/global_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MiniAppRenderer extends ConsumerStatefulWidget {
  const MiniAppRenderer({super.key});

  @override
  ConsumerState<MiniAppRenderer> createState() => _MiniAppRendererState();
}

class _MiniAppRendererState extends ConsumerState<MiniAppRenderer> {
  @override
  void initState() {
    super.initState();

    Map params = getUriParameters();
    Future.delayed(const Duration(seconds: 1), () {
      var globalVariablesNotifier =
          ref.watch(globalAppVariablesProvider.notifier);
      globalVariablesNotifier
          .update(GlobalAppVariables(appTag: params['render'] ?? 'default'));
    });
  }

  @override
  Widget build(BuildContext context) {
    var globalVariables = ref.watch(globalAppVariablesProvider);
    return Scaffold(
      body: MiniApplications.get(globalVariables?.appTag ?? 'loading').screen,
    );
  }
}
