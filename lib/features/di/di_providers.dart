import 'package:get_it/get_it.dart';

import '../presentation/providers/auth_view_model.dart';

class DiProviders {
  final GetIt locator;
  DiProviders({required this.locator}) {
    locator.registerFactory<AuthViewModel>(() => AuthViewModel());
  }
}
