import 'package:flutter_clean_arc_base/index.dart';


class AppNextButtonCircle extends StatelessWidget {
  final Color? backgroundColor;
  final Color? iconColor;
  final Function()? onPressed;
  final bool isBusy;
  const AppNextButtonCircle({
    super.key,
    this.backgroundColor,
    this.iconColor,
    this.isBusy = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0.0,
      onPressed: isBusy ? null : onPressed,
      child: isBusy
          ? AppCircularProgress(
              color: Theme.of(context).canvasColor,
            )
          : Icon(
              Icons.arrow_forward,
              color: Theme.of(context).canvasColor,
            ),
    );
  }
}
