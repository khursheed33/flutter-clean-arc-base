import 'package:flutter/services.dart';

class InputFormatter {
  static List<TextInputFormatter> textAndNumberOnly() {
    return [FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]"))];
  }

  static List<TextInputFormatter> numbersOnly() {
    return [FilteringTextInputFormatter.allow(RegExp("[0-9]"))];
  }

  static List<TextInputFormatter> textOnly() {
    return [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))];
  }
}
