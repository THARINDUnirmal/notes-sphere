import 'package:flutter/material.dart';
import 'package:notes_sphere/models/notes_model.dart';
import 'package:notes_sphere/models/todo_model.dart';
import 'package:notes_sphere/services/note_service.dart';
import 'package:notes_sphere/services/todo_service.dart';
import 'package:notes_sphere/utils/app_constants.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';
import 'package:notes_sphere/utils/routers/app_routers.dart';
import 'package:notes_sphere/widgets/home_todo_widget.dart';
import 'package:notes_sphere/widgets/notes_todos_card.dart';
import 'package:notes_sphere/widgets/progress_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> allTodos = [];
  List<NotesModel> allNotes = [];
  @override
  void initState() {
    _userIsNew();
    super.initState();
    setState(() {});
  }

  //check user is new
  void _userIsNew() async {
    final bool isNewUser =
        await TodoService().isUserNew() || await NoteService().isUserIsNew();

    if (isNewUser) {
      await NoteService().saveInitialNotes();
      await TodoService().saveInitialTodos();
    }

    _loadNotes();
    _loadTodos();
  }

  Future<void> _loadNotes() async {
    List<NotesModel> loadedNotes = await NoteService().loadInitialNotes();
    setState(() {
      allNotes = loadedNotes;
    });
  }

  Future<void> _loadTodos() async {
    List<TodoModel> loadedTodos = await TodoService().fetchInitialTodos();
    setState(() {
      allTodos = loadedTodos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes Sphere",
          style: AppTextStyles.appTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          AppConstants.kDefaultPdding / 2,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ProgressCard(
              completedTasks: allTodos
                  .where(
                    (element) => element.isComplete,
                  )
                  .length,
              totalTasks: allTodos.length,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    AppRouters.appRoute.go("/Notes");
                  },
                  child: NotesTodosCard(
                    cardTitle: "Notes",
                    noOFNoteOrTodos: "${allNotes.length} Notes",
                    cardIcon: Icons.bookmark_add_outlined,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    AppRouters.appRoute.go("/ToDoScreen");
                  },
                  child: NotesTodosCard(
                    cardTitle: "To-Do List",
                    noOFNoteOrTodos: "${allTodos.length} Tasks",
                    cardIcon: Icons.calendar_month_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pending Tasks",
                  style: AppTextStyles.appSubTitle,
                ),
                Text(
                  "See all",
                  style: AppTextStyles.appLaegeDescription,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            allTodos.isEmpty
                ? Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      GestureDetector(
                        onTap: () {
                          AppRouters.appRoute.go("/ToDoScreen");
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColor.kCardColor,
                            border: Border.all(
                              color: AppColor.kWhiteColor,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Add some task >>>",
                              style: AppTextStyles.appLaegeDescription.copyWith(
                                fontSize: 22,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    child: ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: allTodos.length,
                      itemBuilder: (context, index) {
                        final TodoModel newTodo = allTodos[index];
                        return HomeTodoWidget(
                          title: newTodo.title,
                          date: newTodo.date.toString(),
                          time: newTodo.time.toString(),
                          isComplete: newTodo.isComplete,
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
