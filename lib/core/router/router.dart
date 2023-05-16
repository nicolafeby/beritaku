import 'package:beritaku/core/router/router_constant.dart';
import 'package:beritaku/injection/injection.dart';
import 'package:beritaku/presentation/home/bloc/home_everything/home_everything_bloc.dart';
import 'package:beritaku/presentation/home/bloc/home_headline/home_headline_bloc.dart';
import 'package:beritaku/presentation/home/page/home.dart';
import 'package:beritaku/presentation/splash/splash_screen.dart';
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
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<HomeHeadlineBloc>(),
            ),
            BlocProvider(
              create: (context) => sl<HomeEverythingBloc>(),
            ),
          ],
          child: const HomePage(),
        );
      default:
        return const SplashScreen();
    }
  }

  Route? generateAppRoutes(RouteSettings settings) {
    Widget? getRoutedWidget = getPageRoute(settings);
    return generateRouter(getRoutedWidget, settings);
  }
}
