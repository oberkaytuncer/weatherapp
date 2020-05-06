import 'package:flutter_weatherapp_with_bloc/data/weather_api_client.dart';
import 'package:flutter_weatherapp_with_bloc/locator.dart';
import 'package:flutter_weatherapp_with_bloc/models/weather.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();
  Future<Weather> getWeather(String city) async {
    final int cityID = await weatherApiClient.getLocationIDApi(city);
    return await weatherApiClient.getWeatherApi(cityID);
  }
}
