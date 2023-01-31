import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

PreferredSizeWidget customAppBar(
  BuildContext context, {
  final String? title,
  final bool? isCenter,
  final Color? iconColor,
  final Color? textColor,
  final List<Widget>? actions,
}) {
  return AppBar(
    elevation: 0.0,
    title: Text(title ?? ""),
    centerTitle: isCenter,
    actions: actions,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        FontAwesomeIcons.arrowLeft,
        size: 18,
      ),
    ),
    backgroundColor: Theme.of(context).canvasColor,
    iconTheme: IconThemeData(
      color: Theme.of(context).disabledColor,
    ),
  );
}
