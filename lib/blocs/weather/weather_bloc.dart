import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_bloc/data/weather_repository.dart';
import 'package:flutter_weatherapp_with_bloc/locator.dart';
import 'package:flutter_weatherapp_with_bloc/models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = locator<WeatherRepository>();
  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherLoadingState();
      try {
        final Weather takenWeather =
            await weatherRepository.getWeather(event.cityName);

        yield WeatherLoadedState(weather: takenWeather);
      } catch (_) {
        yield WeatherErrorState();
      }
    } else if (event is RefreshWeatherEvent) {
      try {
        final Weather takenWeather =
            await weatherRepository.getWeather(event.cityName);

        yield WeatherLoadedState(weather: takenWeather);
      } catch (_) {
        yield WeatherInitial();
      }
    }
  }
}
