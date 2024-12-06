import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/core/images/app_images.dart';
import 'package:food_ninja/core/images/app_vectors.dart';
import 'package:food_ninja/core/themes/app_palette.dart';
import 'package:food_ninja/core/widgets/form_field.dart';
import 'package:food_ninja/core/widgets/gradient_button.dart';
import 'package:food_ninja/core/widgets/gradient_text.dart';
import 'package:food_ninja/features/auth/widgets/auth_container.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Stack(
          children: [
            SvgPicture.asset(AppVectors.pattern),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      AppPalette.darkScaffoldBackGroundbottomGrad
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.35, 1.0]),
              ),
            ),
            Positioned(top: 50, left: 100, child: Image.asset(AppImages.logo)),
            const Positioned(
              left: 110,
              top: 190,
              child: GradientText(
                  text: "FoodNinja",
                  size: 40,
                  fontFamily: "Viga",
                  fontWeight: FontWeight.w500),
            ),
            const Positioned(
                top: 230,
                left: 130,
                child: Text(
                  "Deliever Favorite Food",
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      color: AppPalette.subTextColor),
                )),
            Positioned(
              top: 330,
              left: 30,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    "Login To Your Account",
                    style: TextStyle(
                        color: AppPalette.subTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  _emailFormField(),
                  const SizedBox(
                    height: 10,
                  ),
                  _passwordFormField(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Or Continue With",
                    style: TextStyle(
                        color: AppPalette.subTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  //TODO handle user social auth... login
                  const Row(
                    children: [
                      AuthContainer(
                        text: "Facebook",
                        iconPath: AppVectors.facebook,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      AuthContainer(
                        text: "Google",
                        iconPath: AppVectors.google,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //TODO implement user forgot password route
                  const GradientText(
                      text: "Forgot Your Password?",
                      size: 12,
                      fontFamily: "BentonSans",
                      fontWeight: FontWeight.w600),

                  // TODO handle user login request to the app
                  const SizedBox(
                    height: 50,
                  ),
                  GradientButton(
                      onPressed: () {},
                      height: 57,
                      width: 141,
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppPalette.subTextColor),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _emailFormField() {
    return CustomFormField(
        controller: _passwordController,
        hintText: "Email",
        validator: (value) {
          if (!EmailValidator.validate(value!)) {
            return "Invalid email address provided";
          }
          return null;
        });
  }

  Widget _passwordFormField() {
    return CustomFormField(
      controller: _emailController,
      hintText: "Password",
      isObtuseText: true,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "Password cannot be field empty";
        }

        if (value.length < 6) {
          return "Password length needs to be less than 6";
        }
        return null;
      },
    );
  }
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
