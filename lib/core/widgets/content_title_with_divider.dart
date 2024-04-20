import 'package:flutter_clean_arc_base/index.dart';


class MMContentTitleWitDivider extends StatelessWidget {
  final String title;
  final double? leftPadding;
  const MMContentTitleWitDivider({
    super.key,
    required this.title,
    this.leftPadding,
  });

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
