part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {
  final ThemeMode sysMode;

  const ThemeEvent(this.sysMode);
}
