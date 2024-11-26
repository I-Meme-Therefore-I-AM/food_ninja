import 'package:flutter/material.dart';
import 'package:food_ninja/core/themes/app_color.dart';

class AppThemes {
  static final lightMode = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.whiteBackgroundColor1,
    primaryColor: Color(0xFF53E88B),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.white,
        textStyle: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
    //   backgroundColor:
    // ))
  );

  static final darkMode = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.darkBackGroundColor1,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.white,
        textStyle: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}
