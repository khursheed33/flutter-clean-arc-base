import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_base/features/presentation/base/base_view_model.dart';
import 'package:flutter_clean_arc_base/features/presentation/home/app_route_paths.dart';
import 'package:flutter_clean_arc_base/features/presentation/providers/auth_view_model.dart';

import '../../../../core/widgets/app_title.dart';

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
