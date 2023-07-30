import 'package:path_provider/path_provider.dart';

Future<String> getAppDir() async {
  final dir = await getApplicationDocumentsDirectory();
  return dir.path;
}
