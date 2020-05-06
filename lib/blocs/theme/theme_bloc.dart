import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState =>
      AppTheme(theme: ThemeData.dark(), color: Colors.red);

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    AppTheme appTheme;

    if (event is ChangeThemeEvent) {
      switch (event.weatherStateAbbr) {
        case 'sn': //karlı
        case 'sl': //sulu kar
        case 'h': //dolu
        case 't': //fırtına
        case 'hc': //çok bulutlu
          appTheme = AppTheme(
              theme: ThemeData(primaryColor: Colors.brown), color: Colors.grey);
          break;
        case 'hr': //ağır yağmurlu
        case 'lr': //hafif yağmurlu
        case 's': //sağnak yağmurlu
          appTheme = AppTheme(
              theme: ThemeData(primaryColor: Colors.indigoAccent),
              color: Colors.indigo);
          break;

        case 'lc': //az bulutlu
        case 'c': //açık hava
          appTheme = AppTheme(
              theme: ThemeData(primaryColor: Colors.orangeAccent),
              color: Colors.orange);
          break;
      }

      yield appTheme;
    }
  }
}
