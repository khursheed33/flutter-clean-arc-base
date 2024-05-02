import 'package:flutter_clean_arc_base/index.dart';

/// Authentication Screen with Form and validation
class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<AppPreferencesViewModel>(
        onModelReady: (model) {
          model.getPreferences();
        },
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
              const SizedBox(height: 10),
              AppElevatedButton(
                isLoading: model.state == ViewState.Loading,
                onPressed: () async {
                  final themeType =
                      model.userPreferences.themeType == ThemeType.light
                          ? ThemeType.dark
                          : ThemeType.light;
                  final newPrefs = UserPreferencesEntity(
                    username: "1",
                    name: "Khursheed",
                    surename: "Gaddi",
                    themeType: themeType,
                    languageType: LanguageType.english,
                    currency: "inr",
                    themeColor: "red",
                  );

                  "Current: ${model.userPreferences.themeType} | $themeType"
                      .log();
                  await model.updatePreferences(newPrefs);
                },
                title: "Dark Theme",
              )
            ],
          );
        },
      ),
    );
  }
}
