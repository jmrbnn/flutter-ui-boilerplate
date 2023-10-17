import 'package:emp_ai_flutter_boilerplate/src/core/router/routers.dart';
import 'package:flutter/material.dart';

class RouteInfo {
  final String name;
  final String url;
  final bool authenticated;
  final Widget? icon;
  final bool isMenuItem;
  final bool isRealmTenantMenu;

  RouteInfo({
    required this.name,
    required this.url,
    required this.authenticated,
    this.icon,
    this.isMenuItem = false,
    this.isRealmTenantMenu = false,
  });
}

final List<RouteInfo> routeList = Routes.values
    .where((route) => route.isMenuItem)
    .map((route) => RouteInfo(
          name: route.name,
          url: route.url,
          authenticated: route.authenticated,
          icon: route.icon,
          isMenuItem: route.isMenuItem,
          isRealmTenantMenu: route.isRealmTenantMenu,
        ))
    .toList();
