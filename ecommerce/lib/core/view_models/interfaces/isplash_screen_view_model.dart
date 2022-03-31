import 'package:flutter/material.dart';

abstract class ISplashScreenViewModel implements ChangeNotifier {
  String get deviceSerial;
}
