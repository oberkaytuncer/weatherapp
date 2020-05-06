import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/theme/theme_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/weather/weather_bloc.dart';

import 'gradient_background.dart';
import 'last_update.dart';
import 'location.dart';
import 'max_min_temp.dart';
import 'select_city.dart';
import 'weather_picture.dart';

class WeatherApp extends StatelessWidget {
  String selectedCityFromUser = "Antalya";
  Completer<void> _refreshCompleter = Completer<void>();
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    final _themeBloc = BlocProvider.of<ThemeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
             selectedCityFromUser = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectCityWidget(),
                ),
              );

              if (selectedCityFromUser != null) {
                _weatherBloc
                    .add(FetchWeatherEvent(cityName: selectedCityFromUser));
              }
            },
          ),
        ],
        title: Text("Weather App"),
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherBloc,
          builder: (context, WeatherState state) {
            if (state is WeatherInitial) {
              return Center(child: Text("Şehir seçiniz"));
            }

            if (state is WeatherLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoadedState) {
              final loadedWeather = state.weather;
              final _weatherStateAbbr =
                  loadedWeather.consolidatedWeather[0].weatherStateAbbr;

              _themeBloc
                  .add(ChangeThemeEvent(weatherStateAbbr: _weatherStateAbbr));

              selectedCityFromUser = loadedWeather.title;
              _refreshCompleter.complete();

              _refreshCompleter = Completer();
              loadedWeather.consolidatedWeather[0];
              return BlocBuilder(
                bloc: _themeBloc,
                builder: (context, ThemeState state) {
                  return GradientColorContainer(
                    color: (state as AppTheme).color,
                    child: RefreshIndicator(
                      onRefresh: () {
                        _weatherBloc.add(RefreshWeatherEvent(
                            cityName: selectedCityFromUser));
                        return _refreshCompleter.future;
                      },
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: LocationWidget(
                                //selectedCity: loadedWeather.title,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: LastUpdateWidget()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: WeatherPictureWidget()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: MaxandMinTemperatureWidget()),
                          ),
                          GradientColorContainer(
                           child: Text("asdasdasdasd \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"),
                           color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            if (state is WeatherErrorState) {
              return Center(child: Text("Hata oluştu"));
            }
          },
        ),
      ),
    );
  }
}
