import 'package:flutter/material.dart';

/// provide init function for stateless widgets
class AppStatefulWrapper extends StatefulWidget {
  const AppStatefulWrapper({
    Key? key,
    required this.child,
    this.onInit,
    this.onDispose,
  }) : super(key: key);
  final Function? onInit;
  final Function? onDispose;
  final Widget child;

  @override
  State<AppStatefulWrapper> createState() => _AppStatefulWrapperState();
}

class _AppStatefulWrapperState extends State<AppStatefulWrapper> {
  @override
  void initState() {
    if (widget.onInit != null) widget.onInit!();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  dispose() {
    if (widget.onDispose != null) widget.onDispose!();
    super.dispose();
  }
}
