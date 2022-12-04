import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_base/core/widgets/custom_loader.dart';

class MMNextButtonCircle extends StatelessWidget {
  final Color? backgroundColor;
  final Color? iconColor;
  final Function()? onPressed;
  final bool isBusy;
  const MMNextButtonCircle({
    Key? key,
    this.backgroundColor,
    this.iconColor,
    this.isBusy = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0.0,
      onPressed: isBusy ? null : onPressed,
      child: isBusy
          ? MMCircularProgress(
              color: Theme.of(context).canvasColor,
            )
          : Icon(
              Icons.arrow_forward,
              color: Theme.of(context).canvasColor,
            ),
    );
  }
}
