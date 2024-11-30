import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 400),
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.green.shade300.withOpacity(0.2),
        ),
      ),
    );
  }
}
