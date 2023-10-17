import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/text_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_button.dart';
import 'package:emp_ai_ds/widgets/app_card.dart';
import 'package:emp_ai_ds/widgets/app_custom_button.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/weather-demo/domain/entities/weather_details.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/weather-demo/presentation/widgets/cards/condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class SelectedForecast extends ConsumerStatefulWidget {
  final Forecastday? forecast;
  const SelectedForecast({super.key, this.forecast});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectedForecastState();
}

class _SelectedForecastState extends ConsumerState<SelectedForecast> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DsUtils.formatDateTime(
                        widget.forecast?.date ?? '',
                        format: 'EEE',
                      ) ==
                      DsUtils.formatDateTime(
                        DateTime.now().toString(),
                        format: 'EEE',
                      )
                  ? 'Today'
                  : DsUtils.formatDateTime(
                      widget.forecast?.date ?? '',
                      format: 'EEEE',
                    ),
              style: TextUtil(context,
                      weight: FontWeight.w700,
                      color: ref.watch(colorProvider).primaryVariant)
                  .headingL(),
            ),
            Text(
              'Weather forecast',
              style: TextUtil(
                context,
              ).labelM(),
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        LayoutBuilder(builder: (context, constraints) {
          return Wrap(
            direction: Axis.vertical,
            spacing: 24,
            children: [
              AppCard(
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Condition forecast',
                      style: TextUtil(context,
                              weight: FontWeight.w700,
                              color: ref.watch(colorProvider).primaryVariant)
                          .labelL(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Wrap(
                        children: [
                          AppCard(
                            content: Row(
                              children: [
                                SizedBox(
                                  width: constraints.maxWidth - 170,
                                  child: Wrap(
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
                                          widget.forecast?.day?.condition
                                                  ?.text ??
                                              '',
                                          maxLines: 5,
                                          style: TextUtil(
                                            context,
                                            weight: FontWeight.w600,
                                            height: 1.2,
                                          ).labelM(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Image.asset(
                                  parseImagePath(
                                      widget.forecast?.day?.condition?.icon),
                                ),
                              ],
                            ),
                          ),
                          ...widget.forecast?.day
                                  ?.toJson()
                                  .keys
                                  .where((key) =>
                                      key != 'condition' &&
                                      key != 'air_quality')
                                  .map<Widget>((e) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  width: constraints.maxWidth / 2 - 30,
                                  child: Column(
                                    children: [
                                      Text(
                                        widget.forecast?.day
                                                ?.toJson()[e]
                                                .toString() ??
                                            '--',
                                        style: TextUtil(context,
                                                weight: FontWeight.w700)
                                            .labelL(),
                                      ),
                                      Text(
                                        e.replaceAll('_', ' ').capitalize ?? '',
                                        style: TextUtil(context).bodyM(),
                                      )
                                    ],
                                  ),
                                );
                              }) ??
                              []
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppCard(
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Astrological forecast',
                      style: TextUtil(context,
                              weight: FontWeight.w700,
                              color: ref.watch(colorProvider).primaryVariant)
                          .labelL(),
                    ),
                    Wrap(
                      children: [
                        ...widget.forecast?.astro
                                ?.toJson()
                                .keys
                                .map<Widget>((e) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                width: constraints.maxWidth / 2 - 30,
                                child: Column(
                                  children: [
                                    Text(
                                      widget.forecast?.astro
                                              ?.toJson()[e]
                                              .toString() ??
                                          '--',
                                      style: TextUtil(context,
                                              weight: FontWeight.w700)
                                          .labelL(),
                                    ),
                                    Text(
                                      e.replaceAll('_', ' ').capitalize ?? '',
                                      style: TextUtil(context).bodyM(),
                                    )
                                  ],
                                ),
                              );
                            }) ??
                            []
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ],
    );
  }
}
