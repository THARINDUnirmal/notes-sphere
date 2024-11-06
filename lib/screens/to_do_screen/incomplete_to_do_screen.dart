import 'package:flutter/material.dart';
import 'package:notes_sphere/helpers/app_helpers.dart';
import 'package:notes_sphere/models/todo_model.dart';
import 'package:notes_sphere/services/todo_service.dart';
import 'package:notes_sphere/utils/routers/app_routers.dart';
import 'package:notes_sphere/widgets/incomplete_todo_widget.dart';

class IncompleteToDoScreen extends StatefulWidget {
  final List<TodoModel> incompleTodos;
  final List<TodoModel> compleTodos;

  const IncompleteToDoScreen({
    super.key,
    required this.incompleTodos,
    required this.compleTodos,
  });

  @override
  State<IncompleteToDoScreen> createState() => _IncompleteToDoScreenState();
}

class _IncompleteToDoScreenState extends State<IncompleteToDoScreen> {
  void _markAsDone(TodoModel todo) async {
    try {
      final TodoModel updatedTodo = TodoModel(
        id: todo.id,
        title: todo.title,
        date: todo.date,
        time: todo.time,
        isComplete: true,
      );

      await TodoService().updateTodo(updatedTodo);

      setState(() {
        widget.incompleTodos.remove(todo);
        widget.compleTodos.add(updatedTodo);
      });
      AppHelpers.appMessenger(context, "Mrak as done");

      AppRouters.appRoute.go("/ToDoScreen");
    } catch (e) {
      AppHelpers.appMessenger(context, "File to mrak as undone");
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      widget.incompleTodos.sort(
        (a, b) => a.time.compareTo(b.time),
      );
    });
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.incompleTodos.length,
              itemBuilder: (context, index) {
                final TodoModel indexTodo = widget.incompleTodos[index];
                return IncompleteTodoWidget(
                  isComplete: false,
                  todo: indexTodo,
                  onCheckBoxChnge: () => _markAsDone(indexTodo),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
