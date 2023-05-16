import 'package:beritaku/core/model/request/request_home_headline_model.dart';
import 'package:beritaku/core/network/api_service.dart';
import 'package:beritaku/domain/home/entities/home_headline_entities.dart';

abstract class HomeHeadlineRemoteDataSource {
  Future<HomeHeadlineEntities> getHomeHeadline(RequestHomeHeadlineModel params);
}

class HomeHeadlineRemoteDataSourceImpl implements HomeHeadlineRemoteDataSource {
  final ApiService apiService;

  HomeHeadlineRemoteDataSourceImpl({required this.apiService});
  @override
  Future<HomeHeadlineEntities> getHomeHeadline(
    RequestHomeHeadlineModel params,
  ) async {
    final resp = apiService.getHomeHeadline(params);
    return resp;
  }
}
