import 'package:flutter/material.dart';

class AppDateTimePicker extends StatelessWidget {
  final Function(DateTime dateTime)? pickedDateHandler;
  final Color? iconColor;
  final double? iconSize;
  final DateTime? endDate;
  final DateTime? firstDate;
  final DateTime? initialDate;

  const AppDateTimePicker({
    Key? key,
    required this.pickedDateHandler,
    this.initialDate,
    this.firstDate,
    this.iconColor,
    this.iconSize,
    this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: initialDate ?? DateTime.now(),
          firstDate: firstDate ?? DateTime.utc(1900),
          lastDate: endDate ?? DateTime.now(),
        );

        if (selectedDate != null && selectedDate != DateTime.now()) {
          pickedDateHandler!(selectedDate);
        }
      },
      icon: Icon(
        Icons.date_range,
        color: iconColor ?? Theme.of(context).primaryColor,
        size: iconSize,
      ),
    );
  }
}
