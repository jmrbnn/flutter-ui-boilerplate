import 'dart:async';

import 'package:flutter/widgets.dart';

class StreamControllerProvider extends InheritedWidget {
  final StreamController streamController;

  const StreamControllerProvider({
    super.key,
    required this.streamController,
    required Widget child,
  }) : super(child: child);

  static StreamControllerProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<StreamControllerProvider>();
  }

  @override
  bool updateShouldNotify(StreamControllerProvider oldWidget) {
    return streamController != oldWidget.streamController;
  }
}
