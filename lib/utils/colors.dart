import 'package:flutter/material.dart';

class AppColor {
  //Primary Colors

  static const Color kBgColor = Color(0xff202326);
  static const Color kFaBuColor = Color.fromARGB(255, 204, 17, 237);
  static const Color kCardColor = Color(0xff2F3235);
  static const Color kWhiteColor = Colors.white;

  //Gradient Colors

  static const int gradientStart = 0xFF01F0FF;
  static const int gradientEnd = 0xFF4441ED;

  static LinearGradient primaryGradientColor = const LinearGradient(
    colors: [
      Color(gradientStart),
      Color(gradientEnd),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
