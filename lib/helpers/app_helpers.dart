import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';

class AppHelpers {
  static void appMessenger(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColor.kFaBuColor,
        content: Text(
          text,
          style: AppTextStyles.appSmallDescription,
        ),
        duration: const Duration(
          seconds: 2,
        ),
      ),
    );
  }
}
