import 'package:flutter_clean_arc_base/index.dart';


/// The `appTheme` function returns a `ThemeData` object that defines the color scheme and typography
/// for the Flutter application.
///
/// Args:
///   context (BuildContext): The `context` parameter is a required parameter in the `appTheme`
/// function. It is of type `BuildContext` and represents the current build context of the widget tree.
/// It is used to access the theme data and other resources from the widget tree.
///
/// Returns:
///   The `appTheme` function returns a `ThemeData` object.

class AppFoundation extends StatelessWidget {
  const AppFoundation({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.appProviders,
      child: MaterialApp(
        theme: appTheme(context),
        title: AppText.appName,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutePaths.root,
        onGenerateRoute: AppRoutes.routes,
      ),
    );
  }
}

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    // Color Scheme
    fontFamily: FontType.Fira.name,
    canvasColor: const Color.fromARGB(255, 251, 245, 247),
    splashColor: Colors.pink[100],
    focusColor: Colors.pink[200],
    hoverColor: Colors.pink[300],
    shadowColor: Colors.pink[900],
    // Typography
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: FontType.Fira.name,
        color: Colors.pink,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),
      displayMedium: TextStyle(
        color: Colors.pink,
        fontFamily: FontType.Fira.name,
        fontWeight: FontWeight.normal,
        fontSize: 30,
      ),
      displaySmall: TextStyle(
        color: Colors.pink,
        fontFamily: FontType.Fira.name,
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
      headlineMedium: TextStyle(
        color: Colors.pink,
        fontFamily: FontType.Fira.name,
        fontWeight: FontWeight.normal,
        fontSize: 26,
      ),
      headlineSmall: TextStyle(
        color: Colors.pink,
        fontFamily: FontType.Fira.name,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      titleLarge: TextStyle(
        color: Colors.pink,
        fontFamily: FontType.Fira.name,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      bodyLarge: TextStyle(
        color: Colors.grey[600],
        fontFamily: FontType.Signika.name,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: Colors.pink,
        fontFamily: FontType.Signika.name,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
        .copyWith(background: Colors.white),
  );
}
