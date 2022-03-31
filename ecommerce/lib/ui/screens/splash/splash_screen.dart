import 'dart:io';

import 'package:ecommerce/global/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isIOS) {
          exit(0);
        }
        return true;
      },
      child: Scaffold(
        body: InkWell(
          onTap: () {
            Get.toNamed(MyRouter.home);
          },
          child: SafeArea(
            child: Center(
              child: Container(
                width: 300.sp,
                height: 300.sp,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/app_logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
