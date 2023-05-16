part of '../injection.dart';

class BlocInjection {
  static Future<void> configureBlocInjection() async {
    sl.registerFactory(() => HomeHeadlineBloc(usecase: sl()));
    sl.registerFactory(() => HomeEverythingBloc(usecase: sl()));
  }
}
