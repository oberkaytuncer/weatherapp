import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/weather/weather_bloc.dart';

class LastUpdateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
        bloc: _weatherBloc,
        builder: (BuildContext context, WeatherState state) {
          var newTime = (state as WeatherLoadedState).weather.time.toLocal();

          return Text(
            "Son güncellenme: " +
                TimeOfDay.fromDateTime(newTime).format(context),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          );
        });
  }
}
