import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';

class CompletedToDoScreen extends StatefulWidget {
  const CompletedToDoScreen({super.key});

  @override
  State<CompletedToDoScreen> createState() => _CompletedToDoScreenState();
}

class _CompletedToDoScreenState extends State<CompletedToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hi Completed",
          style: AppTextStyles.appTitle,
        )
      ],
    );
  }
}
