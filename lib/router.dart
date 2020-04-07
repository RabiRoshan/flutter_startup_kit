import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'ui/views/enter_user_detail.dart';
import 'ui/views/home_screen.dart';
import 'ui/views/login_screen.dart';

const String HomeRoute = '/home';
const String LoginRoute = '/login';
const String EnterUserDetailRoute = 'enteruserdetail';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return GetRoute(page: LoginScreen(), settings: settings);
      case LoginRoute:
        return GetRoute(settings: settings, page: LoginScreen());
      case EnterUserDetailRoute:
        return GetRoute(settings: settings, page: EnterUserDetail());
      case HomeRoute:
        return GetRoute(settings: settings, page: HomeScreen());
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
