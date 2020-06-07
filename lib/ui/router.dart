import 'package:flutter/material.dart';
import './views/homeScreen.dart';
import './views/splashScreen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      //default route
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
        break;

      //homeScreen route
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Text('No such route exists'),
        ));
    }
  }
}