import 'package:flutter_clean_arc_base/index.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
          if (1 == 1) {
            return const AuthenticationScreen();
          }
          return Center(
            child: StreamBuilder<String?>(
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
                  if (data.connectionState == ConnectionState.waiting) {
                    return const AppCircularProgress();
                  }
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
