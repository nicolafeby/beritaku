part of '../injection.dart';

class UsecaseInjection {
  static Future<void> configureUsecaseInjection() async {
    sl.registerLazySingleton(() => HomeHeadlineUsecase(repository: sl()));
  }
}
