import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/core/images/app_vectors.dart';
import 'package:food_ninja/core/widgets/button.dart';

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
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          _imageBackground(isDark),
          Text(
            "Find your  Comfort\nFood here",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Here You Can find a chef or dish for every\ntaste and color. Enjoy!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 70,
          ),
          Button(width: 157, height: 57, text: "Next", onPressed: () {},),
        ],
      ),
    ));
  }

  Widget _imageBackground(String imagePath) {
    return SvgPicture.asset(imagePath);
    // return Image.asset(imagePath);
  }
}
