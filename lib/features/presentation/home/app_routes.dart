import 'package:flutter/cupertino.dart';

import '../screens/splash/splash_screen.dart';
import 'app_route_paths.dart';

class AppRoutes {
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
