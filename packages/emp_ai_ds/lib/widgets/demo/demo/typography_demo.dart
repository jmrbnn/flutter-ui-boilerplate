import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TypographyDemo extends ConsumerStatefulWidget {
  final String demoString;
  const TypographyDemo({
    super.key,
    this.demoString =
        "I know you've made 30 iterations but can we go back to the first one that was the best version.",
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TypographyDemoState();
}

class _TypographyDemoState extends ConsumerState<TypographyDemo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Display",
                  style: TextUtil(context).displayM(),
                ),
                Text(
                  "Large text on the screen that are mostly used for important text on hero banners, and marketing sites. This text is reserved for short messaging and usually in bold weight.",
                  style: TextUtil(context).labelL(),
                ),
              ],
            ),
          ),
          Divider(color: ref.watch(colorProvider).divider),
          TextDemoItem(
            title: 'Large',
            child: Text(
              widget.demoString,
              style: TextUtil(context).displayL(),
            ),
          ),
          TextDemoItem(
            title: 'Medium',
            child: Text(
              widget.demoString,
              style: TextUtil(context).displayM(),
            ),
          ),
          TextDemoItem(
            title: 'Small',
            child: Text(
              widget.demoString,
              style: TextUtil(context).displayS(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Heading",
                  style: TextUtil(context).displayM(),
                ),
                Text(
                  "Used to identify a group or section in a page and is usually at the top in hierarchy of information.",
                  style: TextUtil(context).labelL(),
                ),
              ],
            ),
          ),
          Divider(color: ref.watch(colorProvider).divider),
          TextDemoItem(
            title: 'Large',
            child: Text(
              widget.demoString,
              style: TextUtil(context).headingL(),
            ),
          ),
          TextDemoItem(
            title: 'Medium',
            child: Text(
              widget.demoString,
              style: TextUtil(context).headingM(),
            ),
          ),
          TextDemoItem(
            title: 'Small',
            child: Text(
              widget.demoString,
              style: TextUtil(context).headingS(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Label",
                  style: TextUtil(context).displayM(),
                ),
                Text(
                  "Labels are used in short phrases or sentences to define a specific block of text.",
                  style: TextUtil(context).labelL(),
                ),
              ],
            ),
          ),
          Divider(color: ref.watch(colorProvider).divider),
          TextDemoItem(
            title: 'Large',
            child: Text(
              widget.demoString,
              style: TextUtil(context).labelL(),
            ),
          ),
          TextDemoItem(
            title: 'Medium',
            child: Text(
              widget.demoString,
              style: TextUtil(context).labelM(),
            ),
          ),
          TextDemoItem(
            title: 'Small',
            child: Text(
              widget.demoString,
              style: TextUtil(context).labelS(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Body",
                  style: TextUtil(context).displayM(),
                ),
                Text(
                  "Used for longer blocks of text, and interactive components such as, but not limited to, forms, buttons, lists, dialog boxes, toasts, etc.",
                  style: TextUtil(context).labelL(),
                ),
              ],
            ),
          ),
          Divider(color: ref.watch(colorProvider).divider),
          TextDemoItem(
            title: 'Large',
            child: Text(
              widget.demoString,
              style: TextUtil(context).bodyL(),
            ),
          ),
          TextDemoItem(
            title: 'Medium',
            child: Text(
              widget.demoString,
              style: TextUtil(context).bodyM(),
            ),
          ),
          TextDemoItem(
            title: 'Small',
            child: Text(
              widget.demoString,
              style: TextUtil(context).bodyS(),
            ),
          ),
        ],
      ),
    );
  }
}

class TextDemoItem extends ConsumerWidget {
  final String title;
  final Widget child;
  const TextDemoItem({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextUtil(
                  context,
                  color: ref.watch(colorProvider).primary,
                ).headingL(),
              ),
              const SizedBox(height: 8),
              child,
            ],
          ),
        ),
      );
    });
  }
}
