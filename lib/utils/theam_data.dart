import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/colors.dart';

class AppTheamData {
  static ThemeData darkTheam = ThemeData(
    primaryColor: ThemeData.dark().primaryColor,
    scaffoldBackgroundColor: AppColor.kBgColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColor.kWhiteColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.kBgColor,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(
      color: AppColor.kWhiteColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.kFaBuColor,
    ),
  );
}
