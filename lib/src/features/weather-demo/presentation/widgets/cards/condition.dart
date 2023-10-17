import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/app_shadows.dart';
import 'package:emp_ai_ds/utils/text_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_card.dart';
import 'package:emp_ai_ds/widgets/app_custom_button.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/weather-demo/domain/entities/weather_details.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/weather-demo/presentation/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicons/unicons.dart';

class CurrentWeatherApp extends ConsumerStatefulWidget {
  final Current? current;
  const CurrentWeatherApp({
    super.key,
    this.current,
  });

  @override
  ConsumerState<CurrentWeatherApp> createState() => _CurrentWeatherAppState();
}

class _CurrentWeatherAppState extends ConsumerState<CurrentWeatherApp> {
  bool isFetching = false;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      width: 290,
      margin: const EdgeInsets.all(24),
      boxShadow: AppShadows.mediumBottom,
      boxDecoration: BoxDecoration(
        color: widget.current?.isDay == 0
            ? ref.watch(colorProvider).card40
            : ref.watch(colorProvider).card0,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [AppShadows.mediumBottom],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            ref.watch(colorProvider).backgroundDim.withOpacity(0.1),
            BlendMode.dstATop,
          ),
          image:
              ExactAssetImage(parseImagePath(widget.current?.condition?.icon)),
          fit: BoxFit.cover,
        ),
      ),
      borderRadiusGeometry: BorderRadius.circular(24),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      content: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 8,
              children: [
                isFetching
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: 35,
                            width: 35,
                            child: CircularProgressIndicator(
                              strokeWidth: 8,
                              strokeCap: StrokeCap.round,
                              color: ref
                                  .watch(colorProvider)
                                  .primaryVariant
                                  .withOpacity(.5),
                            )),
                      )
                    : Transform.translate(
                        offset: const Offset(0, -5),
                        child: Image.asset(
                          parseImagePath(widget.current?.condition?.icon),
                        ),
                      ),
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Wrap(
                      children: [
                        Text(
                          'Condition',
                          style: TextUtil(
                            context,
                          ).bodyM(),
                        ),
                      ],
                    ),
                    Container(
                      width: constraints.maxWidth - 75,
                      margin: const EdgeInsets.only(top: 4),
                      child: DsUtils.textWithEllipsis(
                        widget.current?.condition?.text ?? '',
                        maxLines: 5,
                        style: TextUtil(
                          context,
                          weight: FontWeight.w600,
                          height: 1.2,
                        ).labelM(),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Divider(
              color: ref.watch(colorProvider).divider,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      'Last updated',
                      style: TextUtil(context,
                              color: ref.watch(colorProvider).contentGray,
                              weight: FontWeight.w600)
                          .bodyM(),
                    ),
                    Text(
                      DsUtils.formatDateTime(
                        widget.current?.lastUpdated ?? '',
                        format: 'MMMM dd yyyy, h:mm:ss',
                      ),
                      style: TextUtil(
                        context,
                        color: ref.watch(colorProvider).contentGray,
                      ).bodyM(),
                    ),
                  ],
                ),
                AppCustomButton(
                  size: AppCustomButtonSize.small,
                  variant: AppCustomButtonVariant.tertiary,
                  type: AppCustomButtonTypes.iconOnly,
                  iconTrailing: UniconsLine.refresh,
                  isDisabled: isFetching,
                  color: ref.watch(colorProvider).contentGray,
                  onPressed: () async {
                    setState(() {
                      isFetching = true;
                    });

                    await ref
                        .watch(weatherProvider.notifier)
                        .getWeatherDetails();

                    setState(() {
                      isFetching = false;
                    });
                  },
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}

String parseImagePath(String? imgUrl) {
  return imgUrl?.replaceAll(
          '//cdn.weatherapi.com/weather/64x64/', 'assets/weather_icon_pack/') ??
      '';
}
