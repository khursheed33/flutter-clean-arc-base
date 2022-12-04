import 'package:flutter/material.dart';
import '../../core/constants/app_text.dart';
import '../../core/enums/font_type.dart';
import 'providers.dart';
import 'route_paths.dart';
import 'routes.dart';
import 'package:provider/provider.dart';

class MMAppFoundation extends StatelessWidget {
  const MMAppFoundation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MMProviders.mmProviders,
      child: MaterialApp(
        theme: appTheme(context),
        title: AppText.appName,
        debugShowCheckedModeBanner: false,
        initialRoute: MMRoutePaths.root,
        onGenerateRoute: MMRoutes.routes,
      ),
    );
  }
}

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    // Color Scheme
    fontFamily: FontType.Fira.name,
    primarySwatch: Colors.pink,
    canvasColor: const Color.fromARGB(255, 251, 245, 247),
    splashColor: Colors.pink[100],
    focusColor: Colors.pink[200],
    hoverColor: Colors.pink[300],
    shadowColor: Colors.pink[900],
    backgroundColor: Colors.white,
    // Typography
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: FontType.Fira.name,
        color: Colors.pink,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),
      headline2: TextStyle(
        color: Colors.pink,
        fontFamily: FontType.Fira.name,
        fontWeight: FontWeight.normal,
        fontSize: 30,
      ),
      headline3: TextStyle(
        color: Colors.pink,
        fontFamily: FontType.Fira.name,
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
      headline4: TextStyle(
        color: Colors.pink,
        fontFamily: FontType.Fira.name,
        fontWeight: FontWeight.normal,
        fontSize: 26,
      ),
      headline5: TextStyle(
        color: Colors.pink,
        fontFamily: FontType.Fira.name,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      headline6: TextStyle(
        color: Colors.pink,
        fontFamily: FontType.Fira.name,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      bodyText1: TextStyle(
        color: Colors.grey[600],
        fontFamily: FontType.Signika.name,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
      bodyText2: TextStyle(
        color: Colors.pink,
        fontFamily: FontType.Signika.name,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
    ),
  );
}
