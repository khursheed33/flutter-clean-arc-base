import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_graphics.dart';

class AppHeaderWithImage extends StatelessWidget {
  final String? assetName;
  final double? height;
  final double? width;
  final BoxFit? boxFit;
  const AppHeaderWithImage({
    Key? key,
    this.assetName,
    this.height,
    this.boxFit,
    this.width,
  }) : super(key: key);

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
