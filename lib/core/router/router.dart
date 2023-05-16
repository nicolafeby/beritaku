import 'package:beritaku/core/router/router_constant.dart';
import 'package:beritaku/injection/injection.dart';
import 'package:beritaku/presentation/home/bloc/home_headline/home_headline_bloc.dart';
import 'package:beritaku/presentation/home/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return BlocProvider(
          create: (context) => sl<HomeHeadlineBloc>(),
          child: const HomePage(),
        );
      default:
        return BlocProvider(
          create: (context) => sl<HomeHeadlineBloc>(),
          child: const HomePage(),
        );
    }
  }

  Route? generateAppRoutes(RouteSettings settings) {
    Widget? getRoutedWidget = getPageRoute(settings);
    return generateRouter(getRoutedWidget, settings);
  }
}
