import 'package:flutter_clean_arc_base/index.dart';


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
