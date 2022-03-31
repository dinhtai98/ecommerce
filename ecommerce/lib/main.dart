import 'package:ecommerce/global/providers.dart';
import 'package:ecommerce/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'core/utils/native_utils.dart';
import 'core/utils/storage_utils.dart';
import 'global/environment.dart';
import 'global/locator.dart';
import 'global/my_router_observer.dart';
import 'global/router.dart';

void main() {
  mainDelegate(Environment.dev);
}

Future<void> mainDelegate(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await ensureFilePermission();
  var storage = await StorageUtils.getApplicationPermanentDirectory();
  EnvironmentUtil.setEnvironment(env, storage);
  await setupLocator();
  runApp(const MyApp());
}

Future<void> ensureFilePermission() async {
  if (await NativeUtils.isAndroidSDK30OrAbove()) {
    var filePermissionMethodChannel =
        const MethodChannel('file_permission_channel');
    if (await filePermissionMethodChannel.invokeMethod('checkFilePermission') ==
        false) {
      await filePermissionMethodChannel.invokeMethod('request');
    }
  } else {
    await Permission.storage.request();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...viewModelProviders],
      child: GetMaterialApp(
        title: 'ECR Ticketing app',
        navigatorKey: NavigationUtils.navigatorKey,
        onGenerateRoute: (settings) => MyRouter.generateRoute(settings),
        navigatorObservers: [MyRouteObserver()],
        initialRoute: MyRouter.splash,
        theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
