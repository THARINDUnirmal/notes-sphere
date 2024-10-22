import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/app_constants.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';

class ProgressCard extends StatefulWidget {
  final int totalTasks;
  final int completedTasks;

  const ProgressCard(
      {super.key, required this.totalTasks, required this.completedTasks});

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    double persentage = 0;
    widget.totalTasks >= 0
        ? persentage = (widget.completedTasks / widget.totalTasks) * 100
        : 0;
    return Container(
      padding: const EdgeInsets.all(
        AppConstants.kDefaultPdding,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.kCardColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ToDay's Progress",
                style: AppTextStyles.appSubTitle,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Text(
                  "You have completed ${widget.completedTasks} out of ${widget.totalTasks} tasks, keep up the progress!",
                  style: AppTextStyles.appSmallDescription.copyWith(
                    color: AppColor.kWhiteColor.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColor.primaryGradientColor,
            ),
            child: Center(
              child: Text(
                "${persentage.toStringAsFixed(1)}%",
                style: AppTextStyles.appSubTitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
