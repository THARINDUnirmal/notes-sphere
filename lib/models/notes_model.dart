import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 1)
class NotesModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String categeory;

  @HiveField(3)
  final String content;

  @HiveField(4)
  final DateTime date;

  NotesModel({
    String? id,
    required this.title,
    required this.categeory,
    required this.content,
    required this.date,
  }) : id = id ?? const Uuid().v4();
}
