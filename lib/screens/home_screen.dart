import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/app_constants.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/routers/app_routers.dart';
import 'package:notes_sphere/widgets/notes_todos_card.dart';
import 'package:notes_sphere/widgets/progress_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            const ProgressCard(
              completedTasks: 8,
              totalTasks: 9,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    AppRouters.appRoute.push("/Notes");
                  },
                  child: const NotesTodosCard(
                    cardTitle: "Notes",
                    noOFNoteOrTodos: "4 Notes",
                    cardIcon: Icons.bookmark_add_outlined,
                  ),
                ),
                const NotesTodosCard(
                  cardTitle: "To-Do List",
                  noOFNoteOrTodos: "100 Tasks",
                  cardIcon: Icons.calendar_month_outlined,
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
            )
          ],
        ),
      ),
    );
  }
}
