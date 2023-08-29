import 'package:isar/isar.dart';

part 'system_settings.g.dart';

@collection
class SystemSettings {
  Id id = Isar.autoIncrement;

  String serverLink;

  SystemSettings(this.serverLink);
}
