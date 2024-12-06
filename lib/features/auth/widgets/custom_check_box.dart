import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ninja/core/themes/app_palette.dart';
import 'package:food_ninja/features/auth/utils/check_box.dart';

class CustomCheckBox extends ConsumerWidget {
  final Function()? onChecked;
  const CustomCheckBox({super.key, required this.onChecked});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = ref.watch(checkBoxProvider);

    return GestureDetector(
      onTap: onChecked,
      child: AnimatedContainer(
          width: 22,
          height: 22,
          duration: const Duration(milliseconds: 1),
          curve: Curves.bounceIn,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                colors: isChecked
                    ? [AppPalette.topButtonColor, AppPalette.bottomButtonColor]
                    : [
                        Colors.white.withOpacity(0.1),
                        Colors.white.withOpacity(0.1)
                      ],
                begin: Alignment.center,
                end: Alignment.topRight),
          ),
          child: isChecked
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 8 + 5.5,
                )
              : null),
    );
  }
}
