part of '../injection.dart';

class BlocInjection {
  static Future<void> configureBlocInjection() async {
    sl.registerFactory(() => HomeHeadlineBloc(usecase: sl()));
  }
}
