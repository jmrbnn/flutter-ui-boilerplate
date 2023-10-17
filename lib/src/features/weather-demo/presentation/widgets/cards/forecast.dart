import 'package:emp_ai_ds/services/theme_service_riverpod.dart';
import 'package:emp_ai_ds/utils/text_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/app_card.dart';
import 'package:emp_ai_ds/widgets/app_custom_button.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/weather-demo/domain/entities/weather_details.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/weather-demo/presentation/widgets/cards/condition.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/weather-demo/presentation/widgets/cards/selected_forecast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicons/unicons.dart';

class ForecastWidget extends ConsumerStatefulWidget {
  final WeatherDetails? weather;
  const ForecastWidget({
    super.key,
    this.weather,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForecastWidgetState();
}

class _ForecastWidgetState extends ConsumerState<ForecastWidget> {
  Forecastday? selectedForecast;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      width: 450,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Visibility(
                visible: selectedForecast != null,
                child: AppCustomButton(
                  iconLeading: UniconsLine.angle_left,
                  padding: EdgeInsets.zero,
                  size: AppCustomButtonSize.xsmall,
                  variant: AppCustomButtonVariant.tertiary,
                  height: 20,
                  width: 30,
                  onPressed: () => setState(() {
                    selectedForecast = null;
                  }),
                ),
              ),
              Text(
                '3-DAY FORECAST',
                style: TextUtil(
                  context,
                  weight: FontWeight.w700,
                  color: ref.watch(colorProvider).contentGray,
                ).bodyL(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Divider(
              color: ref.watch(colorProvider).divider,
            ),
          ),
          selectedForecast != null
              ? SelectedForecast(forecast: selectedForecast)
              : Wrap(
                  runSpacing: 24,
                  children: [
                    ...widget.weather?.forecast?.forecastday
                            ?.take(3)
                            .map<Widget>((forecast) => AppCard(
                                  content: ListTile(
                                    onTap: () {
                                      setState(() {
                                        selectedForecast = forecast;
                                      });
                                    },
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          DsUtils.formatDateTime(
                                                    forecast.date ?? '',
                                                    format: 'EEE',
                                                  ) ==
                                                  DsUtils.formatDateTime(
                                                    DateTime.now().toString(),
                                                    format: 'EEE',
                                                  )
                                              ? 'Today'
                                              : DsUtils.formatDateTime(
                                                  forecast.date ?? '',
                                                  format: 'EEEE',
                                                ),
                                          style: TextUtil(context,
                                                  weight: FontWeight.w700,
                                                  color: ref
                                                      .watch(colorProvider)
                                                      .primaryVariant)
                                              .labelL(),
                                        ),
                                        Text(
                                          forecast.day?.condition?.text ?? '--',
                                          style: TextUtil(context).bodyM(),
                                        ),
                                      ],
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16, bottom: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                              text: TextSpan(
                                                  text: 'Sunrise at ',
                                                  children: [
                                                    TextSpan(
                                                      text: forecast
                                                              .astro?.sunrise ??
                                                          '--',
                                                      style: TextUtil(context,
                                                              weight: FontWeight
                                                                  .w700)
                                                          .bodyM(),
                                                    )
                                                  ],
                                                  style: TextUtil(context)
                                                      .bodyM())),
                                          RichText(
                                              text: TextSpan(
                                                  text: 'Sunset at ',
                                                  children: [
                                                    TextSpan(
                                                      text: forecast
                                                              .astro?.sunset ??
                                                          '--',
                                                      style: TextUtil(context,
                                                              weight: FontWeight
                                                                  .w700)
                                                          .bodyM(),
                                                    )
                                                  ],
                                                  style: TextUtil(context)
                                                      .bodyM())),
                                        ],
                                      ),
                                    ),
                                    trailing: Transform.translate(
                                      offset: const Offset(0, 20),
                                      child: Image.asset(
                                        parseImagePath(
                                            forecast.day?.condition?.icon),
                                      ),
                                    ),
                                  ),
                                )) ??
                        [],
                  ],
                )
        ],
      ),
    );
  }
}
