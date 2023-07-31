import 'package:flutter/services.dart';

/// The `InputFormatter` class provides static methods to create lists of `TextInputFormatter` objects
/// for filtering input to allow text and numbers, numbers only, or text only.

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
