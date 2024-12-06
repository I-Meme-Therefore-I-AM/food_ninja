import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentContainer extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  const PaymentContainer({super.key, required this.imagePath, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 73,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFFFFFFF).withOpacity(0.1),
      ),
      child: Center(
        child: SvgPicture.asset(
          imagePath,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
