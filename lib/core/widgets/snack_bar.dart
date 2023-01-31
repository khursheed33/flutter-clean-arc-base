import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  BuildContext context, {
  required String msg,
  Color? color,
  bool isError = true,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color != null && isError == false
          ? color
          : isError
              ? Theme.of(context).colorScheme.error
              : null,
      content: Text(msg),
    ),
  );
}
