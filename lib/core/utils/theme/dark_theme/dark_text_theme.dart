import 'package:flutter/material.dart';

import '../../app_constants/configrations/adoptive_break_point.dart';
import '../../app_constants/fonts/app_fonts.dart';
import 'dark_color_scheme.dart';

class DarkTextTheme {

  static TextTheme darkTextTheme=
  const  TextTheme(

    displayLarge: TextStyle(
      fontFamily: AppFonts.nuberNextBold,
      color: darkTextThemeHeadingColor,
      fontSize: 80/AdoptiveBreakPoint.dpr,
    ),
    displayMedium: TextStyle(
      fontFamily: AppFonts.nuberNextBold,
      color: darkTextThemeHeadingColor,
      fontSize: 51/AdoptiveBreakPoint.dpr,
    ),
    displaySmall: TextStyle(
      fontFamily: AppFonts.nuberNextBold,
      color: darkTextThemeHeadingColor,
      fontSize: 45/AdoptiveBreakPoint.dpr,
    ),
    headlineLarge: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeHeadingColor,
      fontSize: 51/AdoptiveBreakPoint.dpr,
    ),
    headlineMedium: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeHeadingColor,
      fontSize: 30/AdoptiveBreakPoint.dpr,
    ),
    headlineSmall: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeHeadingColor,
      fontSize: 28/AdoptiveBreakPoint.dpr,
    ),
    titleLarge: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeHeadingColor,
      fontSize: 28/AdoptiveBreakPoint.dpr,
    ),
    titleMedium: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeHeadingColor,
      fontSize: 23/AdoptiveBreakPoint.dpr,
    ),
    titleSmall: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeHeadingColor,
      fontSize: 20/AdoptiveBreakPoint.dpr,
    ),
    labelLarge: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeTextColor,
      fontSize: 31/AdoptiveBreakPoint.dpr,
    ),
    labelMedium: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeTextColor,
      fontSize: 26/AdoptiveBreakPoint.dpr,
    ),
    labelSmall: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeTextColor,
      fontSize: 17/AdoptiveBreakPoint.dpr,
    ),
    bodyLarge: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeTextColor,
      fontSize: 18/AdoptiveBreakPoint.dpr,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeTextColor,
      fontSize: 14/AdoptiveBreakPoint.dpr,
    ),
    bodySmall: TextStyle(
      fontFamily: AppFonts.nuberNextRegular,
      color: darkTextThemeTextColor,
      fontSize: 12/AdoptiveBreakPoint.dpr,
    ),

  );

}