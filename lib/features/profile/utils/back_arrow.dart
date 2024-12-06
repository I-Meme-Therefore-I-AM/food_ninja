import 'package:flutter/material.dart';

Widget backArrow(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: EdgeInsets.only(right: 5),
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: Color(0xFFF9A84D).withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Color(0XFFFF9012),
          ),
        ),
      ),
    ),
  );
}
