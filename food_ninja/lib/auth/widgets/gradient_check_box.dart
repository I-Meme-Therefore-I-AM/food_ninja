import 'package:flutter/material.dart';
import 'package:food_ninja/core/themes/app_color.dart';

class GradientCheckBox extends StatelessWidget {
  final bool value;
  final Function(bool?)? onChanged;
  const GradientCheckBox(
      {super.key, required this.onChanged, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
            duration: Duration(milliseconds: 100),
            width: 22,
            height: 22,
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: value
                    ? LinearGradient(
                        colors: [
                          AppColor.primaryGradient1,
                          AppColor.primaryGradient2
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                border:
                    Border.all(color: value ? Colors.transparent : Colors.grey),
                color: value ? null : Colors.white),
            child: value
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12,
                  )
                : null)
      ],
    );
  }
}
