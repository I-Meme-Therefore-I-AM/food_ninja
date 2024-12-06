import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/images/app_vectors.dart';
import 'package:food_ninja/core/themes/app_palette.dart';
import 'package:food_ninja/core/widgets/gradient_button.dart';

class SecondSplashPage extends StatelessWidget {
  const SecondSplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      Navigator.pushNamedAndRemoveUntil(
          context, "/third_splash_page", (routes) => false);
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppVectors.eateryBg),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Find your  Comfort\nFood here",
            style: TextStyle(
                color: AppPalette.subTextColor,
                fontSize: 22,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Here You Can find a chef or dish for every\ntaste and color. Enjoy!",
            style: TextStyle(
                fontSize: 13.5,
                fontFamily: "BentonSans Book",
                color: AppPalette.subTextColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 35,
          ),
          GradientButton(
              onPressed: onPressed,
              fontSize: 16,
              height: 57,
              width: 157,
              child: Text(
                "Next",
                style: TextStyle(
                    color: AppPalette.subTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )),
        ],
      ),
    );
  }
}
