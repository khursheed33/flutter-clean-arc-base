import 'package:flutter/material.dart';

class AppTimePicker extends StatelessWidget {
  final Function(TimeOfDay?)? timeHandler;
  final TimeOfDay initialTime;
  final Color? color;
  const AppTimePicker({
    Key? key,
    required this.timeHandler,
    required this.initialTime,
    this.color,
  }) : super(key: key);

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
