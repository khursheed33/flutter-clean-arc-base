import 'dart:async';
import 'dart:isolate';

class BackgroundTask {
  static void start(Map<String, dynamic> args) async {
    final task = args['task'] as Function();
    final sendPort = args['port'] as SendPort;
    final result = await task();
    sendPort.send(result);
  }

  static Future<T> execute<T>(Future<T> Function() task) async {
    final receivePort = ReceivePort();
    await Isolate.spawn(start, {'task': task, 'port': receivePort.sendPort});
    return receivePort.first as FutureOr<T>;
  }
}

// void main() async {
//   final result = await BackgroundTask.execute<String>(() async {
//     final file = File('path_to_your_file');
//     final fileContents = await file.readAsString();

//     final response = await http.post(
//       Uri.parse('https://your-api-url.com'),
//       body: fileContents,
//     );

//     return response.body;
//   });

//   print('API response: $result');
// }
