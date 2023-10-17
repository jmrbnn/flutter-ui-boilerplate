import 'package:emp_ai_flutter_boilerplate/src/features/weather-demo/domain/entities/weather_details.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/weather-demo/presentation/providers/weather_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherProvider =
    StateNotifierProvider<Weather, WeatherDetails?>((ref) => Weather());
