import 'package:flutter/material.dart';

Future<void> popOutLoader(BuildContext context) async {
  return await Future.delayed(
    const Duration(milliseconds: 5),
    () {
      Navigator.of(context).pop();
    },
  );
}
