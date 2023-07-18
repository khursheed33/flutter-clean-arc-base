import 'package:flutter/material.dart';

import 'features/di/di_container.dart';
import 'features/views/home/app_foundation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Dependency Injection
  await initializeDependencies();
  // Start App
  runApp(const AppFoundation());
}
