import 'package:flutter/material.dart';
import 'package:food_ninja/core/themes/app_color.dart';

class GradientText extends StatelessWidget {
  final double size;
  final String text;
  final FontWeight fontWeight;
  final String? fontStyle;
  const GradientText(
      {super.key,
      required this.size,
      required this.text,
      required this.fontWeight,
      this.fontStyle});

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
        colors: [AppColor.primaryGradient1, AppColor.primaryGradient2],
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter);
    return ShaderMask(
      shaderCallback: (bonds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bonds.height, bonds.width),
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: size,
            fontWeight: fontWeight,
            fontFamily: fontStyle ?? "BentonSans",
            color: Colors.white),
      ),
    );
  }
}
