import 'package:flutter/material.dart';

ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>
    showBanner(
  BuildContext context, {
  Color? bgColor,
  Widget? leading,
  required String msg,
  List<Widget>? actions,
  bool autoDismiss = false,
  bool forceToBelow = false,
  Duration? dismissDuration,
}) {
  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
  return ScaffoldMessenger.of(context).showMaterialBanner(
    MaterialBanner(
      leading: leading,
      forceActionsBelow: forceToBelow,
      backgroundColor: bgColor,
      content: Text(msg),
      onVisible: () {
        if (autoDismiss) {
          Future.delayed(dismissDuration ?? const Duration(seconds: 1), () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          });
        }
      },
      actions: actions ??
          [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
              child: const Text("Dismiss"),
            ),
          ],
    ),
  );
}
