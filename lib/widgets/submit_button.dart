import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: 40,
      decoration: BoxDecoration(
        color: AppColor.kFaBuColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColor.kWhiteColor,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          "Save Note",
          style: AppTextStyles.appButton,
        ),
      ),
    );
  }
}
