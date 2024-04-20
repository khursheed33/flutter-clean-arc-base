import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_arc_base/index.dart';

/// The `AppRoutes` class defines a static method `routes` that returns a `Route` based on the provided
/// `RouteSettings` name.

abstract class AppRoutes {
  static Route<dynamic>? routes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutePaths.root:
        return CupertinoPageRoute(
          builder: (ctx) => const SplashScreen(),
          settings: settings,
          title: AppRoutePaths.root,
        );
      case AppRoutePaths.authentication:
        return CupertinoPageRoute(
          builder: (ctx) => const SplashScreen(),
          settings: settings,
          title: AppRoutePaths.authentication,
        );
    }
    return CupertinoPageRoute(
      builder: (ctx) => const SplashScreen(),
      settings: settings,
      title: AppRoutePaths.root,
    );
  }
}
