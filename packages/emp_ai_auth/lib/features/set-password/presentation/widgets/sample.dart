import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SampleThis extends ConsumerWidget {
  const SampleThis({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(EmpAuth.instance.clientId);
  }
}
