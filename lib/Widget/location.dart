import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/weather/weather_bloc.dart';

class LocationWidget extends StatelessWidget {
  //final String selectedCity;

  //LocationWidget({@required this.selectedCity});
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (BuildContext context, WeatherState state) {
        return Text(
          (state as WeatherLoadedState).weather.title.toString() ,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        );
      },
    );
  }
}
