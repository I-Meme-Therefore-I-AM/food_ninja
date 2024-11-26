import 'package:flutter/material.dart';
import 'package:food_ninja/core/images/app_vectors.dart';
import 'package:food_ninja/splash/widgets/splash.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.light
        ? AppVectors.welcomeImage
        : AppVectors.darkWelcomeImage;
    const String title = "Find your  Comfort\nFood here";
    const String buttonName = "Next";
    const String subTitle =
        "Here You Can find a chef or dish for every\ntaste and color. Enjoy!";
    return Scaffold(
      body: Splash(
          isDark: isDark,
          title: title,
          buttonName: buttonName,
          subTitle: subTitle),
    );
  }
}
