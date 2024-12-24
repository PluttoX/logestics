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
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
   var dpr= MediaQuery.of(context).devicePixelRatio;
    return SafeArea(
        child: Scaffold(
      body: Padding(
            padding:EdgeInsets.symmetric(horizontal: screenWidth * 0.10),
            child:  Row(
                    children: [
                   Expanded(child: OnBoardingComponent()),
                       SizedBox(
                        width: screenWidth * 0.2,
                       ),
                      Expanded(child: LoginComponent()),

                    ],
                  ),
          ),
        ),
     );
  }
}
