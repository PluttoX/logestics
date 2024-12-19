import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logestics/core/utils/app_constants/app_assets/app_assets.dart';

class ForgetPasswordImageWidget extends StatelessWidget {
  const ForgetPasswordImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var dpr=MediaQuery.of(context).devicePixelRatio;
    return Padding(
        padding: const EdgeInsets.only(left: 255),
        child: SvgPicture.asset(
          AppAssets.forgetPasswordSvg1,
           height: 632/dpr,
          width: 590/dpr,
        ));
  }
}
