import 'package:flutter/material.dart';
import 'package:notes_sphere/models/todo_model.dart';
import 'package:notes_sphere/screens/to_do_screen/completed_to_do_screen.dart';
import 'package:notes_sphere/screens/to_do_screen/incomplete_to_do_screen.dart';
import 'package:notes_sphere/services/todo_service.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen>
    with SingleTickerProviderStateMixin {
  //all todo list
  List<TodoModel> allTodos = [];
  List<TodoModel> incompleteTodos = [];
  List<TodoModel> completeTodos = [];

  //create tab contraller
  late TabController _tabContraller;
  @override
  void initState() {
    _tabContraller = TabController(length: 2, vsync: this);
    checkUserIsNew();
    super.initState();
  }

  //check user is new user
  Future<void> checkUserIsNew() async {
    final bool isNew = await TodoService().isUserNew();

    //save initial todos

    if (isNew) {
      await TodoService().saveInitialTodos();
    }
    loadAllInitialTodos();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        ),
        CompletedToDoScreen(
          compleTodos: completeTodos,
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
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 30,
          color: AppColor.kWhiteColor,
        ),
      ),
    );
  }
}
