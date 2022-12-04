import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'features/di/di_container.dart';

import 'features/home/app_foundation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase Initialization
  await Firebase.initializeApp();
  // Dependency Injection
  await initializeDependencies();
  // Start App
  runApp(const MMAppFoundation());
}
