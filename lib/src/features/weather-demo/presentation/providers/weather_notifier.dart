import 'package:dio/dio.dart';
import 'package:emp_ai_flutter_boilerplate/src/features/weather-demo/domain/entities/weather_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Weather extends StateNotifier<WeatherDetails?> {
  Weather() : super(null);

  final dio = Dio();
  final String weatherApiEndpoint =
      'https://api.weatherapi.com/v1/forecast.json?key=027929fc63f54571b9a23612231310&q=158.62.33.62&days=3&aqi=yes&alerts=no';

  Future<WeatherDetails?> getWeatherDetails() async {
    // Fetch weather response
    Response response = await dio.get(weatherApiEndpoint);

    // Parse response
    WeatherDetails weather_ = WeatherDetails.fromJson(response.data);

    // Update state
    state = weather_;

    return state;
  }
}
