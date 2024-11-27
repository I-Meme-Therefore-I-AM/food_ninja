import 'package:flutter/material.dart';

class CheckTiles extends StatelessWidget {
  final String text;
  final Widget child;
  const CheckTiles({super.key, required this.text, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [child, SizedBox(width: 15), Text(text)],
    );
  }
}
