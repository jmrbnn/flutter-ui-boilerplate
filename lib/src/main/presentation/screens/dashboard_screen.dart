// ignore_for_file: avoid_print

import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  String? tenantId;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(microseconds: 100), () async {
      String tenantId_ = await EmpAuth().getTenantId!(ref) ?? '';
      setState(() {
        tenantId = tenantId_;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final authNotifier = ref.watch(authNotifierProvider.notifier);
    final identity = EmpAuth().identity;
    return LayoutBuilder(builder: (context, constraints) {
      return FormLayout(
        isScrollable: constraints.maxHeight < 500,
        paddingX: 0,
        child: Transform.translate(
          offset: Offset(0, constraints.maxHeight * 0.01),
          child: Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Visibility(
                visible: identity != null,
                child: Column(
                  children: [
                    // SelectableText(
                    //   EmpAuth().identity!.realmAccess!.roles!.toString(),
                    // ),
                    // SelectableText(
                    //   OAuthUtils.isRealmAdmin()
                    //       ? 'Realm admin'
                    //       : 'Client admin',
                    // ),
                    // SelectableText(
                    //   EmpAuth().identity!.resourceAccess.toString(),
                    // ),
                    // SelectableText(
                    //   OAuthUtils.getResourceAccessList().toString(),
                    // ),
                    // SelectableText(
                    //   OAuthUtils.getClientId().toString(),
                    // ),
                    // SelectableText(
                    //   tenantId ?? 'No tenant id',
                    // ),
                    Text(
                      'Welcome, ${identity?.givenName}!',
                      style: TypeUtil(
                        context: context,
                        weight: FontWeight.w700,
                      ).h4(),
                    ),
                    Text(
                      '${identity?.email}',
                      style: TypeUtil(
                        context: context,
                      ).body(),
                    ),

                    const SizedBox(
                      height: 24,
                    ),
                    // AppButton(
                    //   labelText: 'Let\'s talk!',
                    //   type: AppButtonTypes.outline,
                    //   customColor: Theme.of(context).colorScheme.primary,
                    //   onPressed: () => GoRouter.of(context).go(Routes.chat.url),
                    // )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Wrap(
              //   spacing: 8,
              //   children: [
              //     AppButton(
              //       labelText: 'Change Password',
              //       icon: const Icon(Icons.password_outlined),
              //       onPressed: () async {
              //         GoRouter.of(context).go(Routes.changePassword.url);
              //       },
              //     ),
              //     AppButton(
              //       labelText: 'Logout',
              //       icon: const Icon(Icons.logout_outlined),
              //       onPressed: () async {
              //         await authNotifier.signOut();
              //       },
              //     )
              //   ],
              // )
            ],
          ),
        ),
      );
    });
  }
}
