import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/widgets/button.dart';

class Splash extends StatelessWidget {
  final String isDark;
  final String title;
  final String subTitle;
  final String buttonName;
  final VoidCallback onPressed;
  const Splash({
    super.key,
    required this.isDark,
    required this.title,
    required this.buttonName,
    required this.subTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          _imageBackground(isDark),
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 60,
          ),
          Button(
            width: 157,
            height: 57,
            text: buttonName,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  Widget _imageBackground(String imagePath) {
    return SvgPicture.asset(imagePath);
    // return Image.asset(imagePath);
  }
}
