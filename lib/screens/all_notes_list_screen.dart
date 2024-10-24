import 'package:flutter/material.dart';
import 'package:notes_sphere/models/notes_model.dart';
import 'package:notes_sphere/services/note_service.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
    );
  }
}
