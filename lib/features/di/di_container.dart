import 'package:flutter_clean_arc_base/features/views/providers/auth_view_model.dart';
import 'package:get_it/get_it.dart';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../core/network/connection.dart';
import '../../core/usecases/safe_api_call_usecase.dart';
import '../../core/utils/safe_api_call.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
/* 
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::: VIEWMODELS/PROVIDERS/CONTROLLERS ::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 */

  locator.registerFactory<AuthViewModel>(() => AuthViewModel());

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

  final AwesomeNotifications notification = AwesomeNotifications();
  final Connectivity connectivity = Connectivity();

  locator.registerLazySingleton(() => notification);
  locator.registerLazySingleton(() => connectivity);
}
