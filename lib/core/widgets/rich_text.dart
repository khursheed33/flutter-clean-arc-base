import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  final String? label;
  final String value;
  final Color? labelColor;
  final Color? valueColor;
  final double? labelSize;
  final double? valueSize;
  final List<TextSpan>? postFixText;
  final FontWeight? labelFontWeight;
  final FontWeight? valueFontWeight;

  const AppRichText({
    Key? key,
    required this.value,
    this.label,
    this.labelColor,
    this.valueColor,
    this.labelSize,
    this.valueSize,
    this.postFixText,
    this.labelFontWeight,
    this.valueFontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          if (label != null)
            TextSpan(
              text: label,
              style: TextStyle(
                fontSize: labelSize ?? 14,
                fontWeight: labelFontWeight ?? FontWeight.normal,
                color: labelColor,
              ),
            ),
          if (label != null) const TextSpan(text: " "),
          TextSpan(
            text: value,
            style: TextStyle(
              fontSize: valueSize ?? 14,
              fontWeight: valueFontWeight ?? FontWeight.bold,
              color: valueColor,
            ),
          ),
          if (postFixText != null) ...postFixText!
        ],
      ),
    );
  }
}
