import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_clean_arc_base/index.dart';

final GetIt locator = GetIt.instance;
late SharedPreferences preferences;

Future<void> initializeHive() async {
  final appDocumentsDirectory = await getSupportDir();
  // Provide the path to store the Hive boxes (data)
  Hive.init(appDocumentsDirectory);
  // Open Hive Box
  await Hive.openBox(HiveCollections.localDB);
}

Future<SharedPreferences> initializeSharedPreferences() async {
  return await SharedPreferences.getInstance();
}

Future<void> initializeDependencies() async {
  // Initializations::::::::::::::::::::::::::::::::::::
  preferences = await initializeSharedPreferences();
  await initializeHive();

// ------------------------------------------------------
// ::::::: VIEWMODELS/PROVIDERS/CONTROLLERS :::::::::::::
  DiViewModels(locator: locator);
//:::::::::::::::: USECASES :::::::::::::::::::::::::::::
  DiUsecases(locator: locator);
//::::::::::::::: DATA SOURCES ::::::::::::::::::::::::::
  DiDatasources(locator: locator);
//:::::::::::::::  REPOSITORIES :::::::::::::::::::::::::
  DiRepositories(locator: locator);
// :::::::: EXTERNAL DATA SOURCES/ DEPENDENCIES :::::::::
  final Dio dio = Dio();
  final Connectivity connectivity = Connectivity();
  final Box hiveBox = Hive.box(HiveCollections.localDB);
  final sharedPreferences = await SharedPreferences.getInstance();
  final AwesomeNotifications notification = AwesomeNotifications();

  locator.registerLazySingleton<Dio>(() => dio);
  locator.registerLazySingleton<Box>(() => hiveBox);
  locator.registerLazySingleton<Connectivity>(() => connectivity);
  locator.registerLazySingleton<AwesomeNotifications>(() => notification);
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
