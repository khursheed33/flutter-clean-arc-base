import 'package:flutter_clean_arc_base/features/data/repositories/authentication_repo_impl.dart';
import 'package:flutter_clean_arc_base/features/domain/repositories/authentication_repository.dart';
import 'package:get_it/get_it.dart';

/// `DiRepositories` class responsible to register and inject all types of repositories and their implementations.

class DiRepositories {
  final GetIt locator;
  DiRepositories({required this.locator}) {
    locator.registerFactory<AuthenticationRepository>(
      () => AuthRepositoryImpl(
        datasource: locator.call(),
        safeApiCall: locator.call(),
      ),
    );
  }
}
