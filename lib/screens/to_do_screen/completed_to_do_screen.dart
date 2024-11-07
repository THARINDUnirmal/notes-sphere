import 'package:flutter/material.dart';
import 'package:notes_sphere/helpers/app_helpers.dart';
import 'package:notes_sphere/models/todo_model.dart';
import 'package:notes_sphere/services/todo_service.dart';
import 'package:notes_sphere/utils/routers/app_routers.dart';
import 'package:notes_sphere/widgets/incomplete_todo_widget.dart';

class CompletedToDoScreen extends StatefulWidget {
  final List<TodoModel> compleTodos;
  final List<TodoModel> inCompleTodos;

  const CompletedToDoScreen({
    super.key,
    required this.compleTodos,
    required this.inCompleTodos,
  });

  @override
  State<CompletedToDoScreen> createState() => _CompletedToDoScreenState();
}

class _CompletedToDoScreenState extends State<CompletedToDoScreen> {
  void _markAsUnone(TodoModel todo) async {
    try {
      final TodoModel updatedTodo = TodoModel(
        id: todo.id,
        title: todo.title,
        date: todo.date,
        time: todo.time,
        isComplete: false,
      );

      await TodoService().updateTodo(updatedTodo);

      setState(() {
        widget.compleTodos.remove(todo);
        widget.inCompleTodos.add(updatedTodo);
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
      widget.compleTodos.sort(
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
              itemCount: widget.compleTodos.length,
              itemBuilder: (context, index) {
                final TodoModel completeTodoIndex = widget.compleTodos[index];
                return Dismissible(
                  key: Key(completeTodoIndex.id.toString()),
                  onDismissed: (direction) {
                    setState(() {
                      widget.compleTodos.removeAt(index);
                      TodoService().removeTodo(completeTodoIndex);
                    });
                    AppHelpers.appMessenger(context, "Deleted");
                  },
                  child: IncompleteTodoWidget(
                    isComplete: true,
                    todo: completeTodoIndex,
                    onCheckBoxChnge: () => _markAsUnone(completeTodoIndex),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
