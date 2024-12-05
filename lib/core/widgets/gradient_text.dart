// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_ninja/core/themes/app_palette.dart';

class GradientText extends StatelessWidget {
  final String text;
  final double size;
  final String fontFamily;
  final FontWeight fontWeight;
  const GradientText({
    super.key,
    required this.text,
    required this.size,
    required this.fontFamily,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    const LinearGradient gradient = LinearGradient(colors: [
      AppPalette.headerTextgradientTop,
      AppPalette.headerTextgradientBelow
    ], begin: Alignment.centerLeft, end: Alignment.topRight);
    return ShaderMask(
      shaderCallback: (bounds) =>
          gradient.createShader(const Rect.fromLTWH(10, 10, 10, 10)),
      blendMode: BlendMode.srcIn,
      child: Text(
        text,
        style: TextStyle(
            fontSize: size, fontFamily: fontFamily, fontWeight: fontWeight),
      ),
    );
  }
}
