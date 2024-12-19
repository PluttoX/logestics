import 'package:flutter/material.dart';

import '../../app_constants/configrations/adoptive_break_point.dart';
import '../../app_constants/fonts/app_fonts.dart';
import 'light_color_scheme.dart';

class LightTextTheme {

 static TextTheme lightTextTheme=
    const  TextTheme(
      displayLarge: TextStyle(
        fontFamily: AppFonts.nuberNextBold,
        color: lightTextThemeHeadingColor,
        fontSize: 80/AdoptiveBreakPoint.dpr,
      ),
      displayMedium: TextStyle(
        fontFamily: AppFonts.nuberNextBold,
        color: lightTextThemeHeadingColor,
        fontSize: 51/AdoptiveBreakPoint.dpr,
      ),
       displaySmall: TextStyle(
         fontFamily: AppFonts.nuberNextBold,
         color: lightTextThemeHeadingColor,
         fontSize: 45/AdoptiveBreakPoint.dpr,
       ),
       headlineLarge: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeHeadingColor,
         fontSize: 51/AdoptiveBreakPoint.dpr,
       ),
       headlineMedium: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeHeadingColor,
         fontSize: 30/AdoptiveBreakPoint.dpr,
       ),
       headlineSmall: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeHeadingColor,
         fontSize: 28/AdoptiveBreakPoint.dpr,
       ),
       titleLarge: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeHeadingColor,
         fontSize: 28/AdoptiveBreakPoint.dpr,
       ),
       titleMedium: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeHeadingColor,
         fontSize: 23/AdoptiveBreakPoint.dpr,
       ),
       titleSmall: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeHeadingColor,
         fontSize: 20/AdoptiveBreakPoint.dpr,
       ),
       labelLarge: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeTextColor,
         fontSize: 31/AdoptiveBreakPoint.dpr,
       ),
       labelMedium: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeTextColor,
         fontSize: 26/AdoptiveBreakPoint.dpr,
       ),
       labelSmall: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeTextColor,
         fontSize: 17/AdoptiveBreakPoint.dpr,
       ),
       bodyLarge: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeTextColor,
         fontSize: 18/AdoptiveBreakPoint.dpr,
       ),
       bodyMedium: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeTextColor,
         fontSize: 14/AdoptiveBreakPoint.dpr,
       ),
       bodySmall: TextStyle(
        fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeTextColor,
        fontSize: 12/AdoptiveBreakPoint.dpr,
      ),

    );

}