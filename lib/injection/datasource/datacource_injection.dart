part of '../injection.dart';

class DataSourceInjection {
  static Future<void> configureDataSourceInjection() async {
    // sl.registerLazySingleton<PokedexListRemoteDataSource>(
    //     () => PokedexListRemoteDataSourceImpl(apiService: sl()));
    // sl.registerLazySingleton<PokedexDetailRemoteDataSource>(
    //     () => PokedexDetailRemoteDataSourceImpl(apiService: sl()));
  }
}
