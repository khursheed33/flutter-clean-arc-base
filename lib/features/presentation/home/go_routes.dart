import 'package:flutter_clean_arc_base/index.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouters = GoRouter(routes: [
  GoRoute(
    name: AppRoutePaths.root,
    path: '/',
    pageBuilder: (context, state) {
      return const MaterialPage(child: AuthenticationScreen());
    },
  ),
  GoRoute(
    name: AppRoutePaths.authentication,
    path: '/auth',
    pageBuilder: (context, state) {
      return const MaterialPage(child: SplashScreen());
    },
  ),
]);
