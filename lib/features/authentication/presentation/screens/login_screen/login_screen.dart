import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logestics/core/shared_features/theme_management/presentation/controllers/theme_controller.dart';

import '../../../../../core/utils/app_constants/configrations/adoptive_break_point.dart';
import 'components/login_component.dart';
import 'components/on_boarding_component.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
   var dpr= MediaQuery.of(context).devicePixelRatio;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding:EdgeInsets.only(left: 221/MediaQuery.of(context).devicePixelRatio,top: 10/2*dpr),
            child: MediaQuery.sizeOf(context).width < AdoptiveBreakPoint.medium
                ? Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OnBoardingComponent(),
                      LoginComponent(),
                    ],
                  )
                : Row(

                    children: [
                   OnBoardingComponent(),

                     LoginComponent(),

                    ],
                  ),
          ),
        ),
      ),
    ));
  }
}
