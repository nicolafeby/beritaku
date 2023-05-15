import 'package:beritaku/core/utils/app_constant.dart';
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

  // Future<PokedexDetailEntities> getPokedexDetail(
  //     RequestPokedexDetailModel params) async {
  //   var response = await get('${AppConstant.baseUrl}/pokemon/${params.id}');
  //   return PokedexDetailModel.fromJson(response.data);
  // }

  // Future<PokedexListEntities> getPokedexList(
  //     RequestPokedexListModel params) async {
  //   var response = await get('${AppConstant.baseUrl}/pokemon',
  //       queryParameters: params.toJson());
  //   return PokedexListModel.fromJson(response.data);
  // }
}
