import 'package:flutter/material.dart';
import 'package:food_ninja/core/themes/app_color.dart';

class AuthField extends StatefulWidget {
  final TextEditingController text;
  final String hintText;
  final Widget? child;
  bool obscureText;
  final Function(String?)? validator;
  AuthField({
    super.key,
    required this.text,
    required this.hintText,
    required this.validator,
    this.obscureText = false,
    this.child,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  late bool isObscure;
  @override
  void initState() {
    isObscure = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final contColor = Theme.of(context).brightness == Brightness.light
        ? AppColor.lightCont
        : AppColor.borderColor.withOpacity(0.1);
    final obj = widget.child ?? Text("");

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
            child: obj,
          ),
          Expanded(
            child: Padding(
              padding: obj != Text("")
                  ? EdgeInsets.only(left: 10)
                  : EdgeInsets.only(left: 0),
              child: TextFormField(
                obscureText: isObscure,
                autocorrect: !widget.obscureText,
                keyboardType: !widget.obscureText
                    ? TextInputType.emailAddress
                    : TextInputType.text,
                controller: widget.text,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  suffixIcon: widget.obscureText
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              // widget.obscureText = !isObscure;
                              isObscure = !isObscure;
                            });
                          },
                          icon: isObscure == false
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          color: Colors.green.withOpacity(0.3),
                        )
                      : null,
                ),
                cursorColor: Colors.black45,
                style: TextStyle(fontSize: 14),
                autofillHints: [AutofillHints.email, AutofillHints.username],
                validator: (value) =>
                    widget.validator!(widget.text.text.trim()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
