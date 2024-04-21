import 'package:path_provider/path_provider.dart';

/// The function `getAppDir` returns the path of the application's documents directory as a `Future` of
/// type `String`.
///
/// Returns:
///   a `Future<String>`, which means it will eventually return a `String` value.
Future<String> getSupportDir() async {
  final dir = await getApplicationSupportDirectory();
  return dir.path;
}
