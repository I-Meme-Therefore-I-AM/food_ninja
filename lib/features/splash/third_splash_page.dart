import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/images/app_vectors.dart';
import 'package:food_ninja/core/themes/app_palette.dart';
import 'package:food_ninja/core/widgets/gradient_button.dart';

class ThirdSplashPage extends StatelessWidget {
  const ThirdSplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      Navigator.pushNamedAndRemoveUntil(context, "/sign_up", (_) => false);
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppVectors.eateryBg_2),
          const Text(
            "Food Ninja is Where Your\nComfort Food Lives",
            style: TextStyle(
              fontSize: 22,
              color: AppPalette.subTextColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Enjoy a fast and smooth food delivery\nat your doorstep",
            style: TextStyle(color: AppPalette.subTextColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
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
