import 'package:PregnancyApp/pages/home_page/dashboard.dart';
import 'package:PregnancyApp/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common/constants/router_constants.dart';
import '../pages/login_page/login_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RouteName.dashboard:
        return MaterialPageRoute(builder: (_) => Dashboard());
      case RouteName.login:
        return MaterialPageRoute(builder: (_) => LoginPage());

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
