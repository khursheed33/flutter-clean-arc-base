import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final Color? color;
  final EdgeInsetsGeometry? margin;
  const AppBackButton({
    Key? key,
    this.color,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: margin ?? const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
          radius: 100,
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: color ?? Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
