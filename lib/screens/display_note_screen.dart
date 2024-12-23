import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_sphere/helpers/app_helpers.dart';
import 'package:notes_sphere/models/notes_model.dart';
import 'package:notes_sphere/services/note_service.dart';
import 'package:notes_sphere/utils/app_constants.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';
import 'package:notes_sphere/utils/routers/app_routers.dart';

class DisplayNoteScreen extends StatelessWidget {
  final NotesModel note;

  const DisplayNoteScreen({
    super.key,
    required this.note,
  });

  void editeNotePage(NotesModel note) {
    AppRouters.appRoute.push("/NoteEditScreen", extra: note);
  }

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("MMMM / yyyy / dd").format(note.date);
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              editeNotePage(note);
            },
            child: const Icon(
              Icons.edit_note,
              size: 35,
              color: Colors.greenAccent,
            ),
          ),
          const SizedBox(
            width: AppConstants.kDefaultPdding,
          ),
          GestureDetector(
            onTap: () {
              try {
                NoteService().deleteNotes(note.id);
                AppHelpers.appMessenger(context, "Note delete successfuly");
                AppRouters.appRoute
                    .go("/noteByCategeory", extra: note.categeory);
              } catch (e) {
                AppHelpers.appMessenger(context, "Failed to delete note");
              }
            },
            child: const Icon(
              Icons.delete_outline,
              size: 35,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(
            width: AppConstants.kDefaultPdding / 2,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            AppConstants.kDefaultPdding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: AppTextStyles.appTitle.copyWith(
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: AppConstants.kDefaultPdding / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        note.categeory,
                        style: AppTextStyles.appSmallDescription.copyWith(
                          fontSize: 18,
                          color: Colors.amber,
                        ),
                      ),
                      Text(
                        date,
                        style: AppTextStyles.appSmallDescription.copyWith(
                          fontWeight: FontWeight.w300,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: AppConstants.kDefaultPdding,
              ),
              Text(
                note.content,
                style: AppTextStyles.appSmallDescription.copyWith(
                    fontSize: 20, color: AppColor.kWhiteColor.withOpacity(0.9)),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
