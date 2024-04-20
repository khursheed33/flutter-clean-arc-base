import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_arc_base/features/presentation/screens/error_screen.dart';
import 'package:flutter_clean_arc_base/index.dart';

/// The `AppRoutes` class defines a static method `routes` that returns a `Route` based on the provided
/// `RouteSettings` name.

abstract class AppRoutes {
  static Route<dynamic>? routes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutePaths.root:
        return CupertinoPageRoute(
          builder: (ctx) => const AppFoundation(),
          settings: settings,
          title: AppRoutePaths.root,
        );
      case AppRoutePaths.authentication:
        return CupertinoPageRoute(
          builder: (ctx) => const AuthenticationScreen(),
          settings: settings,
          title: AppRoutePaths.authentication,
        );
    }
    return CupertinoPageRoute(
      builder: (ctx) => const ErrorScreen(),
      settings: settings,
      title: AppRoutePaths.root,
    );
  }
}
