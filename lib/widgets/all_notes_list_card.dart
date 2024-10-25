import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/app_constants.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';

class AllNotesListCard extends StatefulWidget {
  final String title;
  final String cardContent;
  final Future Function() methordToUpdate;
  final Future Function() methordToDelete;

  const AllNotesListCard({
    super.key,
    required this.title,
    required this.cardContent,
    required this.methordToUpdate,
    required this.methordToDelete,
  });

  @override
  State<AllNotesListCard> createState() => _AllNotesListCardState();
}

class _AllNotesListCardState extends State<AllNotesListCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          color: AppColor.kCardColor,
          borderRadius: BorderRadius.circular(
            AppConstants.kDefaultPdding,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () async {
                  setState(() {
                    widget.methordToUpdate;
                  });
                },
                icon: Icon(
                  Icons.edit_outlined,
                  size: 30,
                  color: AppColor.kWhiteColor.withOpacity(0.6),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () async {
                  setState(() {
                    widget.methordToDelete;
                  });
                },
                icon: Icon(
                  Icons.delete_outline,
                  size: 30,
                  color: AppColor.kWhiteColor.withOpacity(0.6),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.title,
            style: AppTextStyles.appSubTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.cardContent,
            style: AppTextStyles.appSmallDescription.copyWith(
              color: AppColor.kWhiteColor.withOpacity(0.6),
            ),
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
