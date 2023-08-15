import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks/models/task.dart';

class IsarService {
  late Future<Isar> db;
  IsarService() {
    db = openDB();
  }

  Future<int> saveTask(Task newTask) async {
    final isar = await db;
    final int id = isar.writeTxnSync<int>(() => isar.tasks.putSync(newTask));
    return id;
  }

  Future<void> completeTask(int taskId, bool status) async {
    final isar = await db;
    await isar.writeTxn(() async {
      final task = await isar.tasks.get(taskId);
      task!.completed = status;
      await isar.tasks.put(task);
    });
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

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([TaskSchema],
          directory: dir.path, inspector: true);
    }
    return Future.value(Isar.getInstance());
  }
}
