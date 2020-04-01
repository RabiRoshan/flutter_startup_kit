// import 'package:communication_app/views/screens/check_in_screen.dart';
// import 'package:communication_app/views/screens/manual_checkin_screen.dart';
// import 'package:communication_app/views/screens/messages_screen.dart';
// import 'package:communication_app/views/screens/route_details_screen.dart';
// import 'package:communication_app/views/screens/ticket_details_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:communication_app/views/screens/home_screen.dart';
// import 'package:communication_app/views/screens/login_screen.dart';
// import 'package:communication_app/views/screens/login_screen_user_detail.dart';

// const String HomeRoute = '/home';
// const String LoginRoute = '/login';
// const String LoginUserDetailRoute = '/login_detail';
// const String NavigationRoute = '/navigation';
// const String CheckInRoute = '/check_in';
// const String RoutesRoute = '/routes';
// const String ManualCheckInRoute = '/manual_checkin_route';
// const String MessagesRoute = '/messages';
// const String SettingsRoute = '/login_user_detail';
// const String TicketDetailRoute = '/ticket_detail';

import 'package:flutter/widgets.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var argumentsMap = settings.arguments as Map<String, dynamic>;
    // switch (settings.name) {
    //   case '/':
    //     return GetRoute(
    //       page: LoginScreen(),
    //       settings: settings,
    //     );
    //   case LoginRoute:
    //     return GetRoute(settings: settings, page: LoginScreen());
    //   case LoginUserDetailRoute:
    //     return GetRoute(settings: settings, page: LoginUserDetailScreen());
    //   case RoutesRoute:
    //     return GetRoute(
    //       settings: settings,
    //       page: RouteDetailsScreen(
    //         currentEvent: argumentsMap["event"],
    //       ),
    //     );
    //   case ManualCheckInRoute:
    //     return GetRoute(settings: settings, page: ManualCheckInScreen());
    //   case MessagesRoute:
    //     return GetRoute(settings: settings, page: MessagesScreen());
    //   case CheckInRoute:
    //     return GetRoute(
    //       settings: settings,
    //       page: CheckInScreen(
    //         preSelectedBus: argumentsMap["bus"],
    //         currentEvent: argumentsMap["event"],
    //       ),
    //     );
    //   case TicketDetailRoute:
    //     return GetRoute(settings: settings, page: TicketDetailsScreen());
    //   case HomeRoute:
    //     return GetRoute(settings: settings, page: HomeScreen());

    //   default:
    //     return GetRoute(
    //         settings: settings,
    //         page: Scaffold(
    //           appBar: AppBar(),
    //           body:
    //               Center(child: Text('No route defined for ${settings.name}')),
    //         ));
    // }
  }
}
