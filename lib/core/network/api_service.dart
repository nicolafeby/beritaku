import 'package:beritaku/core/model/request/request_home_everything_model.dart';
import 'package:beritaku/core/model/request/request_home_headline_model.dart';
import 'package:beritaku/core/model/response/home_everything_model.dart';
import 'package:beritaku/core/model/response/home_headline_model.dart';
import 'package:beritaku/core/utils/app_constant.dart';
import 'package:beritaku/domain/home_everything/entities/home_everything_entities.dart';
import 'package:beritaku/domain/home_headline/entities/home_headline_entities.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class ApiService with DioMixin implements Dio {
  @override
  HttpClientAdapter get httpClientAdapter => DefaultHttpClientAdapter();

  @override
  Interceptors get interceptors => Interceptors()
    ..add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      request: true,
      requestHeader: true,
      responseHeader: true,
    ))
    ..add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.headers.addAll(await userAgentClientHintsHeader());
      handler.next(options);
      return;
    }));

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: AppConstant.baseUrl,
        contentType: 'application/json',
      );

  Future<HomeHeadlineEntities> getHomeHeadline(
      RequestHomeHeadlineModel params) async {
    var response = await get('https://newsapi.org/v2/top-headlines',
        queryParameters: params.toJson());
    return HomeHeadlineModel.fromJson(response.data);
  }

  Future<HomeEverythingEntities> getHomeEverything(
      RequestHomeEverythingModel params) async {
    var response = await get('https://newsapi.org/v2/everything', queryParameters: params.toJson());
    return HomeEverythingModel.fromJson(response.data);
  }
}
