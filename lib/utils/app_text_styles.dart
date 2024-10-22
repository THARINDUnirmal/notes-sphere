import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/colors.dart';

class AppTextStyles {
  //Ttitle Style
  static TextStyle appTitle = const TextStyle(
    fontSize: 28,
    color: AppColor.kWhiteColor,
    fontWeight: FontWeight.bold,
  );

  //Sub Title Styles
  static TextStyle appSubTitle = const TextStyle(
    fontSize: 24,
    color: AppColor.kWhiteColor,
    fontWeight: FontWeight.w500,
  );

  //Description large Styles

  static TextStyle appLaegeDescription = const TextStyle(
    fontSize: 20,
    color: AppColor.kWhiteColor,
    fontWeight: FontWeight.w400,
  );

  //Description small Styles

  static TextStyle appSmallDescription = const TextStyle(
    fontSize: 14,
    color: AppColor.kWhiteColor,
    fontWeight: FontWeight.w400,
  );

  //body Styles
  static TextStyle appBody = const TextStyle(
    fontSize: 16,
    color: AppColor.kWhiteColor,
  );

  //button Styles
  static TextStyle appButton = const TextStyle(
    fontSize: 16,
    color: AppColor.kWhiteColor,
    fontWeight: FontWeight.bold,
  );
}
