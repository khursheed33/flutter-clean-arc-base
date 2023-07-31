import 'package:get_it/get_it.dart';

import '../../core/async/safe_api_call_usecase.dart';
import '../domain/usecases/authentication/create_user_usecase.dart';
import '../domain/usecases/authentication/get_token_usecase.dart';
import '../domain/usecases/authentication/get_user_usecase.dart';
import '../domain/usecases/authentication/sign_in_usecase.dart';
import '../domain/usecases/authentication/sign_out_usecase.dart';
import '../domain/usecases/connectivity/is_connected_usecase.dart';
import '../domain/usecases/shared/get_user_usecase.dart';

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
