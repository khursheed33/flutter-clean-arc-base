import 'package:flutter/cupertino.dart';

import '../views/screens/splash/splash_screen.dart';
import 'route_paths.dart';

class MMRoutes {
  static Route<dynamic>? routes(RouteSettings settings) {
    switch (settings.name) {
      case MMRoutePaths.root:
        return CupertinoPageRoute(
          builder: (ctx) => const MMSplashScreen(),
          settings: settings,
          title: MMRoutePaths.root,
        );
    }
    return CupertinoPageRoute(
      builder: (ctx) => const MMSplashScreen(),
      settings: settings,
      title: MMRoutePaths.root,
    );
  }
}
