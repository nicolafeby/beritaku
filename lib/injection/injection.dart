import 'package:beritaku/core/network/api_service.dart';
import 'package:beritaku/data/home/datasources/home_headline_remote_datasource.dart';
import 'package:beritaku/data/home/repositories/home_headline_repository_impl.dart';
import 'package:beritaku/domain/home/repositories/home_headline_repository.dart';
import 'package:beritaku/domain/home/usecases/home_headline_usecase.dart';
import 'package:beritaku/presentation/home/bloc/home_headline/home_headline_bloc.dart';
import 'package:get_it/get_it.dart';

part 'bloc/bloc_injection.dart';
part 'common/common_injection.dart';
part 'datasource/datacource_injection.dart';
part 'repository/repository_injection.dart';
part 'usecase/usecase_injection.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await BlocInjection.configureBlocInjection();
  await DataSourceInjection.configureDataSourceInjection();
  await RepositoryInjection.configureRepositoryInjection();
  await UsecaseInjection.configureUsecaseInjection();
  await CommonInjection.configureCommonInjection();
}
