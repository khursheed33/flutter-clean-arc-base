import 'package:flutter_clean_arc_base/index.dart';
import 'package:intl/intl.dart';

class MMDateTimePicker extends StatelessWidget {
  final Function(DateTime dateTime)? pickedDateHandler;
  final Color? iconColor;
  final double? iconSize;
  final DateTime? endDate;
  final DateTime? firstDate;
  final DateTime? initialDate;
  final DateTime selectedDate;
  final double? titleSize;
  final String? label;
  final double? labelSize;
  final Color? titleColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? radius;
  final String? dateFormat;
  final Color? bgColor;

  const MMDateTimePicker({
    super.key,
    required this.pickedDateHandler,
    required this.selectedDate,
    this.initialDate,
    this.firstDate,
    this.iconColor,
    this.iconSize,
    this.endDate,
    this.titleSize,
    this.label,
    this.labelSize,
    this.titleColor,
    this.bgColor,
    this.padding,
    this.margin,
    this.radius,
    this.dateFormat,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (label != null)
          AppTitle(
            label!,
            fontSize: labelSize ?? 14,
          ),
        const SizedBox(height: 5),
        InkWell(
          onTap: () async {
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
          child: AppContainerWithBG(
            padding: padding ?? const EdgeInsets.all(5.0),
            radius: radius ?? 6,
            margin: margin,
            color: bgColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTitle(
                  DateFormat(dateFormat ?? Constants.dateFormat)
                      .format(selectedDate),
                  fontSize: titleSize ?? 16,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
                const SizedBox(width: 5),
                Icon(
                  Icons.date_range,
                  size: iconSize ?? 30,
                  color: iconColor ?? Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
