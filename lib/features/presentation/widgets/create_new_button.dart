import 'package:flutter_clean_arc_base/index.dart';


class AppCreateNewButton extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? iconSize;

  const AppCreateNewButton({
    super.key,
    required this.onPressed,
    this.title,
    this.icon,
    this.textColor,
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      minWidth: 60,
      color: backgroundColor ?? Theme.of(context).primaryColor,
      textColor: textColor ?? Theme.of(context).canvasColor,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon ?? FontAwesomeIcons.circlePlus,
            size: iconSize ?? 20,
          ),
          const SizedBox(width: 5),
          AppTitle(
            title ?? "New",
            color: Theme.of(context).canvasColor,
            textAlign: TextAlign.center,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ],
      ),
    );
  }
}
