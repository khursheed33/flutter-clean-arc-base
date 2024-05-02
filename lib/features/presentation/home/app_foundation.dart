import 'package:flutter_clean_arc_base/index.dart';

class AppFoundation extends StatelessWidget {
  const AppFoundation({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.appProviders,
      child: BaseView<AppPreferencesViewModel>(
        builder: (context, model, _) {
          if (model.state == ViewState.Loading) {
            return const SplashScreen();
          }
          return MaterialApp(
            title: AppText.appName,
            theme: model.userPreferences.themeType == ThemeType.dark
                ? ThemeData.dark()
                : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            home: const AuthenticationScreen(),
          );
        },
      ),
    );
  }
}
