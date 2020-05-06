import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/weather/weather_bloc.dart';

class WeatherPictureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (BuildContext context, WeatherState state) => Column(
        children: <Widget>[
          Text(
            (state as WeatherLoadedState)
                .weather
                .consolidatedWeather[0]
                .theTemp
                .floor()
                .toString(),
            style: TextStyle(fontSize: 24),
          ),
          Image.network(
            'https://www.metaweather.com/static/img/weather/png/' +
                (state as WeatherLoadedState)
                    .weather
                    .consolidatedWeather[0]
                    .weatherStateAbbr +
                '.png',
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }
}
