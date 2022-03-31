import 'dart:io';
import 'package:xml/xml.dart';

enum Environment { dev }

class EnvironmentUtil {
  static late Map<String, dynamic> _config;

  static void setEnvironment(Environment env, Directory storage) async {
    switch (env) {
      case Environment.dev:
        await _initAndroidAppSetting(Environment.dev, storage);
        _config = _Config.devConfig;
        break;
    }
  }

  static Environment get currentEnv {
    return _config[_Config.current_env];
  }

  static String get apiURL {
    return _config[_Config.apiURL];
  }

  static int get apiConnectTimeout {
    return _config[_Config.apiConnectTimeout];
  }

  static String get logLevel {
    return _config[_Config.logLevel];
  }
}

class _Config {
  static const current_env = 'CURRENT_ENV';
  static const apiURL = 'BACKEND_API';
  static const apiConnectTimeout = 'API_CONNECT_TIMEOUT';
  static const logLevel = 'LOG_LEVEL';

  static Map<String, dynamic> devConfig = {};
}

Future<void> _initAndroidAppSetting(Environment env, Directory storage) async {
  final file = File(storage.path + '/AppSetting.xml').existsSync();
  File fileAndroidAppSetting;
  String defaultServerAddress = 'url:Demo'; //TODO
  if (!file) {
    fileAndroidAppSetting =
        await File(storage.path + '/AppSetting.xml').create(recursive: true);

    fileAndroidAppSetting.writeAsStringSync(
        '<data>\n<setting>\n<MainServerAddress>' +
            defaultServerAddress +
            '</MainServerAddress><LogLevel>Warning</LogLevel><!--Error,Warning,Info-->\n</setting>\n</data>');
  } else {
    fileAndroidAppSetting = File(storage.path + '/AppSetting.xml');
  }
  final document = XmlDocument.parse(fileAndroidAppSetting.readAsStringSync());

  final mainServerAddress =
      document.findAllElements('MainServerAddress').first.text;
  if (env == Environment.dev) {
    _Config.devConfig = {
      _Config.current_env: env,
      _Config.apiURL: _fixUrl(mainServerAddress),
      _Config.apiConnectTimeout: 240000,
      _Config.logLevel: 'Info',
    };
  }
}

String _fixUrl(String url) {
  if (url.endsWith("/")) {
    return url.substring(0, url.length - 1);
  }
  return url;
}
