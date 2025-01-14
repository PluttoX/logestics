import 'package:flutter/material.dart';

import '../../app_constants/fonts/app_fonts.dart';
import 'dark_color_scheme.dart';

class DarkTextTheme {

 static  TextTheme darkTextTheme(double densityPixelRation)=>
    TextTheme(

    displayLarge: TextStyle(
      fontFamily: AppFonts.nuberNextBold,
      color: darkTextThemeHeadingColor,
      fontSize: 80/densityPixelRation,
    ),
    displayMedium: TextStyle(
      fontFamily: AppFonts.nuberNextBold,
      color: darkTextThemeHeadingColor,
      fontSize: 51/densityPixelRation,
    ),
    displaySmall: TextStyle(
      fontFamily: AppFonts.nuberNextBold,
      color: darkTextThemeHeadingColor,
      fontSize: 45/densityPixelRation,
    ),
    headlineLarge: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeHeadingColor,
      fontSize: 51/densityPixelRation,
    ),
    headlineMedium: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeHeadingColor,
      fontSize: 30/densityPixelRation,
    ),
    headlineSmall: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeHeadingColor,
      fontSize: 28/densityPixelRation,
    ),
    titleLarge: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeHeadingColor,
      fontSize: 28/densityPixelRation,
    ),
    titleMedium: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeHeadingColor,
      fontSize: 23/densityPixelRation,
    ),
    titleSmall: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeHeadingColor,
      fontSize: 20/densityPixelRation,
    ),
    labelLarge: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeTextColor,
      fontSize: 31/densityPixelRation,
    ),
    labelMedium: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeTextColor,
      fontSize: 26/densityPixelRation,
    ),
    labelSmall: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeTextColor,
      fontSize: 17/densityPixelRation,
    ),
    bodyLarge: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeTextColor,
      fontSize: 18/densityPixelRation,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeTextColor,
      fontSize: 14/densityPixelRation,
    ),
    bodySmall: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeTextColor,
      fontSize: 12/densityPixelRation,
    ),

  );

}