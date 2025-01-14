import 'package:flutter/material.dart';
import 'package:logestics/core/utils/theme/light_theme/light_color_scheme.dart';
import 'package:logestics/core/utils/theme/light_theme/light_filled_button_theme.dart';

import 'light_text_theme.dart';

class LightTheme {

static  ThemeData lightTheme(double densityPixelRation) => ThemeData.light(useMaterial3: true).copyWith(
      textTheme: LightTextTheme.lightTextTheme(densityPixelRation),
      colorScheme: LightColorScheme.lightColorScheme,
      scaffoldBackgroundColor: LightColorScheme.lightColorScheme.surface,
      filledButtonTheme: LightFilledButtonTheme.lightFilledButtonTheme,
      //primaryColor:  AppColors.lightPrimary,
      );
}
