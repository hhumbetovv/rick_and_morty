import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/services/char_service.dart';
import 'data/services/ep_service.dart';
import 'data/services/loc_service.dart';
import 'data/services/local_storage_service.dart';

final getIt = GetIt.instance;

void setServices(Dio dio) {
  getIt.registerLazySingleton<CharService>(() => CharService(dio));
  getIt.registerLazySingleton<LocService>(() => LocService(dio));
  getIt.registerLazySingleton<EpService>(() => EpService(dio));
  getIt.registerSingletonAsync(() => LocalStorageService.initialize());
}
