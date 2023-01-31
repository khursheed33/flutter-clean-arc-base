import 'package:flutter/material.dart';

class ResourceNotFound extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? textColor;
  final double iconSize;
  const ResourceNotFound(
      {Key? key,
      required this.title,
      this.icon,
      this.iconSize = 30,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(
              icon ?? Icons.info,
              size: iconSize,
              color: Theme.of(context).colorScheme.error.withOpacity(0.7),
            ),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor ??
                  Theme.of(context).colorScheme.error.withOpacity(1),
            ),
          ),
        ],
      ),
    );
  }
}
