part of '../injection.dart';

class RepositoryInjection {
  static Future<void> configureRepositoryInjection() async {
    sl.registerLazySingleton<HomeHeadlineRepository>(
        () => HomeHeadlineRepositoryImpl(remoteDataSource: sl()));
    sl.registerLazySingleton<HomeEverythingRepository>(
        () => HomeEverythingRepositoryImpl(remoteDataSource: sl()));
  }
}
