import 'dart:developer' as devtool show log;

/// The code snippet is defining an extension named `Log` on the `Object` class. This extension adds a
/// new method called `log()` to all objects in Dart.

extension Log on Object {
  void log() => devtool.log(toString());
}
