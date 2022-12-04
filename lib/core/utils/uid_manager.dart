// ignore_for_file: non_constant_identifier_names

class UIDManager {
  /// Get Alphabet from Number
  static String numberToAlpha(int num) {
    // 3222
    final String nums = num.toString();
    String _result = '';
    for (int index = 0; index < nums.length; index++) {
      _result += _ALPHABETS[int.parse(nums[index])];
    }
    return _result;
  }

  /// Get Number from Alphabet
  static int alphaToNumber(String alpha) {
    // DCCC
    String _result = '';

    for (int index = 0; index < alpha.length; index++) {
      _result +=
          _ALPHABETS.indexWhere((char) => char == alpha[index]).toString();
    }

    return int.parse(_result);
  }

  /// UID Separator
  static List<String> splitIt(String uid) {
    return uid.split("#");
  }

  static final List<String> _ALPHABETS = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
}
