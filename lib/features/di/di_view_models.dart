import 'package:get_it/get_it.dart';

import '../presentation/providers/auth_view_model.dart';

class DiViewModels {
  final GetIt locator;
  DiViewModels({required this.locator}) {
    // Authentication ViewModel
    locator.registerFactory<AuthViewModel>(
      () => AuthViewModel(
        createUserUsecase: locator.call(),
        getTokenUsecase: locator.call(),
        getUserUsecase: locator.call(),
        signOutUsecase: locator.call(),
        signInUsecase: locator.call(),
      ),
    );
  }
}
