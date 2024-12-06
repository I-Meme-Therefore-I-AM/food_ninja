import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/images/app_vectors.dart';
import 'package:food_ninja/core/themes/app_palette.dart';
import 'package:food_ninja/core/widgets/gradient_button.dart';
import 'package:food_ninja/features/profile/utils/back_arrow.dart';
import 'package:food_ninja/features/profile/utils/payment_container.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.rightTopBg),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppPalette.darkScaffoldBackGroundTopGrad.withOpacity(0.69),
                  AppPalette.darkScaffoldBackGroundbottomGrad
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          backArrow(context),
          Positioned(
            top: 120,
            left: 22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Method",
                  style: TextStyle(
                    fontSize: 25,
                    color: AppPalette.subTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "This data will be displayed in your account\nprofile for security",
                  style:
                      TextStyle(color: AppPalette.subTextColor, fontSize: 12),
                ),
                SizedBox(
                  height: 20,
                ),
                PaymentContainer(
                  imagePath: AppVectors.paypal,
                  width: 86,
                  height: 23,
                ),
                SizedBox(
                  height: 20,
                ),
                PaymentContainer(
                  imagePath: AppVectors.visa,
                  width: 60,
                  height: 60,
                ),
                SizedBox(
                  height: 20,
                ),
                PaymentContainer(
                  imagePath: AppVectors.payoneer,
                  width: 83,
                  height: 32,
                ),
                // Spacer(),
              ],
            ),
          ),
          Positioned(
            top: 700,
            left: 120,
            child: GradientButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/upload_photo");
                },
                height: 57,
                width: 157,
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: AppPalette.subTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}
