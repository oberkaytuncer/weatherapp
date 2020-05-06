part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState(Set<Object> set);
}

class AppTheme extends ThemeState {
  final ThemeData theme;
  final MaterialColor color;

  AppTheme({@required this.theme, @required this.color}) :super({theme, color});

  @override
  List<Object> get props => [theme, color];
}
