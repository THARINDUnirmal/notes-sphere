import 'package:flutter/material.dart';
import 'package:notes_sphere/models/todo_model.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';

class IncompleteTodoWidget extends StatefulWidget {
  final TodoModel todo;

  const IncompleteTodoWidget({
    super.key,
    required this.todo,
  });

  @override
  State<IncompleteTodoWidget> createState() => _IncompleteTodoWidgetState();
}

class _IncompleteTodoWidgetState extends State<IncompleteTodoWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColor.kCardColor,
      title: Text(
        widget.todo.title,
        style: AppTextStyles.appLaegeDescription,
      ),
      subtitle: Row(
        children: [
          Text(
              "${widget.todo.date.day} / ${widget.todo.date.month} / ${widget.todo.date.year}"),
          const SizedBox(
            width: 10,
          ),
          Text("${widget.todo.time.hour} : ${widget.todo.time.minute} "),
        ],
      ),
      trailing: Checkbox(
        value: widget.todo.isComplete,
        onChanged: (value) {},
      ),
    );
  }
}
