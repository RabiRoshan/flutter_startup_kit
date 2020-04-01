import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'ui/views/home_screen.dart';
import 'ui/views/login_screen.dart';

const String HomeRoute = '/home';
const String LoginRoute = '/login';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var argumentsMap = settings.arguments as Map<String, dynamic>;
    switch (settings.name) {
      case '/':
        return GetRoute(
          page: LoginScreen(),
          settings: settings,
        );
      case LoginRoute:
        return GetRoute(settings: settings, page: LoginScreen());
      case HomeRoute:
        return GetRoute(
          settings: settings,
          page: HomeScreen(
            currentUser: argumentsMap["User"],
          ),
        );

      default:
        return GetRoute(
          settings: settings,
          page: Scaffold(
            appBar: AppBar(),
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
