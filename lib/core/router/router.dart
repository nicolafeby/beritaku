import 'package:beritaku/core/router/router_constant.dart';
import 'package:beritaku/presentation/home/page/home.dart';
import 'package:flutter/material.dart';

class Router {
  Route generateRouter(Widget page, RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => getPageRoute(settings),
    );
  }

  Widget getPageRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstant.homeNewsList:
        return const HomePage();
      default:
        return const HomePage();
    }
  }

  Route? generateAppRoutes(RouteSettings settings) {
    Widget? getRoutedWidget = getPageRoute(settings);
    return generateRouter(getRoutedWidget, settings);
  }
}
