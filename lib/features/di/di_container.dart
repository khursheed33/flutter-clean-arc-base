import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_arc_base/features/data/repositories/authentication_repo_impl.dart';
import 'package:flutter_clean_arc_base/features/domain/repositories/authentication_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../../core/constants/hive_collections.dart';
import '../../core/network/connection.dart';
import '../../core/usecases/safe_api_call_usecase.dart';
import '../../core/utils/safe_api_call.dart';
import 'di_providers.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
/* 
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::: VIEWMODELS/PROVIDERS/CONTROLLERS ::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 */

  DiProviders(locator: locator);

/* 
::::::::::::::::::::::::::::::::::::::::::::::::::::::
     :::::::::::::::: USECASES :::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::
 */
// ================ Safe Api Call ===============================

  locator.registerLazySingleton<SafeApiCallUsecase>(() => SafeApiCallUsecase(
        safeApiCall: locator.call(),
      ));

/* 
::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::LOCAL DATA SOURCES ::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::
 */

/* 
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::REMOTE DATA SOURCES ::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 */

/* 
:::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::  REPOSITORIES ::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::
 */
  locator.registerLazySingleton<AuthenticationRepository>(
    () => AuthRepositoryImpl(
      datasource: locator.call(),
      safeApiCall: locator.call(),
    ),
  );

/* 
:::::::::::::::::::::::::::::::
    :::::::: CORE ::::::::::::::::
:::::::::::::::::::::::::::::::
 */

  locator.registerFactory<NetworkInfo>(() => NetworkInfoImpl(
        connectivity: locator.call(),
      ));
  locator.registerFactory<SafeApiCall>(() => SafeApiCallImpl(
        networkInfo: locator.call(),
      ));

/* 
:::::::::::::::::::::::::::::::::::::::::::::::
    :::::::: EXTERNAL DATA SOURCES - DEPENDENCIES ::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::
 */
  final Dio dio = Dio();
  final Connectivity connectivity = Connectivity();
  final Box hiveBox = Hive.box(HiveCollections.localDB);
  final AwesomeNotifications notification = AwesomeNotifications();

  locator.registerLazySingleton<Dio>(() => dio);
  locator.registerLazySingleton<Box>(() => hiveBox);
  locator.registerLazySingleton<Connectivity>(() => connectivity);
  locator.registerLazySingleton<AwesomeNotifications>(() => notification);
}
