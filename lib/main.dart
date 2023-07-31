import 'dart:async';
import 'package:flutter/material.dart';
import 'core/utils/error_logger.dart';
import 'features/di/di_container.dart';
import 'features/presentation/home/app_foundation.dart';

/// The main function initializes dependencies, starts the app, and logs any errors that occur.
Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Dependency Injection
    await initializeDependencies();
    // Start App
    runApp(const AppFoundation());
  }, (error, stackTrace) {
    // Log error
    logError(error, stackTrace);
  });
}
