// ignore_for_file: avoid_print

import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return FormLayout(
        isScrollable: constraints.maxHeight < 500,
        child: Transform.translate(
          offset: Offset(0, constraints.maxHeight * 0.01),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  child: DsUtils.loadSvgFile(
                    path: 'assets/images/svg/emapta-transparent.svg',
                    package: 'emp_ai_ds',
                    width: 140,
                    height: 140,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.3, vertical: 24),
                child: LinearProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
