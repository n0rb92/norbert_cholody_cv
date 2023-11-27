import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_darkTheme);

  static final _lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.blue,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
    ),
    dividerColor: Colors.black,
  );

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
      ),
    ),
    dividerColor: Colors.white,
  );

  void toggleTheme() {
    if (state.brightness == Brightness.dark) {
      emit(_lightTheme);
    } else {
      emit(_darkTheme);
    }
  }
}
