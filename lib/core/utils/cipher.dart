// ignore_for_file: non_constant_identifier_names

import '../enums/cipher_type.dart';

class Cipher {
  static String caesarCipher({
    required String text,
    required CipherType cipherType,
  }) {
    int _cipherKey = text.length;
    String _result = "";

    for (int index = 0; index < text.length; index++) {
      int ch = text.codeUnitAt(index);
      int offset;
      String h;
      if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)) {
        offset = 97;
      } else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)) {
        offset = 65;
      } else if (ch == ' '.codeUnitAt(0)) {
        _result += " ";
        continue;
      } else {
        _result = "";
        break;
      }

      int char;
      if (cipherType == CipherType.Encrypt) {
        char = (ch + _cipherKey - offset) % 26;
      } else {
        char = (ch - _cipherKey - offset) % 26;
      }
      h = String.fromCharCode(char + offset);
      _result += h;
    }

    return _result;
  }
}
