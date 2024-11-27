import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/auth/widgets/auth_field.dart';
import 'package:food_ninja/core/images/app_images.dart';
import 'package:food_ninja/core/images/app_vectors.dart';
import 'package:food_ninja/core/themes/app_color.dart';
import 'package:food_ninja/core/widgets/button.dart';
import 'package:food_ninja/splash/widgets/gradient_text.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final contColor = Theme.of(context).brightness == Brightness.light
        ? AppColor.lightCont
        : AppColor.darkCont;
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
                    "Login To Your Account",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                // text input
                _emailField(),

                SizedBox(
                  height: 10,
                ),
                _passwordField(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Or Continue With",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),

                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 57,
                      width: 157,
                      decoration: BoxDecoration(
                          color: contColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppVectors.fb),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Google",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          )
                        ],
                      ),
                    )),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Container(
                      height: 57,
                      width: 157,
                      decoration: BoxDecoration(
                          color: contColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppVectors.google),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Google",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          )
                        ],
                      ),
                    )),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                // todo implement a forgot password screen
                GradientText(
                    size: 12,
                    text: "Forgot Your Password?",
                    fontWeight: FontWeight.w500),

                SizedBox(
                  height: 15,
                ),

                // signUp
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/sign_up");
                  },
                  child: GradientText(
                      size: 14, text: "Sign up", fontWeight: FontWeight.w500),
                ),

                // todo implemente a login button routes
                SizedBox(
                  height: 30,
                ),
                Button(width: 141, height: 57, text: "Login", onPressed: () {})
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _emailField() {
    return AuthField(text: _emailText, hintText: "Email");
  }

  Widget _passwordField() {
    return AuthField(text: _passwordText, hintText: "Password");
  }
}
