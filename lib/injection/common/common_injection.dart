part of '../injection.dart';

class CommonInjection {
  static Future<void> configureCommonInjection() async {
    sl.registerLazySingleton(() => ApiService());
  }
}
