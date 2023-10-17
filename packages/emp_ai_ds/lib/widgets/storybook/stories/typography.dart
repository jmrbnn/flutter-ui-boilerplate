import 'package:emp_ai_ds/widgets/demo/demo/typography_demo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StoryTypography extends ConsumerStatefulWidget {
  const StoryTypography({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StoryTypographyState();
}

class _StoryTypographyState extends ConsumerState<StoryTypography> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          height: MediaQuery.of(context).size.height - 50,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width < 500
                  ? 16
                  : MediaQuery.of(context).size.width * .1),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TypographyDemo(
                  demoString: context.knobs.text(
                    label: 'Sample string',
                    description: 'This is the demo string',
                    initial:
                        "I know you've made 30 iterations but can we go back to the first one that was the best version.",
                  ),
                )
              ],
            ),
          ));
    });
  }
}
