import 'package:flutter/material.dart';
import 'package:food_ninja/core/themes/app_palette.dart';

class AppThemes {
  static final lightTheme =
      ThemeData(scaffoldBackgroundColor: AppPalette.lightScaffoldBackGround);

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: AppPalette.darkScaffoldBackGroundbottomGrad,
      primaryColor: const Color(0xFFFFFFFF));
}
