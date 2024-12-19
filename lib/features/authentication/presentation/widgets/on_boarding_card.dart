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
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(
            height: 7 / AdoptiveBreakPoint.dpr,
          ),
          Text(
            paragraph,
            style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(color: Theme.of(context).colorScheme.onTertiaryFixedVariant),
          ),
          SizedBox(
            width: 524 / AdoptiveBreakPoint.dpr,
            height: 415 / AdoptiveBreakPoint.dpr,
            child: imagePath.contains('svg')?SvgPicture.asset(imagePath):Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
