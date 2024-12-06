import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/images/app_images.dart';
import 'package:food_ninja/core/images/app_vectors.dart';
import 'package:food_ninja/core/themes/app_palette.dart';
import 'package:food_ninja/core/utils/current_user.dart';
import 'package:food_ninja/core/utils/snackBar.dart';
import 'package:food_ninja/core/widgets/form_field.dart';
import 'package:food_ninja/core/widgets/gradient_button.dart';
import 'package:food_ninja/core/widgets/gradient_text.dart';
import 'package:food_ninja/features/auth/utils/check_box.dart';
import 'package:food_ninja/features/auth/view_model.dart/auth_view_model.dart';
import 'package:food_ninja/features/auth/widgets/custom_check_box.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLoading = ref.watch(
        authViewModelProvider.select((state) => state?.isLoading == true));

    ref.listen(authViewModelProvider, (_, next) {
      next?.when(
        data: (data) {
          ref.read(currentUserProvider.notifier).setUser(data);
          Navigator.pushNamed(context, "/complete_profile");
        },
        error: (error, st) {
          errorSnackBar(context, error.toString());
        },
        loading: () {},
      );
    });
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
                    "Sign Up For Free",
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
                    height: 90,
                  ),
                  GradientButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await ref.read(authViewModelProvider.notifier).signUp(
                            userName: _usernameController.text,
                            email: _emailController.text,
                            password: _passwordController.text);
                      }
                    },
                    height: 57,
                    width: 141,
                    child: isLoading == false
                        ? Text(
                            "Create Account",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppPalette.subTextColor),
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 4,
                              color: AppPalette.subTextColor,
                            ),
                          ),
                  ),
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
            ),

            // user bool check
            //
            Positioned(
              top: 625,
              left: 40,
              child: Row(
                children: [
                  CustomCheckBox(
                    onChecked: () =>
                        ref.read(checkBoxProvider.notifier).toggleBox(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Keep Me Signed In",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5), fontSize: 12),
                  )
                ],
              ),
            ),

            Positioned(
              top: 655,
              left: 40,
              child: Row(
                children: [
                  CustomCheckBox(
                    onChecked: () {
                      ref.read(checkBoxProvider.notifier).toggleBox();
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Email Me About Special Pricing",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5), fontSize: 12),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailFormField() {
    return CustomFormField(
      controller: _emailController,
      hintText: "Email",
      signUpIcons: SvgPicture.asset(AppVectors.message),
      validator: (value) {
        if (!EmailValidator.validate(value!)) {
          return "Invalid email address passed";
        }

        return null;
      },
    );
  }

  Widget _passwordFormField() {
    return CustomFormField(
      controller: _passwordController,
      hintText: "Password",
      isObtuseText: true,
      signUpIcons: SvgPicture.asset(AppVectors.lock),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "password field is empty";
        }
        if (value.length < 6) {
          return "password is too short";
        }
        return null;
      },
    );
  }

  Widget _usernameFormField() {
    return CustomFormField(
      controller: _usernameController,
      hintText: "Anamwp . . |",
      signUpIcons: SvgPicture.asset(AppVectors.profile),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "username field cannot be empty";
        }

        if (value.length < 3) {
          return "username is too short please make length > 3";
        }
        return null;
      },
    );
  }
}
