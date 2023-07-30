import 'package:flutter/material.dart';
import '../../base/base_view_model.dart';
import '../../home/app_route_paths.dart';
import '../../providers/auth_view_model.dart';

import '../../../../core/widgets/app_title.dart';

/// Authentication Screen with Form and validation
class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      builder: (context, model, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: AppTitle("Authentication"),
            ),
            ElevatedButton(
              onPressed: () {
                model.logout();
                Navigator.of(context).pushReplacementNamed(
                  AppRoutePaths.root,
                );
              },
              child: const AppTitle("Log out"),
            )
          ],
        );
      },
    );
  }
}
