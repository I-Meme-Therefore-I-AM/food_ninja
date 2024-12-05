// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_ninja/core/themes/app_palette.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final double? width;
  final double? height;
  final bool isObtuseText;
  const CustomFormField(
      {super.key,
      required this.controller,
      this.hintText,
      this.labelText,
      this.width,
      this.height,
      this.isObtuseText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 325,
      height: height ?? 57,
      decoration: BoxDecoration(
          color: AppPalette.subTextColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: isObtuseText,
        controller: controller,
        cursorColor: AppPalette.subTextColor.withOpacity(0.3),
        style: const TextStyle(color: AppPalette.subTextColor),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20),
            hintText: hintText,
            labelText: labelText,
            labelStyle: TextStyle(
                color: AppPalette.subTextColor.withOpacity(0.3), fontSize: 20),
            hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppPalette.subTextColor.withOpacity(0.3))),
      ),
    );
  }
}
