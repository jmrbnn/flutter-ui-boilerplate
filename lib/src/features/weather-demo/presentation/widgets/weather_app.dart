import 'package:emp_ai_flutter_boilerplate/src/features/weather-demo/domain/entities/weather_details.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/weather-demo/presentation/providers/weather_provider.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/weather-demo/presentation/widgets/cards/condition.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/weather-demo/presentation/widgets/cards/forecast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherApp extends ConsumerStatefulWidget {
  const WeatherApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WeatherAppState();
}

class _WeatherAppState extends ConsumerState<WeatherApp> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      await ref.read(weatherProvider.notifier).getWeatherDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    final WeatherDetails? weather = ref.watch(weatherProvider);
    final Current? current = weather?.current;

    return Wrap(
      children: [
        CurrentWeatherApp(
          current: current,
        ),
        ForecastWidget(weather: weather),
      ],
    );
  }
}
