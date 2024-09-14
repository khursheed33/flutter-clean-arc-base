import 'package:flutter_clean_arc_base/index.dart';

void popOutLoader(BuildContext context) {
  Future.delayed(
    const Duration(milliseconds: 5),
    () {
      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }
    },
  );
}
