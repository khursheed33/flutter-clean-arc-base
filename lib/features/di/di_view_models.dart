import 'package:get_it/get_it.dart';

import '../presentation/providers/auth_view_model.dart';

class DiViewModels {
  final GetIt locator;
  DiViewModels({required this.locator}) {
    locator.registerFactory<AuthViewModel>(() => AuthViewModel());
  }
}
