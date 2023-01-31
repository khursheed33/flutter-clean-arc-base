import 'package:flutter/material.dart';

class AppCircularProgress extends StatelessWidget {
  final double? size;
  final Color? color;
  final bool needElevation;
  const AppCircularProgress({
    Key? key,
    this.size,
    this.color,
    this.needElevation = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      constraints: BoxConstraints(maxHeight: size ?? 50, maxWidth: size ?? 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: needElevation ? Theme.of(context).canvasColor : null,
        boxShadow: needElevation
            ? [
                BoxShadow(
                  color: Theme.of(context).disabledColor,
                  offset: const Offset(2, 2),
                  blurRadius: 3,
                )
              ]
            : null,
      ),
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
