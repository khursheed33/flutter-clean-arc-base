import 'package:flutter_clean_arc_base/index.dart';


class AppTitleWithBG extends StatelessWidget {
  final Color? bgColor;
  final String title;
  final double? fontSize;
  final AlignmentGeometry? textAlign;
  const AppTitleWithBG({
    super.key,
    this.bgColor,
    this.fontSize,
    this.textAlign,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      alignment: textAlign ?? Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: bgColor ?? Theme.of(context).dividerColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: AppTitle(title),
    );
  }
}
