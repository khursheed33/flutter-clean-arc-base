import 'package:flutter_clean_arc_base/index.dart';

/// The class AppProviders provides a list of providers for the app

abstract class AppProviders {
  static List<SingleChildWidget> appProviders = [
    ChangeNotifierProvider<AuthViewModel>(
      create: (_) => locator<AuthViewModel>(),
    ),
    ChangeNotifierProvider<AppPreferencesViewModel>(
      create: (_) => locator<AppPreferencesViewModel>(),
    ),
  ];
}
