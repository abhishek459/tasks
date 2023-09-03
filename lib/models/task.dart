import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Id isarId = Isar.autoIncrement;

  String? mongoId;

  String title;

  String description;

  bool completed;

  DateTime createdDate;

  Task({
    required this.title,
    required this.description,
    this.completed = false,
    required this.createdDate,
  });
}
