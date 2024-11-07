import 'package:flutter/material.dart';
import 'package:notes_sphere/helpers/app_helpers.dart';
import 'package:notes_sphere/models/todo_model.dart';
import 'package:notes_sphere/screens/to_do_screen/completed_to_do_screen.dart';
import 'package:notes_sphere/screens/to_do_screen/incomplete_to_do_screen.dart';
import 'package:notes_sphere/services/todo_service.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';
import 'package:notes_sphere/utils/routers/app_routers.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen>
    with SingleTickerProviderStateMixin {
  //all todo list
  late List<TodoModel> allTodos = [];
  late List<TodoModel> incompleteTodos = [];
  late List<TodoModel> completeTodos = [];
  final TextEditingController _newTodoFeild = TextEditingController();

  //create tab contraller
  late TabController _tabContraller;
  @override
  void initState() {
    _tabContraller = TabController(length: 2, vsync: this);
    checkUserIsNew();
    loadAllInitialTodos();
    super.initState();
  }

  //check user is new user
  Future<void> checkUserIsNew() async {
    final bool isNew = await TodoService().isUserNew();

    //save initial todos

    if (isNew) {
      await TodoService().saveInitialTodos();
    }
  }

  //load initial todos
  Future<void> loadAllInitialTodos() async {
    List<TodoModel> alltodoes = await TodoService().fetchInitialTodos();
    setState(() {
      //all todos
      allTodos = alltodoes;
      //incomplete todos
      incompleteTodos = alltodoes
          .where(
            (element) => element.isComplete == false,
          )
          .toList();

      //complete todos
      completeTodos = alltodoes
          .where(
            (element) => element.isComplete,
          )
          .toList();
    });
  }

  //todo save
  void _addNewTodo() async {
    try {
      if (_newTodoFeild.text.isNotEmpty) {
        final TodoModel newTodo = TodoModel(
          title: _newTodoFeild.text,
          date: DateTime.now(),
          time: DateTime.now(),
          isComplete: false,
        );
        await TodoService().addTodo(newTodo);

        setState(() {
          allTodos.add(newTodo);
          incompleteTodos.add(newTodo);
        });
        _newTodoFeild.clear();

        Navigator.of(context).pop();
        AppHelpers.appMessenger(context, "Task added");
      }
    } catch (e) {
      print(e.toString());
      AppHelpers.appMessenger(context, "Failed to add Task");
    }
  }

  void _showDialogBox(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColor.kCardColor,
          title: Text(
            "Add To-Do",
            style: AppTextStyles.appSubTitle,
          ),
          content: TextField(
            controller: _newTodoFeild,
            style: AppTextStyles.appLaegeDescription,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColor.kFaBuColor,
                ),
              ),
              onPressed: () {
                _addNewTodo();
              },
              child: Text(
                "Add Task",
                style: AppTextStyles.appButton,
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColor.kCardColor,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancel",
                style: AppTextStyles.appButton,
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            AppRouters.appRoute.go("/");
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
        bottom: TabBar(
          dividerColor: Colors.black,
          controller: _tabContraller,
          tabs: [
            Tab(
              child: Text(
                "ToDo",
                style: AppTextStyles.appLaegeDescription,
              ),
            ),
            Tab(
              child: Text(
                "Completed",
                style: AppTextStyles.appLaegeDescription,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _tabContraller, children: [
        IncompleteToDoScreen(
          incompleTodos: incompleteTodos,
          compleTodos: completeTodos,
        ),
        CompletedToDoScreen(
          compleTodos: completeTodos,
          inCompleTodos: incompleteTodos,
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 2,
            color: AppColor.kWhiteColor,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          _showDialogBox(context);
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: AppColor.kWhiteColor,
        ),
      ),
    );
  }
}
