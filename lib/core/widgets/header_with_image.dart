import 'package:flutter_clean_arc_base/index.dart';

class AppHeaderWithImage extends StatelessWidget {
  final String? assetName;
  final double? height;
  final double? width;
  final BoxFit? boxFit;
  const AppHeaderWithImage({
    super.key,
    this.assetName,
    this.height,
    this.boxFit,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? MediaQuery.of(context).size.height * 0.4,
      width: width ?? MediaQuery.of(context).size.width,
      child: SvgPicture.asset(
        assetName ?? AppGraphics.demo,
        fit: boxFit ?? BoxFit.cover,
      ),
    );
  }
}
