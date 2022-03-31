import 'package:ecommerce/core/services/implements/session_service.dart';
import 'package:ecommerce/core/services/interfaces/isession_service.dart';
import 'package:get_it/get_it.dart';

void registerServiceSingletons(GetIt locator) {
  locator.registerLazySingleton<ISessionService>(() => SessionService());
 
}
