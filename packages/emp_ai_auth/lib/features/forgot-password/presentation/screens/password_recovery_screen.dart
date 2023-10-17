// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:emp_ai_auth/core/shared/domain/providers/sharedpreferences_storage_service_provider.dart';
import 'package:emp_ai_auth/core/shared/utils/general_utils.dart';
import 'package:emp_ai_auth/features/forgot-password/presentation/providers/forgot_password_provider.dart';
import 'package:emp_ai_auth/features/forgot-password/presentation/providers/state/forgot_password_state.dart';
import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:emp_ai_auth/features/forgot-password/presentation/widgets/password_recovery_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

String FP_STORAGE_KEY = 'fPRedirectUrl';

class PasswordRecoveryScreen extends ConsumerStatefulWidget {
  final String? redirectUrl;
  const PasswordRecoveryScreen({
    super.key,
    this.redirectUrl,
  });

  @override
  ConsumerState<PasswordRecoveryScreen> createState() =>
      _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState
    extends ConsumerState<PasswordRecoveryScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      if (widget.redirectUrl != null) {
        await ref
            .read(storageServiceProvider)
            .set(FP_STORAGE_KEY, widget.redirectUrl.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(forgotPasswordProvider);

    return LayoutBuilder(builder: (context, constraints) {
      return FormLayout(
        isScrollable:
            state is InputPasswords ? true : constraints.maxHeight < 500,
        isVerticallyCentered: !GeneralUtils.checkIfMobileBrowser(context),
        child: Transform.translate(
          offset: Offset(0, constraints.maxHeight * 0.01),
          child: PasswordRecoveryApp(
            redirectUrl: widget.redirectUrl,
            onSuccess: () async {
              String? cachedRedirectUrl = await ref
                  .read(storageServiceProvider)
                  .get(FP_STORAGE_KEY) as String?;
              GeneralUtils.isolateDebug(
                  'ForgotPasswordRedirectUrl: $cachedRedirectUrl');
              await ref.read(storageServiceProvider).remove(FP_STORAGE_KEY);
              if (cachedRedirectUrl != null) {
                launchUrlString(
                  cachedRedirectUrl,
                  mode: LaunchMode.inAppWebView,
                  webOnlyWindowName: '_self',
                );
              }
            },
          ),
        ),
      );
    });
  }
}
