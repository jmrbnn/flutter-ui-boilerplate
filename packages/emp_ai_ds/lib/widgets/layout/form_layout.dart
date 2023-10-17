import 'package:emp_ai_ds/utils/utils.dart';
import 'package:flutter/material.dart';

class FormLayout extends StatelessWidget {
  final Widget? child;
  final double paddingX;
  final double paddingY;
  final bool isScrollable;
  final Function? onBack;
  final Widget? floatingAction;
  final bool isVerticallyCentered;
  const FormLayout({
    super.key,
    this.child,
    this.paddingX = 24,
    this.paddingY = 24,
    this.isScrollable = true,
    this.onBack,
    this.floatingAction,
    this.isVerticallyCentered = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: isVerticallyCentered
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          child ?? DsUtils.emptyWidget,
        ],
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Visibility(
          visible: isScrollable,
          replacement: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: paddingX,
            ),
            child: content,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: paddingX,
              ),
              child: content,
            ),
          ),
        ),
      ),
      floatingActionButton: floatingAction,
    );
  }
}
