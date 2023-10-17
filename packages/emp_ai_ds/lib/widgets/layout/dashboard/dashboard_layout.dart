import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DashboardLayout extends StatelessWidget {
  final Widget body;
  const DashboardLayout({
    super.key,
    required this.body,
  });

  static const title = 'EMAPTA Portal';

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      breakpoints: [
        const Breakpoint(start: 0, end: 450, name: MOBILE),
        const Breakpoint(start: 451, end: 960, name: TABLET),
        const Breakpoint(start: 961, end: double.infinity, name: DESKTOP),
      ],
      child: body,
    );
  }
}
