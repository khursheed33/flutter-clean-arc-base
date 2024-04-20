import 'package:flutter_clean_arc_base/index.dart';

/// Authentication Screen with Form and validation
class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<AuthViewModel>(
        builder: (context, model, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: AppTitle("Authentication"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                    AppRoutePaths.root,
                  );
                },
                child: const AppTitle(
                  "Log out",
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  model.setAppTheme(Brightness.dark);
                },
                child: const AppTitle(
                  "Toggle",
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
