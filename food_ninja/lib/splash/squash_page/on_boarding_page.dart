import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/core/images/app_images.dart';
import 'package:food_ninja/core/images/app_vectors.dart';
import 'package:food_ninja/core/themes/bloc/theme_bloc.dart';
import 'package:food_ninja/splash/squash_page/welcome_page.dart';
import 'package:food_ninja/splash/widgets/gradient_text.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  void initState() {
    redirect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeMode>(
      builder: (context, state) {
        return Scaffold(
            body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: SvgPicture.asset(AppVectors.pattern),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Image.asset(AppImages.logo)),
                SizedBox(
                  height: 10,
                ),
                GradientText(
                  size: 40,
                  text: "Food NinJa",
                  fontWeight: FontWeight.w400,
                  fontStyle: "Viga",
                ),
                Text(
                  "Deliever Favorite Food",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                )
              ],
            )
          ],
        ));
      },
    );
  }

  Future<void> redirect() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WelcomePage()));
  }
}
