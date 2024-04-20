import 'package:flutter_clean_arc_base/index.dart';

class DiViewModels {
  final GetIt locator;
  DiViewModels({required this.locator}) {
    // Authentication ViewModel
    locator.registerFactory<AuthViewModel>(
      () => AuthViewModel(
          // updateUserPreferencesUsecase: locator.call(),
          // getUserPreferencesUsecase: locator.call(),
          // createUserPreferencesUsecase: locator.call(),
          ),
    );
  }
}
