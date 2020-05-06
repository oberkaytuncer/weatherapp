import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/theme/theme_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/weather/weather_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/locator.dart';

import 'Widget/weather_app.dart';

void main() {
  setupLocator();
  runApp(
    BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<ThemeBloc>(context);
    return BlocBuilder(
      bloc: _bloc,
      builder: (BuildContext context, ThemeState state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: (state as AppTheme).theme,
          home: BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(),
            child: WeatherApp(),
          ),
        );
      },
    );
  }
}
