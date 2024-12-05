import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/core/themes/app_palette.dart';

class AuthContainer extends StatelessWidget {
  final String text;
  final String iconPath;
  const AuthContainer({super.key, required this.text, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: 152,
      height: 57,
      decoration: BoxDecoration(
          color: AppPalette.subTextColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 16,
                color: AppPalette.subTextColor,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
