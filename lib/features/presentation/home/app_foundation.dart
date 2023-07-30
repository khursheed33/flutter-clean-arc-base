import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_text.dart';
import '../../../../core/enums/font_type.dart';
import 'app_providers.dart';
import 'app_route_paths.dart';
import 'app_routes.dart';

class AppFoundation extends StatelessWidget {
  const AppFoundation({Key? key}) : super(key: key);

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
