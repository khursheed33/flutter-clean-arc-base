import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_base/core/extensions/message_log.dart';
import 'package:flutter_clean_arc_base/features/presentation/screens/authentication/authenitication_screen.dart';

import '../../../../core/widgets/app_title.dart';
import '../../providers/auth_view_model.dart';
import '../../base/base_view_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<AuthViewModel>(
        onModelReady: (model) async {
          await model.isTokenExists();
        },
        onModelDispose: (model) {
          model.disposeModel();
        },
        builder: (context, model, _) {
          return Center(
            child: StreamBuilder<User?>(
              stream: model.userStream,
              builder: (ctx, data) {
                "Stream:: ${data.connectionState} | ${data.data}".log();
                if (data.data != null) {
                  // WidgetsBinding.instance.addPostFrameCallback(
                  //   (_) => Navigator.pushReplacementNamed(
                  //     context,
                  //     AppRoutePaths.authentication,
                  //   ),
                  // );
                  return const AuthenticationScreen();
                } else {
                  if (model.token != null) {
                    return const AuthenticationScreen();
                  }
                  return Center(
                    child: ElevatedButton(
                      onPressed: () {
                        model.login();
                        // model.logout();
                      },
                      child: const AppTitle("Login"),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
