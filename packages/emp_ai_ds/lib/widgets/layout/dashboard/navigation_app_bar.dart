import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'navigation_title.dart';

class NavigationAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final Map<String, dynamic>? identity;
  final List<PopupMenuItem>? navbarProfileMenu;
  final Function()? toggleExpand;
  final bool showToggle;
  final Widget toggleTenant;
  const NavigationAppBar({
    super.key,
    this.identity,
    this.navbarProfileMenu,
    this.toggleExpand,
    this.showToggle = true,
    this.toggleTenant = DsUtils.emptyWidget,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // String logo = DsUtils.themeConfiguration(ref).logo ?? '';

    return AppBar(
      title: Wrap(
        children: [
          NavigationTitle(
            title: showToggle
                ? IconButton(
                    icon: const Icon(Icons.menu_outlined),
                    onPressed: () {
                      if (toggleExpand != null) toggleExpand!();
                    },
                  )
                : null,
            // title: logo != ''
            //     ? Padding(
            //         padding:
            //             const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            //         child: Image.network(
            //           logo,
            //           width: 100,
            //           height: 100,
            //         ),
            //       )
            //     : null,
          ),
          toggleTenant,
        ],
      ),
      centerTitle: false,
      elevation: 0,
      actions: [
        IconButton(
          padding: EdgeInsets.zero,
          icon: ref.watch(themeModeProvider) == ThemeMode.dark
              ? const Icon(
                  Icons.dark_mode_outlined,
                  size: 16,
                )
              : const Icon(
                  Icons.light_mode_outlined,
                  size: 16,
                ),
          onPressed: () => DsUtils.handleBrightnessChange(ref),
        ),
        const SizedBox(width: 8),
        SelectionArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                identity?['given_name'] ?? '---',
                style: TypeUtil(context: context, weight: FontWeight.w600)
                    .xsmall(),
              ),
              Visibility(
                visible: (identity?['preferred_username'] ?? '') != '',
                child: Text(
                  identity?['preferred_username'] ?? '',
                  style: TypeUtil(
                    context: context,
                  ).xxsmall(),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: PopupMenuButton<void>(
            itemBuilder: (context) =>
                navbarProfileMenu ??
                [
                  PopupMenuItem(
                    child: Text(
                      'Sign out',
                      style: TypeUtil(context: context).xsmall(),
                    ),
                    onTap: () {
                      // Sign out logic
                    },
                  ),
                ],
            child: const Icon(Icons.account_circle_outlined),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
