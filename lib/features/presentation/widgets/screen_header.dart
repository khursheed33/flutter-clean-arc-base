import 'package:flutter_clean_arc_base/index.dart';

class AppScreenHeader extends StatelessWidget {
  final IconData icon;
  final double? paddingTop;
  const AppScreenHeader({
    super.key,
    this.paddingTop,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop ?? 0.0),
      child: Icon(
        icon,
        size: 100,
        color: Theme.of(context).primaryColorDark,
      ),
    );
  }
}
