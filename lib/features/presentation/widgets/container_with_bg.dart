import 'package:flutter_clean_arc_base/index.dart';

class AppContainerWithBG extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? width;
  final double? maxWidth;
  final double? radius;
  final double? maxHeight;
  final Color? borderColor;
  final double? borderWidth;
  final double? marginVertical;
  final double? marginHorizontal;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const AppContainerWithBG({
    super.key,
    required this.child,
    this.color,
    this.radius,
    this.width,
    this.margin,
    this.padding,
    this.boxShadow,
    this.borderColor,
    this.borderWidth,
    this.marginVertical,
    this.marginHorizontal,
    this.maxWidth,
    this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      padding: padding ?? const EdgeInsets.all(10),
      margin: margin,
      decoration: BoxDecoration(
        color:
            color ?? Theme.of(context).colorScheme.surface, // Updated property
        borderRadius: BorderRadius.circular(radius ?? 10),
        boxShadow: boxShadow,
        border: Border.all(
          width: borderWidth ?? 0.0,
          color: borderColor ??
              Theme.of(context).colorScheme.surface, // Updated property
        ),
      ),
      child: child,
    );
  }
}
