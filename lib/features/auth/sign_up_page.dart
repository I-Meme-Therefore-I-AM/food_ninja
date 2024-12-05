import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/images/app_images.dart';
import 'package:food_ninja/core/images/app_vectors.dart';
import 'package:food_ninja/core/themes/app_palette.dart';
import 'package:food_ninja/core/widgets/form_field.dart';
import 'package:food_ninja/core/widgets/gradient_button.dart';
import 'package:food_ninja/core/widgets/gradient_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
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
              top: 350,
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
                  _usernameFormField(),
                  const SizedBox(
                    height: 10,
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
                  const SizedBox(
                    height: 50,
                  ),
                  GradientButton(
                      text: "Create Account",
                      onPressed: () {},
                      fontSize: 16,
                      height: 57,
                      width: 141),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamedAndRemoveUntil(
                        context, "/sign_in", (_) => false),
                    child: const GradientText(
                        text: "already have an account?",
                        size: 12,
                        fontFamily: "BentonSans",
                        fontWeight: FontWeight.w600),
                  ),
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
      signUpIcons: SvgPicture.asset(AppVectors.message),
    );
  }

  Widget _passwordFormField() {
    return CustomFormField(
      controller: _emailController,
      hintText: "Password",
      isObtuseText: true,
      signUpIcons: SvgPicture.asset(AppVectors.lock),
    );
  }

  Widget _usernameFormField() {
    return CustomFormField(
      controller: _usernameController,
      hintText: "Anamwp . . |",
      signUpIcons: SvgPicture.asset(AppVectors.profile),
    );
  }
}
