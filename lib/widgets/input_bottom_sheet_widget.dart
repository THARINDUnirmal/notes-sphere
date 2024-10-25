import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/app_constants.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';

class InputBottomSheetWidget extends StatefulWidget {
  const InputBottomSheetWidget({super.key});

  @override
  State<InputBottomSheetWidget> createState() => _InputBottomSheetWidgetState();
}

class _InputBottomSheetWidgetState extends State<InputBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.kDefaultPdding,
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        color: AppColor.kCardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            30,
          ),
          topRight: Radius.circular(
            30,
          ),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            height: AppConstants.kDefaultPdding * 3,
          ),
          Row(
            children: [
              Text(
                "Create a New Note",
                style: AppTextStyles.appLaegeDescription,
              ),
              const Spacer(),
              Icon(
                Icons.arrow_right_outlined,
                size: 30,
                color: AppColor.kWhiteColor.withOpacity(0.6),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Create New Note Categeory",
                style: AppTextStyles.appLaegeDescription,
              ),
              const Spacer(),
              Icon(
                Icons.arrow_right_outlined,
                size: 30,
                color: AppColor.kWhiteColor.withOpacity(0.6),
              ),
            ],
          )
        ],
      ),
    );
  }
}
