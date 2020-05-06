import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/weather/weather_bloc.dart';

class MaxandMinTemperatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder(
        bloc: _weatherBloc,
        builder: (BuildContext context, WeatherState state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Maximum: " +
                    (state as WeatherLoadedState)
                        .weather
                        .consolidatedWeather[0]
                        .maxTemp
                        .floor()
                        .toString() +
                    " C",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Minimum: " +
                    (state as WeatherLoadedState)
                        .weather
                        .consolidatedWeather[0]
                        .minTemp
                        .floor()
                        .toString() +
                    " C",
                style: TextStyle(fontSize: 20),
              ),
            ],
          );
        },
      ),
    );
  }
}
