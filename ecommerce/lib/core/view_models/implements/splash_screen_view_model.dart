
import 'package:ecommerce/core/view_models/interfaces/isplash_screen_view_model.dart';
import 'package:flutter/material.dart';
class SplashScreenViewModel extends ChangeNotifier
    implements ISplashScreenViewModel {
  @override
  String get deviceSerial => "123";
}