import 'package:flutter_clean_arc_base/index.dart';

class MMTimePicker extends StatelessWidget {
  final Function(TimeOfDay?)? timeHandler;
  final TimeOfDay initialTime;
  final Color? color;
  const MMTimePicker({
    super.key,
    required this.timeHandler,
    required this.initialTime,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final TimeOfDay? newTime = await showTimePicker(
          context: context,
          initialTime: initialTime,
        );
        if (newTime != null) {
          timeHandler!(newTime);
        }
      },
      child: Icon(
        Icons.schedule,
        color: color ?? Theme.of(context).primaryColorDark,
      ),
    );
  }
}
