import 'package:flutter_clean_arc_base/index.dart';

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
}
