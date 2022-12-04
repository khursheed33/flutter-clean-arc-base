import 'dart:math';

import 'package:flutter/material.dart';

class Constants {
  static final randomColor =
      Color((Random().nextDouble() * 0xFFFFFFFF).toInt()).withOpacity(1);
  static List<BoxShadow> get boxShadow => [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 5,
          offset: const Offset(2, 2),
        )
      ];
  static const String dateFormat = "MM-dd-yyyy";
  static const LinearGradient linearGradient = LinearGradient(
    colors: [Colors.blueGrey, Colors.grey],
  );

  static const String uidSeparator = "#";
  static List<int> get semesters => [1, 2, 3, 4, 5, 6, 7, 8];

  static List<String> get weekDays =>
      ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];
  static List<String> get classes => ["FE", "SE", "TE", "BE"];
  static List<String> get divisions => ["A", "B", "C", "D", "E", "F", "G"];
  static List<String> get subjects => ["TCS", "ML", "COA", "DLDA"];
  static List<String> get batches => [
        "B1",
        "B2",
        "B3",
        "B4",
        "B5",
        "B6",
        "B7",
        "B8",
      ];
  static List<String> get teachers => [
        "Khursheed Chaudhary",
        "Sunny Gupta",
        "Aarif Chaudhary",
        "Jeet Uppadhya"
      ];
}
