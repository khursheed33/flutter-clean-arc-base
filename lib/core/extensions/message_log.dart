import 'dart:developer' as devtool show log;

extension Log on Object {
  void log() => devtool.log(toString());
}
