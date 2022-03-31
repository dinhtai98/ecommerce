
import 'package:ecommerce/core/hive_database/daos/session_dao.dart';
import 'package:get_it/get_it.dart';

void registerDaoSingletons(GetIt locator) {
  locator.registerLazySingleton(() => SessionDao());
}
