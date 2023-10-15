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

  DateTime modifiedDate;

  Task({
    this.mongoId,
    required this.title,
    required this.description,
    this.completed = false,
    required this.createdDate,
    required this.modifiedDate,
  });

  factory Task.fromJSON(Map<String, dynamic> json) {
    return Task(
      mongoId: json['mongoId'],
      title: json['title'],
      description: json['description'],
      createdDate: json['createdDate'],
      modifiedDate: json['modifiedDate'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'isarId': isarId.toString(),
      'mongoId': mongoId.toString(),
      'title': title,
      'description': description,
      'isCompleted': completed.toString(),
      'createdDate': createdDate.toIso8601String(),
      'modifiedDate': modifiedDate.toIso8601String(),
    };
  }
}
