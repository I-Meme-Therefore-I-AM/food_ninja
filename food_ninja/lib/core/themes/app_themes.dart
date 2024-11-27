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
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(255, 255, 255, 1)),
      ),
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
    //   backgroundColor:
    // ))
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF3B3B3B)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColor.lightCont,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.lightCont),
        ),
        filled: true,
        fillColor: AppColor.lightCont,
        hoverColor: AppColor.lightCont),
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
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColor.darkCont),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColor.darkCont,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.darkCont, width: 1),
        ),
        filled: true,
        fillColor: AppColor.darkCont,
        hoverColor: AppColor.darkCont),
  );
}
