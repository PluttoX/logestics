import 'package:flutter/material.dart';
import '../../../../../core/utils/app_constants/configrations/adoptive_break_point.dart';
import '../../widgets/forget_password_image_widget.dart';
import 'components/forget_password_component.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var dpr=MediaQuery.of(context).devicePixelRatio;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(padding: EdgeInsets.symmetric(vertical: 132/dpr,
            horizontal: 180/dpr
            ),child:

                MediaQuery.sizeOf(context).width < AdoptiveBreakPoint.medium
                ? Column(

              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ForgetPasswordImageWidget(),
                ForgetPasswordComponent(),
              ],
            )
                : Row(

              children: [
                ForgetPasswordComponent(),
                ForgetPasswordImageWidget(),
              ],
            ),)
          ),
        ),
      ),
    );
  }
}
