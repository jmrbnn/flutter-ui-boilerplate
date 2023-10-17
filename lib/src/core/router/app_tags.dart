import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MiniApplication {
  final String name;
  final String tag;
  final Widget screen;

  const MiniApplication({
    required this.name,
    required this.tag,
    required this.screen,
  });
}

class MiniApplications {
  static final Map<String, MiniApplication> _tags = {
    // 'oauth-demo': const MiniApplication(
    //   name: 'OAuth2 Demo',
    //   tag: 'oauth-demo',
    //   screen: OAuthMiniApp(),
    // ),
    'loading': const MiniApplication(
      name: 'EMAPTA',
      tag: 'default-app',
      screen: DefaultScreen(
        isLoading: true,
      ),
    ),
    'unset': const MiniApplication(
      name: 'EMAPTA',
      tag: 'default-app',
      screen: DefaultScreen(),
    ),
    // Add more mini-apps here
  };

  static MiniApplication get(String tag) {
    return _tags[tag] ?? MiniApplications.get('unset');
  }
}

class DefaultScreen extends ConsumerWidget {
  final bool isLoading;
  const DefaultScreen({
    super.key,
    this.isLoading = false,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Center(
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: DsUtils.loadSvgFile(
              path: 'assets/images/svg/logo-emapta.svg',
              package: 'emp_ai_ds',
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(height: 24),
          Visibility(
            visible: !isLoading,
            child: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  'EMAPTA Applications Renderer',
                  style: TypeUtil(
                          context: context,
                          weight: FontWeight.w600,
                          fontFamily:
                              DsUtils.themeConfiguration(ref).fontFamily)
                      .h4(),
                ),
                Text(
                  'No application has been initialized yet',
                  style: TypeUtil(context: context).body(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
