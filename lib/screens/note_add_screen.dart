import 'package:flutter/material.dart';

class NoteAddScreen extends StatefulWidget {
  final bool isNewCategery;

  const NoteAddScreen({
    super.key,
    required this.isNewCategery,
  });

  @override
  State<NoteAddScreen> createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isNewCategery.toString()),
      ),
    );
  }
}
