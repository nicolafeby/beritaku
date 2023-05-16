import 'package:beritaku/core/model/request/request_home_everything_model.dart';
import 'package:beritaku/core/network/api_service.dart';
import 'package:beritaku/domain/home_everything/entities/home_everything_entities.dart';

abstract class HomeEverythingRemoteDataSource {
  Future<HomeEverythingEntities> getHomeEverything(
      RequestHomeEverythingModel params);
}

class HomeEverythingRemoteDataSourceImpl
    implements HomeEverythingRemoteDataSource {
  final ApiService apiService;

  HomeEverythingRemoteDataSourceImpl({required this.apiService});
  @override
  Future<HomeEverythingEntities> getHomeEverything(
    RequestHomeEverythingModel params,
  ) async {
    final resp = apiService.getHomeEverything(params);
    return resp;
  }
}
