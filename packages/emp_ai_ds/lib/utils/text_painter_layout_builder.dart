import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stringProvider = StateProvider<String>((ref) => '');

class TextPainterLayoutBuilder extends ConsumerWidget {
  final Widget? child;
  final double minWidth;
  const TextPainterLayoutBuilder({super.key, this.child, this.minWidth = 100});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final string = ref.watch(stringProvider);

    final textPainter = TextPainter(
      text: TextSpan(text: string, style: TypeUtil().body()),
      textDirection: TextDirection.ltr,
    )..layout();

    final containerWidth = textPainter.width < 35 ? 35 : textPainter.width;

    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: minWidth + containerWidth,
          minWidth: minWidth + containerWidth),
      child: child ?? const SizedBox.shrink(),
    );
  }
}
