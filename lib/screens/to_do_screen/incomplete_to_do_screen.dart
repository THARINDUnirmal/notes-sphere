import 'package:flutter/material.dart';
import 'package:notes_sphere/models/todo_model.dart';
import 'package:notes_sphere/widgets/incomplete_todo_widget.dart';

class IncompleteToDoScreen extends StatefulWidget {
  final List<TodoModel> incompleTodos;

  const IncompleteToDoScreen({
    super.key,
    required this.incompleTodos,
  });

  @override
  State<IncompleteToDoScreen> createState() => _IncompleteToDoScreenState();
}

class _IncompleteToDoScreenState extends State<IncompleteToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.incompleTodos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                childAspectRatio: 4 / 1),
            itemBuilder: (context, index) {
              return IncompleteTodoWidget(
                todo: widget.incompleTodos[index],
              );
            },
          )
        ],
      ),
    );
  }
}
