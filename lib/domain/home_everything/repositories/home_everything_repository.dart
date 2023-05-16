import 'package:beritaku/core/error/errors.dart';
import 'package:beritaku/core/model/request/request_home_everything_model.dart';
import 'package:beritaku/domain/home_everything/entities/home_everything_entities.dart';
import 'package:dartz/dartz.dart';

abstract class HomeEverythingRepository {
  Future<Either<Failures, HomeEverythingEntities>> getHomeEverything(
      RequestHomeEverythingModel params);
}
