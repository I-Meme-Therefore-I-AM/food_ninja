import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/core/images/app_images.dart';
import 'package:food_ninja/core/images/app_vectors.dart';
import 'package:food_ninja/core/themes/app_palette.dart';
import 'package:food_ninja/core/widgets/gradient_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();

    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AppVectors.pattern,
            fit: BoxFit.cover,
            // width: double.infinity,
            height: 400,
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.logo),
              ),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppPalette.darkScaffoldBackGroundbottomGrad,
                  ],
                  stops: [
                    0.01,
                    2.0
                  ]),
            ),
          ),
          const Align(
            alignment: Alignment(0, 0.25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GradientText(
                    text: "FoodNinja",
                    size: 40,
                    fontFamily: "Viga",
                    fontWeight: FontWeight.normal),
                Text(
                  "Deliever Favorite Food",
                  style: TextStyle(
                      color: AppPalette.subTextColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    Navigator.pushNamedAndRemoveUntil(
        context, "/second_splash_page", (route) => false);
  }
}
