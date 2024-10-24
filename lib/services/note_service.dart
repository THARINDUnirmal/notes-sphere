import 'package:hive/hive.dart';
import 'package:notes_sphere/models/notes_model.dart';
import 'package:uuid/uuid.dart';

class NoteService {
  List<NotesModel> noteList = [
    NotesModel(
      id: const Uuid().v4(),
      title: "Meeting Notes",
      categeory: "Work",
      content:
          "Discussed project deadlines and deliverables. Assigned tasks to team members and set up follow-up meetings to track progress.",
      date: DateTime.now(),
    ),
    NotesModel(
      id: const Uuid().v4(),
      title: "Grocery List",
      categeory: "Personal",
      content:
          "Bought milk, eggs, bread, fruits, and vegetables from the local grocery store. Also added some snacks for the week.",
      date: DateTime.now(),
    ),
    NotesModel(
      id: const Uuid().v4(),
      title: "Book Recommendations",
      categeory: "Hobby",
      content:
          "Recently read 'Sapiens' by Yuval Noah Harari, which offered fascinating insights into the history of humankind. Also enjoyed 'Atomic Habits' by James Clear, a practical guide to building good habits and breaking bad ones.",
      date: DateTime.now(),
    ),
  ];

  //create a references for box
  final _noteBox = Hive.box("notes");

  //check user is a new user?
  Future<bool> isUserIsNew() async {
    return _noteBox.isEmpty;
  }

  //save notes data to a noteBox if user is new
  Future<void> saveInitialNotes() async {
    if (_noteBox.isEmpty) {
      await _noteBox.put("notes", noteList);
    }
  }

  //load initial notes list
  Future<List<NotesModel>> loadInitialNotes() async {
    final dynamic note = _noteBox.get("notes");

    if (note != null && note is List<dynamic>) {
      return note.cast<NotesModel>().toList();
    } else {
      return [];
    }
  }

  //filtering to categeories
  Map<String, List<NotesModel>> noteCategeorise(List<NotesModel> notesList) {
    Map<String, List<NotesModel>> categeryNotes = {};

    for (final note in notesList) {
      if (categeryNotes.containsKey(note.categeory)) {
        categeryNotes[note.categeory]!.add(note);
      } else {
        categeryNotes[note.categeory] = [note];
      }
    }
    return categeryNotes;
  }
}
