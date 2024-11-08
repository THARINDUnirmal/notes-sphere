import 'package:flutter/material.dart';
import 'package:notes_sphere/models/todo_model.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';

class IncompleteTodoWidget extends StatefulWidget {
  final bool isComplete;
  final TodoModel todo;
  final Function() onCheckBoxChnge;

  const IncompleteTodoWidget({
    super.key,
    required this.todo,
    required this.isComplete,
    required this.onCheckBoxChnge,
  });

  @override
  State<IncompleteTodoWidget> createState() => _IncompleteTodoWidgetState();
}

class _IncompleteTodoWidgetState extends State<IncompleteTodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.kCardColor,
      ),
      child: ListTile(
        minVerticalPadding: 10,
        title: Text(
          maxLines: 2,
          widget.todo.title,
          style: AppTextStyles.appLaegeDescription,
        ),
        subtitle: Row(
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
                "${widget.todo.date.day}/${widget.todo.date.month}/${widget.todo.date.year}"),
            const SizedBox(
              width: 10,
            ),
            Text("${widget.todo.time.hour} : ${widget.todo.time.minute} "),
          ],
        ),
        trailing: Checkbox(
          onChanged: (value) => widget.onCheckBoxChnge(),
          value: widget.isComplete,
        ),
      ),
    );
  }
}
