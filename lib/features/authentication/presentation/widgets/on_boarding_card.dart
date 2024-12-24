import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/utils/app_constants/configrations/adoptive_break_point.dart';
class OnBoardingCard extends StatelessWidget {
  const OnBoardingCard(
      {super.key,
        required this.title,
        required this.paragraph,
        required this.imagePath});

  final String title;
  final String paragraph;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    var dpr=MediaQuery.of(context).devicePixelRatio;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: screenHeight*0.007*screenHeight*0.007 ),
        ),
         SizedBox(
          height: screenHeight*0.006,
        ),
        Text(
          paragraph,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: screenHeight*0.005*screenHeight*0.005)
              .copyWith(color: Theme.of(context).colorScheme.onTertiaryFixedVariant),
        ),
        SizedBox(
          width: screenHeight*0.7,
          height: screenHeight*0.45,
          child: imagePath.contains('svg')?SvgPicture.asset(imagePath):Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}
