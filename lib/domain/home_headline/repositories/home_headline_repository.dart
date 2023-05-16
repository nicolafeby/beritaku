import 'package:beritaku/core/error/errors.dart';
import 'package:beritaku/core/model/request/request_home_headline_model.dart';
import 'package:beritaku/domain/home_headline/entities/home_headline_entities.dart';
import 'package:dartz/dartz.dart';

abstract class HomeHeadlineRepository {
  Future<Either<Failures, HomeHeadlineEntities>> getHomeHeadline(
      RequestHomeHeadlineModel params);
}
