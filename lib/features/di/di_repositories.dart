import '../data/repositories/authentication_repo_impl.dart';
import '../data/repositories/connectivity_repo_impl.dart';
import '../domain/repositories/authentication_repository.dart';
import '../domain/repositories/connectivity_repository.dart';
import 'package:get_it/get_it.dart';

/// `DiRepositories` class responsible to register and inject all types of repositories and their implementations.

class DiRepositories {
  final GetIt locator;
  DiRepositories({required this.locator}) {
    locator.registerFactory<ConnectivityRepository>(
      () => ConnectivityRepositoryImpl(
        datasource: locator.call(),
      ),
    );
    locator.registerFactory<AuthenticationRepository>(
      () => AuthRepositoryImpl(
        datasource: locator.call(),
        safeApiCall: locator.call(),
      ),
    );
  }
}
