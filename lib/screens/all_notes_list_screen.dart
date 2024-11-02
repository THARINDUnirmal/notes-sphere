import 'package:flutter/material.dart';
import 'package:notes_sphere/helpers/app_helpers.dart';
import 'package:notes_sphere/models/notes_model.dart';
import 'package:notes_sphere/services/note_service.dart';
import 'package:notes_sphere/utils/app_constants.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/routers/app_routers.dart';
import 'package:notes_sphere/widgets/all_notes_list_card.dart';

class AllNotesListScreen extends StatefulWidget {
  final String category;

  const AllNotesListScreen({
    super.key,
    required this.category,
  });

  @override
  State<AllNotesListScreen> createState() => _AllNotesListScreenState();
}

class _AllNotesListScreenState extends State<AllNotesListScreen> {
  @override
  void initState() {
    notes();
    super.initState();
  }

  //save this page notes
  List<NotesModel> categeoryNotes = [];

  //load notes
  Future<void> notes() async {
    categeoryNotes = await NoteService().loadNotesByCategeory(widget.category);
    setState(() {});
  }

  void _editeNotePage(NotesModel note) {
    AppRouters.appRoute.push("/NoteEditScreen", extra: note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            AppRouters.appRoute.go("/Notes");
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
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
                widget.category,
                style: AppTextStyles.appTitle,
              ),
              const SizedBox(
                height: 30,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: AppConstants.kDefaultPdding,
                    crossAxisSpacing: AppConstants.kDefaultPdding,
                    childAspectRatio: 4 / 7),
                itemCount: categeoryNotes.length,
                itemBuilder: (context, index) {
                  return AllNotesListCard(
                    title: categeoryNotes[index].title,
                    cardContent: categeoryNotes[index].content,
                    methordToUpdate: () async {
                      _editeNotePage(categeoryNotes[index]);
                    },
                    methordToDelete: () async {
                      try {
                        await NoteService()
                            .deleteNotes(categeoryNotes[index].id);
                        if (context.mounted) {
                          AppHelpers.appMessenger(
                              context, "Note delete successfuly");
                        }

                        AppRouters.appRoute.go("/Notes");
                      } catch (e) {
                        print(e.toString());
                        if (context.mounted) {
                          AppHelpers.appMessenger(
                              context, "Failed to delete note");
                        }
                      }
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
