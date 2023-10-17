import 'package:emp_ai_flutter_boilerplate/src/features/weather-demo/presentation/widgets/weather_app.dart';
import 'package:flutter/material.dart';

class WeatherDemoScreen extends StatelessWidget {
  const WeatherDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: WeatherApp()),
    );
  }
}
