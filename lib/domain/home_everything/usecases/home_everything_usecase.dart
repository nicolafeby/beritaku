import 'package:beritaku/core/error/errors.dart';
import 'package:beritaku/core/model/request/request_home_everything_model.dart';
import 'package:beritaku/core/usecase/usecase.dart';
import 'package:beritaku/domain/home_everything/entities/home_everything_entities.dart';
import 'package:beritaku/domain/home_everything/repositories/home_everything_repository.dart';
import 'package:dartz/dartz.dart';

class HomeEverythingUsecase
    implements Usecase<HomeEverythingEntities, RequestHomeEverythingModel> {
  HomeEverythingRepository repository;
  HomeEverythingUsecase({required this.repository});
  @override
  Future<Either<Failures, HomeEverythingEntities>> call(
      RequestHomeEverythingModel params) async {
    return repository.getHomeEverything(params);
  }
}
