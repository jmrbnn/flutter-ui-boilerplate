import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  final Widget? child;
  final double paddingX;
  final double paddingY;
  final bool isScrollable;
  const PageLayout({
    super.key,
    this.child,
    this.paddingX = 24,
    this.paddingY = 24,
    this.isScrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: paddingX,
          horizontal: paddingY,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: child),
          ],
        ),
      ),
    );
    return Scaffold(
      body: Visibility(
        visible: isScrollable,
        replacement: content,
        child: SingleChildScrollView(
          child: content,
        ),
      ),
    );
  }
}
