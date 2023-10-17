// ignore_for_file: avoid_print

import 'package:emp_ai_auth/emp_ai_auth.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/widgets/layout/form_layout.dart';
import 'package:emp_ai_auth/features/auth/domain/entities/state/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
    final identity = ref.watch(identityProvider);
    return LayoutBuilder(builder: (context, constraints) {
      return FormLayout(
        isScrollable: constraints.maxHeight < 500,
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
                    //       : OAuthUtils.isClientAdmin()
                    //           ? 'Client admin'
                    //           : 'Regular user',
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
                      ).h3(),
                    ),
                    Text(
                      '${identity?.email}',
                      style: TypeUtil(
                        context: context,
                      ).body(),
                    ),

                    // SizedBox(
                    //   width: 300,
                    //   child: DsUtils.wrapLinksInText(
                    //       'Lorem ipsum dolor sit amet, consectetur https://google.com adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                    // ),
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
