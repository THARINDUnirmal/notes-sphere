import 'package:flutter/material.dart';
import 'package:notes_sphere/models/todo_model.dart';
import 'package:notes_sphere/widgets/incomplete_todo_widget.dart';

class CompletedToDoScreen extends StatefulWidget {
  final List<TodoModel> compleTodos;

  const CompletedToDoScreen({
    super.key,
    required this.compleTodos,
  });

  @override
  State<CompletedToDoScreen> createState() => _CompletedToDoScreenState();
}

class _CompletedToDoScreenState extends State<CompletedToDoScreen> {
  @override
  Widget build(BuildContext context) {
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
                return IncompleteTodoWidget(
                  todo: widget.compleTodos[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
