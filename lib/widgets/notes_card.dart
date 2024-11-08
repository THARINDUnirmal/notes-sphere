import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/app_constants.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';

class NotesCard extends StatelessWidget {
  final String cardTiltle;
  final int noOfNotes;

  const NotesCard({
    super.key,
    required this.cardTiltle,
    required this.noOfNotes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        AppConstants.kDefaultPdding,
      ),
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppConstants.kDefaultPdding,
        ),
        color: AppColor.kCardColor,
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            maxLines: 1,
            cardTiltle,
            style: AppTextStyles.appSubTitle.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "$noOfNotes notes",
            style: AppTextStyles.appSmallDescription.copyWith(
                color: AppColor.kWhiteColor.withOpacity(0.5), fontSize: 16),
          )
        ],
      ),
    );
  }
}
