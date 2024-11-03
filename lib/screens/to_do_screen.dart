import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen>
    with SingleTickerProviderStateMixin {
  //create tab contraller
  late TabController _tabContraller;
  @override
  void initState() {
    _tabContraller = TabController(length: 2, vsync: this);
    super.initState();
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
        Center(
          child: Text(
            "ToDo Tab",
            style: AppTextStyles.appTitle,
          ),
        ),
        Center(
          child: Text(
            "Completed Tab",
            style: AppTextStyles.appTitle,
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
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
