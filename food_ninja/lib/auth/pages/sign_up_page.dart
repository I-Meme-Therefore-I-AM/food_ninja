import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/auth/widgets/auth_field.dart';
import 'package:food_ninja/auth/widgets/check_tiles.dart';
import 'package:food_ninja/auth/widgets/gradient_check_box.dart';
import 'package:food_ninja/core/images/app_images.dart';
import 'package:food_ninja/core/images/app_vectors.dart';
import 'package:food_ninja/core/themes/app_color.dart';
import 'package:food_ninja/core/widgets/button.dart';
import 'package:food_ninja/splash/widgets/gradient_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();
  final TextEditingController _nameText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final grad2 = Theme.of(context).brightness == Brightness.light
    //     ? Color(0xFFFFFFFF)
    //     : Color(0xFF000000);
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          SvgPicture.asset(AppVectors.pattern),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Column(
              children: [
                Image.asset(AppImages.logo),
                GradientText(
                  size: 40,
                  text: "FoodNinja",
                  fontWeight: FontWeight.w400,
                  fontStyle: "Viga",
                ),
                Text(
                  "Deliever Favorite Food",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),

                // Login In to your account
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    "Sign Up For Free",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                // text input
                _nameField(),
                SizedBox(
                  height: 10,
                ),
                _emailField(),

                SizedBox(
                  height: 10,
                ),
                _passwordField(),

                SizedBox(
                  height: 15,
                ),

                CheckTiles(
                  text: "Keep Me Signed In",
                  child: GradientCheckBox(onChanged: (value) {}, value: true),
                ),
                SizedBox(
                  height: 9,
                ),
                CheckTiles(
                  text: "Email Me About Special Pricing",
                  child: GradientCheckBox(onChanged: (value) {}, value: true),
                ),

                // todo implemente a login button routes
                SizedBox(
                  height: 30,
                ),
                Button(
                    width: 141,
                    height: 57,
                    text: "Create Account",
                    onPressed: () {}),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/log_in");
                  },
                  child: GradientText(
                      size: 12,
                      text: "already have an account?",
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _emailField() {
    final child = SvgPicture.asset(AppVectors.message);
    return AuthField(
      text: _emailText,
      hintText: "Email",
      child: child,
    );
  }

  Widget _passwordField() {
    final child = SvgPicture.asset(AppVectors.lock);
    return AuthField(
      text: _passwordText,
      hintText: "Password",
      child: child,
    );
  }

  Widget _nameField() {
    final child = SvgPicture.asset(AppVectors.profile);
    return AuthField(
      text: _nameText,
      hintText: "Anamwp . . |",
      child: child,
    );
  }
}
