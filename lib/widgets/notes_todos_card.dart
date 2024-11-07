import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/app_constants.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';

class NotesTodosCard extends StatefulWidget {
  final String cardTitle;
  final String noOFNoteOrTodos;
  final IconData cardIcon;

  const NotesTodosCard({
    super.key,
    required this.cardTitle,
    required this.noOFNoteOrTodos,
    required this.cardIcon,
  });

  @override
  State<NotesTodosCard> createState() => _NotesTodosCardState();
}

class _NotesTodosCardState extends State<NotesTodosCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: AppColor.kCardColor,
        borderRadius: BorderRadius.circular(
          AppConstants.kDefaultPdding,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.cardIcon,
            size: 50,
            color: AppColor.kWhiteColor,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.cardTitle,
            style: AppTextStyles.appLaegeDescription.copyWith(
              fontSize: 21,
            ),
          ),
          Text(
            widget.noOFNoteOrTodos,
            style: AppTextStyles.appSmallDescription.copyWith(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
