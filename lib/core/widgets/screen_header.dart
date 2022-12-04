import 'package:flutter/material.dart';

class MMScreenHeader extends StatelessWidget {
  final IconData icon;
  final double? paddingTop;
  const MMScreenHeader({
    Key? key,
    this.paddingTop,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop ?? 0.0),
      child: Icon(
        icon,
        size: 100,
        color: Theme.of(context).primaryColorDark,
      ),
    );
  }
}
