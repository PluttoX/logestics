import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logestics/core/utils/app_constants/app_assets/app_assets.dart';
import 'package:logestics/core/utils/app_constants/icons/app_icons_data_expended.dart';
import 'package:logestics/core/utils/app_constants/sizes/app_sizes_expended.dart';
import 'package:logestics/core/utils/app_constants/texts/app__authentication_texts_expended.dart';
import '../../../../../../core/utils/app_constants/configrations/adoptive_break_point.dart';
import '../../../widgets/on_boarding_card.dart';
class OnBoardingComponent extends StatelessWidget {
  const OnBoardingComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 524 / AdoptiveBreakPoint.dpr,
     // height: MediaQuery.sizeOf(context).height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50 / AdoptiveBreakPoint.dpr,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  //Todo 1 Navigation back in splash
                },
                child: Icon(
                  AppIconsDataExpended.navigationBackIcon,
                  size: AppSizesExpended.navigationIconSize,
                ),
              ),
              const SizedBox(
                width: 360 / AdoptiveBreakPoint.dpr,
              ),
              TextButton(
                onPressed: () {
                  //Todo 2 Navigation forward splash
                },
                child: Row(
                  children: [
                    Text(
                      AppAuthenticationTextsExpended.next,
                      style: Theme.of(context).textTheme.labelSmall
                          ?.copyWith(color: Theme.of(context).colorScheme.primary),
                    ),
                    Icon(AppIconsDataExpended.navigationForwardIcon,
                        size: AppSizesExpended.navigationIconSize),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40 / AdoptiveBreakPoint.dpr,
          ),
          OnBoardingCard(
            title: AppAuthenticationTextsExpended.automateBusiness,
            paragraph: AppAuthenticationTextsExpended.text,
            imagePath: AppAssets.onBoardingPng1,
          ),
          SizedBox(height: 31/AdoptiveBreakPoint.dpr,),
          SizedBox(
            width: 300/AdoptiveBreakPoint.dpr,
            child: Slider(value: 0.5, onChanged: (value){
              //Todo 3 using introduction screen package to add onboarding functionalaty
            },
              divisions: 4,



            ),
          ),
          SizedBox(
            height: 20/AdoptiveBreakPoint.dpr,
          ),
          Row(
            children: [
              Text('@2025 PluttoX Software House',style: Theme.of(context).textTheme.headlineSmall,),
            ],
          )
        ],
      ),
    );
  }
}

