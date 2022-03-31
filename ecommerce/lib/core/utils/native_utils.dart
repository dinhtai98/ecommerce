import 'package:device_info/device_info.dart';

class NativeUtils {
  static Future<bool> isAndroidSDK30OrAbove() async {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    return androidInfo.version.sdkInt >= 30;
  }
}
