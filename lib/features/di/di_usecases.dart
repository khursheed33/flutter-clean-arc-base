import 'package:flutter_clean_arc_base/index.dart';

/// `DiRepositories` class responsible to register and inject all types of repositories and their implementations.

class DiUsecases {
  final GetIt locator;
  DiUsecases({required this.locator}) {
    // Safe API call Usecase
    locator.registerLazySingleton<SafeApiCallUsecase>(() => SafeApiCallUsecase(
          safeApiCall: locator.call(),
        ));

    // Is Connected Usecase
    locator.registerLazySingleton<IsConnectedUsecase>(() => IsConnectedUsecase(
          repository: locator.call(),
        ));

    // Sign In User Usecase
    locator.registerLazySingleton<SignInUsecase>(
      () => SignInUsecase(
        repository: locator.call(),
      ),
    );
    // Sign Out User Usecase
    locator.registerLazySingleton<SignOutUsecase>(
      () => SignOutUsecase(
        repository: locator.call(),
      ),
    );
    // Get User Usecase
    locator.registerLazySingleton<GetLocalUserUsecase>(
      () => GetLocalUserUsecase(
        repository: locator.call(),
      ),
    );
    // Create User Usecase
    locator.registerLazySingleton<CreateUserUsecase>(
      () => CreateUserUsecase(
        repository: locator.call(),
      ),
    );
    // Get User Usecase
    locator.registerLazySingleton<GetUserUsecase>(
      () => GetUserUsecase(
        repository: locator.call(),
      ),
    );
    // Get Token Usecase
    locator.registerLazySingleton<GetTokenUsecase>(
      () => GetTokenUsecase(
        repository: locator.call(),
      ),
    );
  }
}
