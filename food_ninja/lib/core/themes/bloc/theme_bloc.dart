import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.system) {
    on<ThemeEvent>((event, emit) {
      print(event.sysMode == ThemeMode.light);
      emit(event.sysMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
    });
  }
}
