import 'package:emp_ai_ds/utils/app_shadows.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/layout/dashboard/navigation_app_bar.dart';
import 'package:emp_ai_ds/widgets/layout/dashboard/navigation_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

ValueNotifier<bool> _isExpanded = ValueNotifier<bool>(false);

class ScaffoldWithNavigation extends StatelessWidget {
  final String appTitle;
  final Widget body;
  final bool authenticated;
  final List<dynamic> navigationItems;
  final GoRouterState state;
  final Map<String, dynamic>? identity;
  final List<PopupMenuItem>? navbarProfileMenu;
  final Widget toggleTenant;
  final Widget? floatingItem;
  const ScaffoldWithNavigation({
    super.key,
    required this.appTitle,
    required this.body,
    required this.authenticated,
    required this.navigationItems,
    required this.state,
    this.identity,
    this.navbarProfileMenu,
    this.toggleTenant = DsUtils.emptyWidget,
    this.floatingItem,
  });

  @override
  Widget build(BuildContext context) {
    return getBody(context);
    // return DashboardLayout(body: getBody(context));
  }

  Widget getBody(
    BuildContext context,
  ) {
    if (!authenticated) return body;
    final breakpoint = ResponsiveBreakpoints.of(context).breakpoint;
    return switch (breakpoint.name) {
      MOBILE || TABLET => _ScaffoldWithDrawer(
          body,
          floatingItem,
          appTitle,
          navigationItems,
          state,
          identity,
          navbarProfileMenu,
          toggleTenant,
        ),
      (_) => _ScaffoldWithNavigationRail(
          body,
          navigationItems,
          state,
          identity,
          navbarProfileMenu,
          toggleTenant,
          floatingItem,
        ),
    };
  }
}

class _ScaffoldWithNavigationRail extends ConsumerStatefulWidget {
  const _ScaffoldWithNavigationRail(
    this.body,
    this.navigationItems,
    this.state,
    this.identity,
    this.navbarProfileMenu,
    this.toggleTenant,
    this.floatingItem,
  );

  final Widget body;
  final List navigationItems;
  final GoRouterState state;
  final Map<String, dynamic>? identity;
  final List<PopupMenuItem>? navbarProfileMenu;
  final Widget toggleTenant;
  final Widget? floatingItem;

  @override
  ConsumerState<_ScaffoldWithNavigationRail> createState() =>
      _ScaffoldWithNavigationRailState();
}

class _ScaffoldWithNavigationRailState
    extends ConsumerState<_ScaffoldWithNavigationRail> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: NavigationAppBar(
          identity: widget.identity,
          navbarProfileMenu: widget.navbarProfileMenu,
          toggleTenant: widget.toggleTenant,
          toggleExpand: () {
            setState(() {
              _isExpanded.value = !_isExpanded.value;
            });
          },
        ),
      ),
      floatingActionButton: widget.floatingItem,
      body: Row(
        children: [
          Column(
            children: [
              Expanded(
                child: _NavigationDrawer(
                  body: widget.body,
                  expand: _isExpanded.value,
                  navigationItems: widget.navigationItems,
                  state: widget.state,
                ),
              ),
            ],
          ),
          // VerticalDivider(
          //   thickness: 1,
          //   width: 1,
          //   color: colorScheme.primary.withOpacity(0.2),
          // ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(top: 8, left: 8),
            decoration: BoxDecoration(
                boxShadow: [
                  AppShadows.cardDefault,
                ],
                color: Theme.of(context).colorScheme.background,
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(24))),
            child: widget.body,
          )),
        ],
      ),
    );
  }
}

class _ScaffoldWithDrawer extends ConsumerWidget {
  const _ScaffoldWithDrawer(
    this.body,
    this.floatingItem,
    this.appTitle,
    this.navigationItems,
    this.state,
    this.identity,
    this.navbarProfileMenu,
    this.toggleTenant,
  );
  final Widget body;
  final Widget toggleTenant;
  final Widget? floatingItem;
  final String appTitle;
  final List<dynamic> navigationItems;
  final GoRouterState state;
  final Map<String, dynamic>? identity;
  final List<PopupMenuItem>? navbarProfileMenu;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String logo = DsUtils.themeConfiguration(ref).logo ?? '';
    return Scaffold(
      appBar: NavigationAppBar(
        identity: identity,
        navbarProfileMenu: navbarProfileMenu,
        toggleTenant: toggleTenant,
        showToggle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: MediaQuery.of(context).size.width < 700 ? 0 : 24),
        child: body,
      ),
      floatingActionButton: floatingItem,
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(border: Border()),
              margin: EdgeInsets.zero,
              child: Center(
                child: NavigationTitle(
                  title: logo != ''
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width < 700
                                ? 0
                                : 24,
                            vertical: 8,
                          ),
                          child: Image.network(
                            logo,
                            width: 100,
                            height: 100,
                          ),
                        )
                      : null,
                ),
              ),
            ),
            Expanded(
              child: _NavigationRail(
                body: body,
                expand: true,
                navigationItems: navigationItems,
                state: state,
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.all(16),
            //   child: ThemeModeButton.outlined(),
            // ),
          ],
        ),
      ),
    );
  }
}

class _NavigationDrawer extends ConsumerWidget {
  const _NavigationDrawer({
    required this.body,
    required this.expand,
    required this.navigationItems,
    required this.state,
  });

  final Widget body;
  final bool expand;
  final List navigationItems;
  final GoRouterState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: expand ? 250 : 85,
      child: NavigationDrawer(
        onDestinationSelected: (index) =>
            context.go(navigationItems[index].url),
        // indicatorColor: Colors.transparent,
        indicatorShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        selectedIndex: _getSelectedScreenIndex(
            currentPath: state.fullPath, list: navigationItems),
        children: <Widget>[
          ...navigationItems.map((destination) {
            bool isActive = state.fullPath == destination.url;

            return NavigationDrawerDestination(
              label: Stack(
                children: [
                  Visibility(
                    visible: expand,
                    child: Center(
                      child: Text(
                        destination.name,
                        style: TypeUtil(
                          context: context,
                          // color: isActive
                          //     ? DsUtils.color(context, ColorSets.neutral,
                          //         variant: 90)
                          //     : null,
                          weight: isActive ? FontWeight.w700 : FontWeight.w400,
                        ).small(),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isActive,
                    child: Transform.translate(
                      offset: const Offset(-65, 0),
                      child: Container(
                        height: 100,
                        width: 7,
                        decoration: BoxDecoration(
                            color: DsUtils.color(context, ColorSets.primary,
                                variant: 60),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(24),
                              bottomRight: Radius.circular(24),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              icon: destination.icon,
            );
          }),
        ],
      ),
    );
  }

  int? _getSelectedScreenIndex({String? currentPath, List? list}) {
    if (currentPath == null || list == null) return null;

    for (var i = 0; i < list.length; i++) {
      if (list[i].url == currentPath) return i;
    }
    return null;
  }
}

class _NavigationRail extends StatelessWidget {
  const _NavigationRail({
    required this.body,
    required this.expand,
    required this.navigationItems,
    required this.state,
  });

  final Widget body;
  final bool expand;
  final List navigationItems;
  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return NavigationRail(
      extended: expand,
      selectedIndex: _getSelectedScreenIndex(
          currentPath: state.fullPath, list: navigationItems),
      // selectedIndex: body.currentIndex,
      unselectedLabelTextStyle: theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w500,
      ),
      selectedLabelTextStyle: theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w700,
      ),
      onDestinationSelected: (index) => context.go(navigationItems[index].url),
      destinations: [
        for (final item in navigationItems)
          NavigationRailDestination(
            padding: EdgeInsets.zero,
            icon: item.icon ?? DsUtils.emptyWidget,
            label: Text(
              item.name,
            ),
          ),
      ],
    );
  }

  _getSelectedScreenIndex({String? currentPath, List? list}) {
    if (currentPath == null || list == null) return null;

    for (var i = 0; i < list.length; i++) {
      if (list[i].url == currentPath) return i;
    }
    return null;
  }
}

// class _ScaffoldWithNavigationBar extends StatelessWidget {
//   const _ScaffoldWithNavigationBar(this.body);

//   final StatefulNavigationShell body;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const NavigationAppBar(),
//       body: body,
//       bottomNavigationBar: NavigationBar(
//         selectedIndex: body.currentIndex,
//         onDestinationSelected: (index) {
//           body.goBranch(
//             index,
//             initialLocation: index == body.currentIndex,
//           );
//         },
//         destinations: [
//           for (final item in NavigationItem.values)
//             NavigationDestination(
//               icon: Icon(item.iconData),
//               label: item.label,
//             ),
//         ],
//       ),
//     );
//   }
// }
