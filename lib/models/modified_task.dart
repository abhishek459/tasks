import 'package:isar/isar.dart';

import 'task.dart';

part 'modified_task.g.dart';

@collection
class ModifiedTask {
  Id id = Isar.autoIncrement;

  final String taskCreatedDate;

  final task = IsarLink<Task>();

  ModifiedTask(this.taskCreatedDate);
}
