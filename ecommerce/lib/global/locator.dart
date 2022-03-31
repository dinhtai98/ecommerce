import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/rest_client.dart';
import 'package:ecommerce/core/hive_database/hive_database.dart';
import 'package:ecommerce/core/utils/logger_utils.dart';
import 'package:ecommerce/core/utils/storage_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';

import 'environment.dart';
import 'global_data.dart';
import 'locator_dao.dart';
import 'locator_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => HiveDatabase());
  locator.registerLazySingleton(() => GlobalData());
  bool isNewVersion = await _checkIsNewVersion();
  if (isNewVersion) {
    await _removeOldHive();
  }

  await locator<HiveDatabase>().init();

  if (isNewVersion) {
    await _restoreDB();
  }
  setupRestClient();
  registerDaoSingletons(locator);
  registerServiceSingletons(locator);
}

Future<void> _removeOldHive() async {
  var permanentFolder = await StorageUtils.getApplicationPermanentDirectory();
  var hiveFolder = Directory(permanentFolder.path + '/hive');
  if (hiveFolder.existsSync()) hiveFolder.deleteSync(recursive: true);
}

Future<bool> _checkIsNewVersion() async {
  var permanentFolder = await StorageUtils.getApplicationPermanentDirectory();
  var currentVersion = (await PackageInfo.fromPlatform()).version;
  bool needToUpdateDB = false;
  try {
    var versionFile = File(permanentFolder.path + '/version.txt');
    if (versionFile.existsSync()) {
      var contents = await versionFile.readAsString();
      if (contents != currentVersion) {
        await versionFile.writeAsString(currentVersion); // write new version
      }
      return needToUpdateDB = contents != currentVersion;
    } else {
      await versionFile.writeAsString(currentVersion);
      return needToUpdateDB = false;
    }
  } catch (e) {
    await LoggerUtils.logException(e);
  }
  return needToUpdateDB;
}

Future<void> _restoreDB() async {
  //TODO restoreDB
}

void setupRestClient() {
  var dio = Dio();
  dio.options = BaseOptions(
    connectTimeout: 50000,
    receiveTimeout: EnvironmentUtil.apiConnectTimeout,
  );

  try {
    locator.registerLazySingleton(
      () => RestClient(dio, baseUrl: EnvironmentUtil.apiURL),
      instanceName: "RestClient",
    );
  } catch (e) {
    Future.wait([LoggerUtils.logException(e)]);
  }
}

RestClient getRestClient() {
  return locator.get<RestClient>(instanceName: 'RestClient');
}