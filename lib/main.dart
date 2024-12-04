import 'package:flutter/material.dart';
import 'package:food_ninja/core/themes/app_themes.dart';
import 'package:food_ninja/features/splash/second_splash_page.dart';
import 'package:food_ninja/features/splash/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const WelcomePage(),
      routes: {
        "/second_splash_page": (context) => const SecondSplashPage(),
      },
    );
  }
}
