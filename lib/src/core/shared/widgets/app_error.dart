import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppError extends ConsumerWidget {
  const AppError({Key? key}) : super(key: key);
  static const String routeName = 'appError';

  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(isCustomThemeProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        onTap: () {
          theme.toggle(!ref.read(isCustomThemeProvider));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 42.0,
              color: Theme.of(context).colorScheme.error,
            ),
            Center(
              child: Text(
                'Error occured',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
