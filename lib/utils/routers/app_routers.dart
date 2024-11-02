import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_sphere/models/notes_model.dart';
import 'package:notes_sphere/screens/all_notes_list_screen.dart';
import 'package:notes_sphere/screens/display_note_screen.dart';
import 'package:notes_sphere/screens/home_screen.dart';
import 'package:notes_sphere/screens/note_add_screen.dart';
import 'package:notes_sphere/screens/note_edit_screen.dart';
import 'package:notes_sphere/screens/notes_screen.dart';

class AppRouters {
  static final appRoute = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    initialLocation: "/",
    routes: [
      //home screen router
      GoRoute(
        name: "Home",
        path: "/",
        builder: (context, state) {
          return const HomeScreen();
        },
      ),

      GoRoute(
        path: "/Notes",
        builder: (context, state) {
          return const NotesScreen();
        },
      ),
      GoRoute(
        path: "/noteByCategeory",
        builder: (context, state) {
          final String catergeory = state.extra as String;
          return AllNotesListScreen(category: catergeory);
        },
      ),
      GoRoute(
        path: "/new-note-addedPage",
        builder: (context, state) {
          final bool isNewCategeory = state.extra as bool;
          return NoteAddScreen(isNewCategery: isNewCategeory);
        },
      ),
      GoRoute(
        path: "/NoteEditScreen",
        builder: (context, state) {
          final NotesModel note = state.extra as NotesModel;
          return NoteEditScreen(note: note);
        },
      ),
      GoRoute(
        path: "/DisplayNoteScreen",
        builder: (context, state) {
          final NotesModel note = state.extra as NotesModel;
          return DisplayNoteScreen(
            note: note,
          );
        },
      )
    ],
  );
}
