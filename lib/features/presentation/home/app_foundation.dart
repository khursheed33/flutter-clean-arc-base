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
          return StreamBuilder<UserPreferencesEntity?>(
            stream: model.getPreferencesStream(),
            builder: (context, snapshot) {
              "State: ${snapshot.connectionState}".log();
              "Data: ${snapshot.data}".log();
              ThemeData themeData = snapshot.data?.themeType == ThemeType.dark
                  ? ThemeData.dark()
                  : ThemeData.light();

              return MaterialApp(
                title: AppText.appName,
                theme: themeData,
                debugShowCheckedModeBanner: false,
                home: snapshot.connectionState == ConnectionState.waiting
                    ? const SplashScreen()
                    : const AuthenticationScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
