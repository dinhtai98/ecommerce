import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionChecking {
  static Future<bool> check() async {
    return await InternetConnectionChecker().hasConnection;
  }
}
