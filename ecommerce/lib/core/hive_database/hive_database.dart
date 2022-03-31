import 'dart:convert';
import 'dart:io';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/logger_utils.dart';
import 'package:ecommerce/core/utils/storage_utils.dart';
import 'package:hive/hive.dart';

import 'entities/base_entity.dart';
import 'hive_constants.dart';

class HiveDatabase {
  HiveDatabase();

  Future<void> init() async {
    var appFolder = await StorageUtils.getApplicationPermanentDirectory();
    var hivePath = appFolder.path + '/hive';
    final hiveFolder = Directory(hivePath);
    // if (hiveFolder.existsSync()) {
    //   hiveFolder.deleteSync(recursive: true); // Uncomment to clear database
    // }

    Hive.init(hivePath);
    _registerAdapters();
    await _initBoxes();
  }

  Box<T> getMyBox<T extends BaseEntity>() {
    return Hive.box<T>(HiveBoxMap.hiveBoxMap[T]!.boxName);
  }

  Future<void> _initBoxes() async {
    for (var key in HiveBoxMap.hiveBoxMap.keys) {
      await HiveBoxMap.hiveBoxMap[key]!.openBoxFunction();
    }
  }

  void _registerAdapters() {
    for (var key in HiveBoxMap.hiveBoxMap.keys) {
      HiveBoxMap.hiveBoxMap[key]!.registerAdapterFunction();
    }
  }

  Future<void> backupHiveBox<T extends BaseEntity>() async {
    final box = await Hive.openBox<T>(HiveBoxMap.hiveBoxMap[T]!.boxName);
    var appFolder = await StorageUtils.getApplicationPermanentDirectory();
    var backupPath = appFolder.path +
        '/${Constants.BackUpData}/' +
        HiveBoxMap.hiveBoxMap[T]!.boxName;
    await File(backupPath).writeAsString(jsonEncode(
        box.values.toList())); // add data if it doesn't push to server
  }

  Future<void> restoreHiveBox<T extends BaseEntity>(Function fromJson) async {
    final box = await Hive.openBox<T>(HiveBoxMap.hiveBoxMap[T]!.boxName);
    var appFolder = await StorageUtils.getApplicationPermanentDirectory();
    var backupPath = appFolder.path +
        '/${Constants.BackUpData}/' +
        HiveBoxMap.hiveBoxMap[T]!.boxName;
    var file = await File(backupPath).exists();
    if (!file) {
      return;
    }
    var document = await File(backupPath).readAsString();
    var jsonFromFile = jsonDecode(document.toString());

    try {
      if (jsonFromFile.length > 0) {
        for (var item in jsonFromFile) {
          T itemConvertToEntity = fromJson(item) as T;
          await box.put(itemConvertToEntity.id, itemConvertToEntity);
        }
      }
      await File(backupPath).delete(); // Remove data file after backup
    } catch (e) {
      await LoggerUtils.logException(e);
    }
  }
}
