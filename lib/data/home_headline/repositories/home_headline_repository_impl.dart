import 'package:beritaku/core/error/errors.dart';
import 'package:beritaku/core/model/request/request_home_headline_model.dart';
import 'package:beritaku/data/home_headline/datasources/home_headline_remote_datasource.dart';
import 'package:beritaku/domain/home_headline/entities/home_headline_entities.dart';
import 'package:beritaku/domain/home_headline/repositories/home_headline_repository.dart';
import 'package:dartz/dartz.dart';

class HomeHeadlineRepositoryImpl implements HomeHeadlineRepository {
  final HomeHeadlineRemoteDataSource remoteDataSource;

  HomeHeadlineRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, HomeHeadlineEntities>> getHomeHeadline(
    RequestHomeHeadlineModel params,
  ) async {
    try {
      final resp = await remoteDataSource.getHomeHeadline(params);
      if (resp.status == 'ok') return Right(resp);
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
