import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_sphere/models/notes_model.dart';
import 'package:notes_sphere/models/todo_model.dart';
import 'package:notes_sphere/utils/routers/app_routers.dart';
import 'package:notes_sphere/utils/theam_data.dart';

void main() async {
  //hive pakage initial
  await Hive.initFlutter();

  //register the adapters
  Hive.registerAdapter(NotesModelAdapter());
  Hive.registerAdapter(TodoModelAdapter());

  //open hive boxes
  await Hive.openBox('notes');
  await Hive.openBox('todos');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheamData.darkTheam.copyWith(
        textTheme: GoogleFonts.dmSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routerConfig: AppRouters.appRoute,
    );
  }
}
