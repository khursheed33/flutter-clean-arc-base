import 'package:flutter/material.dart';

import 'app_title.dart';

class MMContentTitleWitDivider extends StatelessWidget {
  final String title;
  final double? leftPadding;
  const MMContentTitleWitDivider({
    Key? key,
    required this.title,
    this.leftPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: leftPadding ?? 10),
        Flexible(
          child: AppTitle(
            title,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 8),
        const Flexible(
          child: Divider(),
        ),
      ],
    );
  }
}
