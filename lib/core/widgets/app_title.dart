import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_base/core/enums/font_type.dart';

class MMTitle extends StatelessWidget {
  final String title;
  final Color? color;
  final int? maxLines;
  final double? fontSize;
  final String? fontFamily;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  const MMTitle(
    this.title, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.fontFamily,
    this.fontWeight,
    this.letterSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: fontFamily ?? FontType.Sarabun.name,
        color: color ?? Theme.of(context).disabledColor.withOpacity(0.6),
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 20,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
