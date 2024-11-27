import 'package:flutter/material.dart';
import 'package:food_ninja/core/themes/app_color.dart';

class AuthField extends StatelessWidget {
  final TextEditingController text;
  final String hintText;
  final Widget? child;
  const AuthField({
    super.key,
    required this.text,
    required this.hintText,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final contColor = Theme.of(context).brightness == Brightness.light
        ? AppColor.lightCont
        : AppColor.borderColor.withOpacity(0.1);
    final widget = child ?? Text("");
    return Container(
      decoration: BoxDecoration(
          color: contColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 1)
          ],
          border: Border.all(color: AppColor.borderColor.withOpacity(0.1))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: widget,
          ),
          Expanded(
            child: Padding(
              padding: widget != Text("")
                  ? EdgeInsets.only(left: 10)
                  : EdgeInsets.only(left: 0),
              child: TextFormField(
                autocorrect: true,
                controller: text,
                decoration: InputDecoration(hintText: hintText),
                cursorColor: Colors.black45,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
