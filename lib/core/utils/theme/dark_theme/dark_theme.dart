import 'package:flutter/material.dart';
import 'package:logestics/core/utils/theme/dark_theme/dark_color_scheme.dart';
import 'package:logestics/core/utils/theme/dark_theme/dark_filled_button_theme.dart';
import '../../app_constants/colors/app_colors.dart';
import 'dark_text_theme.dart';

class DarkTheme {

static   ThemeData darkTheme(double densityPixelRation) => ThemeData.dark(useMaterial3: true).copyWith(

    textTheme: DarkTextTheme.darkTextTheme( densityPixelRation),
    colorScheme: DarkColorScheme.colorScheme,
    filledButtonTheme: DarkFilledButtonTheme.darkFilledButtonTheme

  );

}
