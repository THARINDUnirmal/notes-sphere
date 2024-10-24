import 'package:flutter/material.dart';
import 'package:notes_sphere/models/notes_model.dart';
import 'package:notes_sphere/services/note_service.dart';
import 'package:notes_sphere/utils/app_constants.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';
import 'package:notes_sphere/utils/routers/app_routers.dart';
import 'package:notes_sphere/widgets/notes_card.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<NotesModel> allNoteList = [];
  Map<String, List<NotesModel>> noteWithCategeory = {};

  @override
  void initState() {
    _isUserNew();
    super.initState();
  }

  //check is user new?(methord)
  void _isUserNew() async {
    final bool value = await NoteService().isUserIsNew();

    //save initial notes value == true
    if (value) {
      await NoteService().saveInitialNotes();
    }

    //load list
    loadedNotes();
  }

  //load initial notes
  Future<void> loadedNotes() async {
    final List<NotesModel> loadedNoteList =
        await NoteService().loadInitialNotes();

    final Map<String, List<NotesModel>> getCategeory =
        NoteService().noteCategeorise(loadedNoteList);

    setState(() {
      allNoteList = loadedNoteList;
      noteWithCategeory = getCategeory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            AppRouters.appRoute.go("/");
          },
          child: const Icon(
            Icons.arrow_back,
            size: 30,
            color: AppColor.kWhiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          AppConstants.kDefaultPdding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Notes",
              style: AppTextStyles.appTitle.copyWith(
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            allNoteList.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(
                      child: Text(
                        "No notes are available, Please click + button to add a new note !",
                        style: AppTextStyles.appBody,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: AppConstants.kDefaultPdding,
                      mainAxisSpacing: AppConstants.kDefaultPdding,
                      childAspectRatio: 6 / 4,
                    ),
                    itemCount: noteWithCategeory.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          AppRouters.appRoute.push("/noteByCategeory",
                              extra: noteWithCategeory.keys.elementAt(index));
                        },
                        child: NotesCard(
                          cardTiltle: noteWithCategeory.keys.elementAt(index),
                          noOfNotes:
                              noteWithCategeory.values.elementAt(index).length,
                        ),
                      );
                    },
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: const BorderSide(
            width: 2,
            color: AppColor.kWhiteColor,
          ),
        ),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: AppColor.kWhiteColor,
          size: 30,
        ),
      ),
    );
  }
}
