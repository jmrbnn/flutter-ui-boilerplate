import 'package:flutter/material.dart';

/// provide init function for stateless widgets
class StatefulWrapper extends StatefulWidget {
  const StatefulWrapper({
    Key? key,
    required this.child,
    this.onInit,
    this.onDispose,
  }) : super(key: key);
  final Function? onInit;
  final Function? onDispose;
  final Widget child;

  @override
  State<StatefulWrapper> createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
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
