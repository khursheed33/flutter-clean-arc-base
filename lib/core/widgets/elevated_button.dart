import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final Color? color;
  final String title;
  final double? radius;
  final IconData? icon;
  final bool? iconRight;
  final bool isProgress;
  final bool darkBorder;
  final double? iconSize;
  final Color? textColor;
  final double elevation;
  final double? fontSize;
  final bool lightBorder;
  final Color? borderColor;
  final FontWeight? fontWeight;
  final Function() onPressHandler;
  const AppElevatedButton({
    Key? key,
    this.icon,
    this.color,
    this.radius,
    this.fontSize,
    this.iconSize,
    this.textColor,
    this.fontWeight,
    this.borderColor,
    required this.title,
    this.elevation = 0.0,
    this.iconRight = false,
    this.darkBorder = false,
    this.isProgress = false,
    this.lightBorder = false,
    required this.onPressHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () {
          if (isProgress) return;
          onPressHandler();
        },
        elevation: elevation,
        color: isProgress
            ? Theme.of(context).disabledColor
            : color ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          side: (darkBorder || lightBorder)
              ? BorderSide(
                  width: 2,
                  color: darkBorder
                      ? borderColor ?? Theme.of(context).disabledColor
                      : Theme.of(context).canvasColor.withOpacity(0.8),
                )
              : BorderSide.none,
          borderRadius: BorderRadius.circular(
            radius ?? 6,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null && !isProgress && iconRight == false)
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(
                  icon,
                  color: textColor ?? Theme.of(context).canvasColor,
                  size: iconSize ?? (fontSize != null ? fontSize! + 5.0 : 20),
                ),
              ),
            if (isProgress)
              Container(
                height: 30,
                width: 50,
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                child: Center(
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).canvasColor,
                    ),
                  ),
                ),
              ),
            Text(
              title,
              style: TextStyle(
                fontWeight: fontWeight,
                fontSize: fontSize ?? 18,
                color: textColor ?? Theme.of(context).canvasColor,
              ),
            ),
            if (icon != null && !isProgress && iconRight == true)
              const SizedBox(width: 10),
            if (icon != null && !isProgress && iconRight == true)
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(
                  icon,
                  color: textColor ?? Theme.of(context).canvasColor,
                  size: iconSize ?? (fontSize != null ? fontSize! + 5.0 : 20),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
