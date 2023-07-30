import 'dart:io';

import '../extensions/message_log.dart';
import 'app_directory.dart';

Future<void> logError(dynamic error, StackTrace stackTrace) async {
  try {
    final errorMessage = 'Error: $error\nStack trace:\n$stackTrace';
    final String appDocDir = await getAppDir();
    "Dir:: $appDocDir".log();
    final logFile = File('$appDocDir/error.log');
    await logFile.writeAsString(errorMessage, mode: FileMode.append);
  } catch (err) {
    "Logger: $err".log();
  }
}
