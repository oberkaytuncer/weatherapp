import 'package:flutter_weatherapp_with_bloc/models/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com';
  final http.Client httpClient = http.Client();

  Future<int> getLocationIDApi(String cityName) async {
    final cityURL = baseUrl + '/api/location/search/?query=' + cityName;
    final responseCityUrl = await httpClient.get(cityURL);

    if (responseCityUrl.statusCode != 200) {
      throw Exception("Veri getirilemedi");
    }

    final responseJsonCityUrl = (jsonDecode(responseCityUrl.body)) as List;

    return responseJsonCityUrl[0]['woeid'];
  }

  Future<Weather> getWeatherApi(int cityID) async {
    final weatherURL = baseUrl + '/api/location/' + cityID.toString() + '/';
    final responseWeatherUrl = await httpClient.get(weatherURL);

    if (responseWeatherUrl.statusCode != 200) {
      throw Exception("Hava durumu getirilemedi");
    }

    final responseJsonWeatherUrl = (jsonDecode(responseWeatherUrl.body)) ;

    return Weather.fromJson(responseJsonWeatherUrl);
  }
}
