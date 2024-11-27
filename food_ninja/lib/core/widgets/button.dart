import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onPressed;
  const Button(
      {super.key,
      required this.width,
      required this.height,
      required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF53E88B), Color(0xFF15BE77)],
              begin: Alignment.topCenter,
              end: Alignment.topCenter),
          borderRadius: BorderRadius.circular(15)),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
        ),
      ),
    );
  }
}
