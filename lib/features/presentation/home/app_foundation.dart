import 'package:flutter_clean_arc_base/index.dart';

class AppFoundation extends StatelessWidget {
  const AppFoundation({super.key});

  @override
  Widget build(BuildContext context) {
    // ThemeData baseTheme = appTheme(context, ThemeData.dark());

    return MultiProvider(
      providers: AppProviders.appProviders,
      child: BaseView<AuthViewModel>(
        onModelReady: (model) async {
          model.setAppTheme(Brightness.light);
          await model.getPreferences();
        },
        builder: (context, model, _) {
          if (model.state == ViewState.Loading) {
            return const MaterialApp(
              title: AppText.appName,
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            );
          }

          return StreamBuilder(
              stream: model.preferencesStream,
              builder: (ctx, stream) {
                "STATE: ${stream.connectionState}".log();
                "DATA: ${stream.data}".log();
                ThemeData? currentTheme = stream.data;
                if (stream.connectionState == ConnectionState.waiting) {
                  return const MaterialApp(
                    title: AppText.appName,
                    debugShowCheckedModeBanner: false,
                    home: SplashScreen(),
                  );
                } else if (stream.connectionState == ConnectionState.done) {
                  return MaterialApp(
                    title: AppText.appName,
                    theme: currentTheme ?? ThemeData.light(),
                    debugShowCheckedModeBanner: false,
                    initialRoute: AppRoutePaths.authentication,
                    onGenerateRoute: AppRoutes.routes,
                  );
                } else if ((stream.connectionState == ConnectionState.active)) {
                  return MaterialApp(
                    title: AppText.appName,
                    theme: currentTheme ?? ThemeData.light(),
                    debugShowCheckedModeBanner: false,
                    home: const AuthenticationScreen(),
                  );
                } else if ((stream.connectionState == ConnectionState.none)) {
                  return MaterialApp(
                      title: AppText.appName,
                      theme: currentTheme ?? ThemeData.light(),
                      debugShowCheckedModeBanner: false,
                      home: const Scaffold(
                        body: Center(
                          child: AppTitle("None----"),
                        ),
                      ));
                } else {
                  return MaterialApp(
                    title: AppText.appName,
                    theme: currentTheme ?? ThemeData.light(),
                    debugShowCheckedModeBanner: false,
                    home: const Scaffold(
                      body: Center(
                        child: AppTitle("Unknown----"),
                      ),
                    ),
                  );
                }
              });
        },
      ),
    );
  }
}
