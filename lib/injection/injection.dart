import 'package:beritaku/core/network/api_service.dart';
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
