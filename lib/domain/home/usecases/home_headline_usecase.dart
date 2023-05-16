import 'package:beritaku/core/error/errors.dart';
import 'package:beritaku/core/model/request/request_home_headline_model.dart';
import 'package:beritaku/core/usecase/usecase.dart';
import 'package:beritaku/domain/home/entities/home_headline_entities.dart';
import 'package:beritaku/domain/home/repositories/home_headline_repository.dart';
import 'package:dartz/dartz.dart';

class HomeHeadlineUsecase
    implements Usecase<HomeHeadlineEntities, RequestHomeHeadlineModel> {
  HomeHeadlineRepository repository;
  HomeHeadlineUsecase({required this.repository});
  @override
  Future<Either<Failures, HomeHeadlineEntities>> call(
      RequestHomeHeadlineModel params) async {
    return repository.getHomeHeadline(params);
  }
}
