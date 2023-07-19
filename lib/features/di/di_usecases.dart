import 'package:flutter_clean_arc_base/features/domain/usecases/shared/get_user_usecase.dart';
import 'package:get_it/get_it.dart';

import '../../core/usecases/safe_api_call_usecase.dart';

/// `DiRepositories` class responsible to register and inject all types of repositories and their implementations.

class DiUsecases {
  final GetIt locator;
  DiUsecases({required this.locator}) {
    // Safe API call Usecase
    locator.registerLazySingleton<SafeApiCallUsecase>(() => SafeApiCallUsecase(
          safeApiCall: locator.call(),
        ));

    // Get User Usecase
    locator.registerLazySingleton<GetLocalUserUsecase>(
      () => GetLocalUserUsecase(
        repository: locator.call(),
      ),
    );
  }
}
