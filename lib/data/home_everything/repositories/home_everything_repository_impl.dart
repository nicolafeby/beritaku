import 'package:beritaku/core/error/errors.dart';
import 'package:beritaku/core/model/request/request_home_everything_model.dart';
import 'package:beritaku/data/home_everything/datasources/home_everything_remote_datasource.dart';
import 'package:beritaku/domain/home_everything/entities/home_everything_entities.dart';
import 'package:beritaku/domain/home_everything/repositories/home_everything_repository.dart';
import 'package:dartz/dartz.dart';

class HomeEverythingRepositoryImpl implements HomeEverythingRepository {
  final HomeEverythingRemoteDataSource remoteDataSource;

  HomeEverythingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, HomeEverythingEntities>> getHomeEverything(
    RequestHomeEverythingModel params,
  ) async {
    try {
      final resp = await remoteDataSource.getHomeEverything(params);
      if (resp.status == 'ok') return Right(resp);
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
