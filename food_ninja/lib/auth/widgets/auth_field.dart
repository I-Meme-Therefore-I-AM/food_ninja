import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final TextEditingController text;
  final String hintText;

  const AuthField({
    super.key,
    required this.text,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 1)
      ]),
      child: TextFormField(
        autocorrect: true,
        controller: text,
        decoration: InputDecoration(hintText: hintText),
        cursorColor: Colors.black45,
      ),
    );
  }
}
