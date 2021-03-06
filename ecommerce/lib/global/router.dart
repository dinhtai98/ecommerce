import 'package:ecommerce/ui/screens/basket/basket_screen.dart';
import 'package:ecommerce/ui/screens/home/home_screen.dart';
import 'package:ecommerce/ui/screens/product/product_screen.dart';
import 'package:ecommerce/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String productScreen = '/productScreen';
  static const String basket = '/basket';

  static PageRouteBuilder _buildRouteNavigationWithoutEffect(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      transitionDuration: Duration.zero,
      settings: settings,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const SplashScreen(),
        );
      case home:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const HomeScreen(),
        );
      case productScreen:
        return _buildRouteNavigationWithoutEffect(
          settings,
          ProductScreen(
            arguments: settings.arguments as ProductScreenArguments,
          ),
        );
      case basket:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const BasketScreen(),
        );
      default:
        return _buildRouteNavigationWithoutEffect(
          settings,
          Scaffold(
            body: Center(
              child: Text('No route found: ${settings.name}.'),
            ),
          ),
        );
    }
  }

  static void onRouteChanged(String screenName) {
    if (['', null].contains(screenName)) {
      return;
    }
  }
}
