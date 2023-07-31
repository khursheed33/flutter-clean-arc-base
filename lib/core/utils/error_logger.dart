import 'dart:io';

import '../extensions/message_log.dart';
import 'app_directory.dart';

/// The function logs an error message and stack trace to a file.
///
/// Args:
///   error (dynamic): The `error` parameter is a dynamic type, which means it can accept any type of
/// value. It is used to pass the error message or object that needs to be logged.
///   stackTrace (StackTrace): The `stackTrace` parameter is an object that represents the current stack
/// trace at the point where the error occurred. It provides information about the sequence of function
/// calls that led to the error.
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
