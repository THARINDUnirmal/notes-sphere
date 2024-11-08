import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';

class HomeTodoWidget extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final bool isComplete;

  const HomeTodoWidget({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.isComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      width: double.infinity,
      height: 90,
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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.72,
                child: Text(
                  maxLines: 1,
                  title,
                  style: AppTextStyles.appSubTitle.copyWith(
                    fontSize: 21,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${DateFormat("yyy/MMM/dd").format(DateTime.parse(date))}   ${DateFormat.Hm().format(DateTime.parse(time))}",
                style: AppTextStyles.appSmallDescription,
              ),
            ],
          ),
          Icon(
            isComplete ? Icons.done_all_outlined : Icons.done,
            color: isComplete ? Colors.greenAccent : Colors.redAccent,
          ),
        ],
      ),
    );
  }
}
