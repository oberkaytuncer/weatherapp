part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent(List<String> list);
}

class ChangeThemeEvent extends ThemeEvent {
  final String weatherStateAbbr;

  ChangeThemeEvent({@required this.weatherStateAbbr}) : super([weatherStateAbbr]);

  @override
  
  List<Object> get props => [weatherStateAbbr];
}

