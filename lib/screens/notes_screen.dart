import 'package:flutter/material.dart';
import 'package:notes_sphere/models/notes_model.dart';
import 'package:notes_sphere/services/note_service.dart';
import 'package:notes_sphere/utils/app_constants.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';
import 'package:notes_sphere/utils/routers/app_routers.dart';

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
          children: [
            Text(
              "Notes",
              style: AppTextStyles.appTitle,
            ),
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
