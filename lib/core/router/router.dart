import 'package:beritaku/core/model/argument/detail_arg.dart';
import 'package:beritaku/core/router/router_constant.dart';
import 'package:beritaku/injection/injection.dart';
import 'package:beritaku/presentation/category_filter/page/category_filter.dart';
import 'package:beritaku/presentation/detail/page/detail_webview.dart';
import 'package:beritaku/presentation/home/bloc/home_everything/home_everything_bloc.dart';
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
      case RouterConstant.detailWebview:
        return WebViewContainer(
          arg: settings.arguments as DetailArg,
        );
      case RouterConstant.categoryFilter:
        return const CategoryFilter();
      default:
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
    }
  }

  Route? generateAppRoutes(RouteSettings settings) {
    Widget? getRoutedWidget = getPageRoute(settings);
    return generateRouter(getRoutedWidget, settings);
  }
}
