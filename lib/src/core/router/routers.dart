// ignore_for_file: unused_element

import 'package:flutter/material.dart';

part 'uri_routes.dart';

enum Routes {
  weatherDemo(
    'Weather Demo',
    _Paths.weatherDemo,
  ),
  home(
    'Dashboard',
    _Paths.home,
    authenticated: true,
    isMenuItem: true,
    icon: Icon(Icons.lock_outlined),
  ),
  changePassword(
    'Change password',
    _Paths.changePassword,
    authenticated: true,
  ),
  riverpodDemo(
    'Riverpod Demo',
    _Paths.riverpodDemo,
  ),
  auth(
    'Login',
    _Paths.auth,
  ),
  callback(
    'Callback',
    _Paths.callback,
  ),
  ;

  const Routes(
    this.name,
    this.url, {
    this.authenticated = false,
    this.isMenuItem = false,
    this.isRealmTenantMenu = false,
    this.icon,
    this.rolesList = defaultRoles,
  });
  final String name;
  final String url;
  final bool authenticated;
  final Widget? icon;
  final bool isMenuItem;
  final bool isRealmTenantMenu;
  final List rolesList;
}

const List defaultRoles = [];
