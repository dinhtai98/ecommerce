import 'package:ecommerce/core/hive_database/entities/session/session_entity.dart';
import 'package:hive/hive.dart';

class HiveBoxName {
  static const String sessions = 'sessions';
}

class HiveTypes {
  static const sessions = 1;
}

class HiveBoxMap {
  static Map<Type, MyHive> hiveBoxMap = {
    SessionEntity: MyHive<SessionEntity>(
      boxName: HiveBoxName.sessions,
      registerAdapterFunction: () {
        Hive.registerAdapter(SessionEntityAdapter());
      },
    ),
  };
}

class MyHive<EntityT> {
  String boxName;
  late Future<void> Function() openBoxFunction;
  void Function() registerAdapterFunction;

  MyHive({required this.boxName, required this.registerAdapterFunction}) {
    openBoxFunction = () async {
      await Hive.openBox<EntityT>(boxName);
    };
  }
}
