import 'package:flutter/material.dart';
import 'package:food_ninja/core/themes/app_palette.dart';

class GradientButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final double height;
  final double width;
  const GradientButton(
      {super.key,
      required this.child,
      required this.onPressed,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [
            AppPalette.bottomButtonColor,
            AppPalette.topButtonColor,
            // AppPalette
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              // foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              overlayColor: Colors.transparent),
          child: child,
        ),
      ),
    );
  }
}