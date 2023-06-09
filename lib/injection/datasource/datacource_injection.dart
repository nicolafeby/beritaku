part of '../injection.dart';

class DataSourceInjection {
  static Future<void> configureDataSourceInjection() async {
    sl.registerLazySingleton<HomeHeadlineRemoteDataSource>(
        () => HomeHeadlineRemoteDataSourceImpl(apiService: sl()));
    sl.registerLazySingleton<HomeEverythingRemoteDataSource>(
        () => HomeEverythingRemoteDataSourceImpl(apiService: sl()));
  }
}
