import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks/common/common.dart';
import 'package:tasks/models/modified_task.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/user.dart';

class IsarService {
  static late Future<Isar> db;
  IsarService() {
    db = openDB();
  }

  Future<List<Task>> getUnsyncedTasks() async {
    final isar = await db;
    return await isar.tasks.filter().mongoIdIsNull().findAll();
  }

  Future<int> saveTask(Task newTask) async {
    final isar = await db;
    final int id = isar.writeTxnSync<int>(() => isar.tasks.putSync(newTask));
    return id;
  }

  Future<void> completeTask(int taskId, bool status) async {
    final isar = await db;
    late Task? task;
    try {
      await isar.writeTxn(() async {
        task = await isar.tasks.get(taskId);
        if (task == null) {
          showSnackBar('Couldn\'t find task for completion');
          return;
        }
        task!.completed = status;
        taskId = await isar.tasks.put(task!);
      });
      saveModifiedTask(task!);
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  Future<void> deleteTask(int taskId) async {
    final isar = await db;
    await isar.writeTxn(() => isar.tasks.delete(taskId));
  }

  Future<List<Task>> getAllTasks() async {
    final isar = await db;
    return await isar.tasks.where().findAll();
  }

  Stream<List<Task>> listenToTasks() async* {
    final isar = await db;
    yield* isar.tasks.where().watch(fireImmediately: true);
  }

  Future<int> saveModifiedTask(Task task) async {
    final isar = await db;

    ModifiedTask? existingModifiedTask = await isar.modifiedTasks
        .where()
        .filter()
        .taskCreatedDateEqualTo(task.createdDate.toIso8601String())
        .findFirst();
    if (existingModifiedTask == null) {
      final ModifiedTask modifiedTask =
          ModifiedTask(task.createdDate.toIso8601String());
      modifiedTask.task.value = task;
      final int id = isar
          .writeTxnSync<int>(() => isar.modifiedTasks.putSync(modifiedTask));
      return id;
    } else {
      return existingModifiedTask.id;
    }
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [
          TaskSchema,
          UserSchema,
          ModifiedTaskSchema,
        ],
        directory: dir.path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
