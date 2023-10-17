import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppAlert extends ConsumerStatefulWidget {
  const AppAlert({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppAlertState();
}

class _AppAlertState extends ConsumerState<AppAlert> {
  @override
  Widget build(BuildContext context) {
    return const AppButton(
      labelText: 'Spawn alert',
    );
  }
}
