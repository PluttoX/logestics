import 'package:flutter/material.dart';

import '../../app_constants/configrations/adoptive_break_point.dart';
import '../../app_constants/fonts/app_fonts.dart';
import 'light_color_scheme.dart';

class LightTextTheme {

static TextTheme lightTextTheme(double densityPixelRation)=>
  TextTheme(
      displayLarge: TextStyle(
        fontFamily: AppFonts.nuberNextBold,
        color: lightTextThemeHeadingColor,
        fontSize: 80/densityPixelRation,
      ),
      displayMedium: TextStyle(
        fontFamily: AppFonts.nuberNextBold,
        color: lightTextThemeHeadingColor,
        fontSize: 51/densityPixelRation,
      ),
       displaySmall: TextStyle(
         fontFamily: AppFonts.nuberNextBold,
         color: lightTextThemeHeadingColor,
         fontSize: 45/densityPixelRation,
       ),
       headlineLarge: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeHeadingColor,
         fontSize: 51/densityPixelRation,
       ),
       headlineMedium: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeHeadingColor,
         fontSize: 30/densityPixelRation,
       ),
       headlineSmall: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeHeadingColor,
         fontSize: 28/densityPixelRation,
       ),
       titleLarge: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeHeadingColor,
         fontSize: 28/densityPixelRation,
       ),
       titleMedium: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeHeadingColor,
         fontSize: 23/densityPixelRation,
       ),
       titleSmall: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeHeadingColor,
         fontSize: 20/densityPixelRation,
       ),
       labelLarge: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeTextColor,
         fontSize: 31/densityPixelRation,
       ),
       labelMedium: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeTextColor,
         fontSize: 26/densityPixelRation,
       ),
       labelSmall: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeTextColor,
         fontSize: 17/densityPixelRation,
       ),
       bodyLarge: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeTextColor,
         fontSize: 18/densityPixelRation,
       ),
       bodyMedium: TextStyle(
         fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeTextColor,
         fontSize: 14/densityPixelRation,
       ),
       bodySmall: TextStyle(
        fontFamily: AppFonts.nuberNextRegular,
         color: lightTextThemeTextColor,
        fontSize: 12/densityPixelRation,
      ),

    );

}