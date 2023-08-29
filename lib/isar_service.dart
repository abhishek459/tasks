import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks/models/system_settings.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/user.dart';

class IsarService {
  static late Future<Isar> db;
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
    await isar.writeTxnSync(() async {
      final task = await isar.tasks.get(taskId);
      task!.completed = status;
      await isar.tasks.put(task);
    });
  }

  Future<void> deleteTask(int taskId) async {
    final isar = await db;
    await isar.writeTxnSync(() => isar.tasks.delete(taskId));
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
      return await Isar.open([TaskSchema, SystemSettingsSchema, UserSchema],
          directory: dir.path, inspector: true);
    }
    return Future.value(Isar.getInstance());
  }

  static Future<int> saveServerLink(String serverLink) async {
    final isar = await db;
    int id = isar.writeTxnSync(
      () => isar.systemSettings.putByIndexSync('1', SystemSettings(serverLink)),
    );
    return id;
  }
}
