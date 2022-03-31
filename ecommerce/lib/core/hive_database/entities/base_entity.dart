import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class BaseEntity extends HiveObject {
  @HiveField(0)
  late String id;

  BaseEntity({String? id}) {
    if (id == null) {
      this.id = const Uuid().v4();
    } else {
      this.id = id;
    }
  }
}
