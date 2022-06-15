import 'package:PregnancyApp/pages/example_dashboard_chat_page/dashboard.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:PregnancyApp/pages/navbar_page/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common/constants/router_constants.dart';
import '../login_page/login_page.dart';
import '../pages/example_dashboard_chat_page/chat_room.dart';
import '../pages/example_dashboard_chat_page/login_example_page/login_example_page.dart';
import '../utils/remote_utils.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RouteName.navBar:
        return MaterialPageRoute(builder: (_) => BottomNav());
      case RouteName.dashboard:
        return MaterialPageRoute(builder: (_) => Dashboard());
      case RouteName.chatRoom:
        return MaterialPageRoute(builder: (_) => ChatRoom(arguments:getDataValue(settings.arguments) ));


      // case RouteName.order:
      //   return MaterialPageRoute(builder: (_) => OrderPage());
      // case RouteName.movieDetailScreen:
      //   final MovieDetailArguments arguments = settings.arguments;
      //   return MaterialPageRoute(
      //     builder: (_) => MovieDetailScreen(
      //       movieId: arguments.movieId,
      //       coverPath: arguments.coverPath,
      //       title: arguments.title,
      //     ),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static Map<String, WidgetBuilder> _getCombinedRoutes() => {};

  static Map<String, WidgetBuilder> getAll() => _getCombinedRoutes();
}
