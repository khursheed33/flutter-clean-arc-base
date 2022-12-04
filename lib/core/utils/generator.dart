import 'dart:math';

import 'package:flutter/cupertino.dart';

class Generate {
  static String subjectCode(String sub) {
    const String _prefix = "CE";
    String _subCode = _prefix;
    for (int i = 0; i < sub.length; i++) {
      _subCode += "$i${sub[i]}";
    }
    return _subCode;
  }

  static String uid() {
    const String pushChars =
        '-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz';
    int lastPushTime = 0;
    List lastRandChars = [];
    int now = DateTime.now().millisecondsSinceEpoch;
    bool duplicateTime = (now == lastPushTime);
    lastPushTime = now;
    List timeStampChars = List<String>.filled(8, '0');
    for (int i = 7; i >= 0; i--) {
      timeStampChars[i] = pushChars[now % 64];
      now = (now / 64).floor();
    }
    if (now != 0) {}
    String uniqueId = timeStampChars.join('');
    if (!duplicateTime) {
      for (int i = 0; i < 12; i++) {
        lastRandChars.add((Random().nextDouble() * 64).floor());
      }
    } else {
      int i = 0;
      for (int i = 11; i >= 0 && lastRandChars[i] == 63; i--) {
        lastRandChars[i] = 0;
      }
      lastRandChars[i]++;
    }
    for (int i = 0; i < 12; i++) {
      uniqueId += pushChars[lastRandChars[i]];
    }
    return uniqueId;
  }

  static String fullName(String first, String last) {
    return first + " " + last;
  }

  static String shortName(String name) {
    final _listOfWord = name.split(' ');
    String _result = '';
    for (String n in _listOfWord) {
      _result += n[0].toUpperCase();
    }
    return _result;
  }

  static Color color({double? opacity}) {
    return Color((Random().nextDouble() * 0xFFFFFFFF).toInt())
        .withOpacity(opacity ?? 1);
  }
}