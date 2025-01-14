import 'package:flutter/material.dart';
import 'package:logestics/core/utils/app_constants/app_assets/app_assets.dart';
import 'package:logestics/core/utils/app_constants/icons/app_icons_data_expended.dart';
import 'package:logestics/core/utils/app_constants/texts/app__authentication_texts_expended.dart';
import '../../../widgets/on_boarding_card.dart';

class OnBoardingComponent extends StatelessWidget {
  const OnBoardingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var dpr = MediaQuery.of(context).devicePixelRatio;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  //Todo 1 Navigation back in splash
                },
                child: Icon(
                  AppIconsDataExpended.navigationBackIcon,
                  size: screenHeight *
                      0.006 *
                      screenHeight *
                      0.006 /*AppSizesExpended.navigationIconSize*/,
                ),
              ),
              // SizedBox(
              //   width: screenWidth * .17,
              // ),
              TextButton(
                onPressed: () {
                  //Todo 2 Navigation forward splash
                },
                child: Row(
                  children: [
                    Text(
                      AppAuthenticationTextsExpended.next,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: screenHeight * 0.004 * screenWidth * 0.004),
                    ),
                    Icon(AppIconsDataExpended.navigationForwardIcon,
                        size: screenHeight * 0.006 * screenHeight * 0.006),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: screenHeight * .02,
          ),
          OnBoardingCard(
            title: AppAuthenticationTextsExpended.automateBusiness,
            paragraph: AppAuthenticationTextsExpended.text,
            imagePath: AppAssets.onBoardingPng1,
          ),
          SizedBox(
            height: screenHeight * .03,
          ),
          SizedBox(
            width: screenWidth * .2,
            child: Slider(
              value: 0.5,
              onChanged: (value) {
                //Todo 3 using introduction screen package to add onboarding functionalaty
              },
              divisions: 4,
            ),
          ),
          SizedBox(
            height: screenHeight * .02,
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  AppAuthenticationTextsExpended.companySigne,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: screenHeight * 0.006 * screenHeight * 0.006),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
