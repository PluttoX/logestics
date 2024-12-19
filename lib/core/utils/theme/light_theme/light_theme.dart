import 'package:flutter/material.dart';
import 'package:logestics/core/utils/theme/light_theme/light_color_scheme.dart';
import 'package:logestics/core/utils/theme/light_theme/light_filled_button_theme.dart';
import '../../../../../../core/utils/app_constants/configrations/adoptive_break_point.dart';

import '../../app_constants/colors/app_colors.dart';
import 'light_text_theme.dart';

class LightTheme {
  static ThemeData lightTheme() => ThemeData.light(useMaterial3: true).copyWith(
      textTheme: LightTextTheme.lightTextTheme,
      colorScheme: LightColorScheme.lightColorScheme,
      scaffoldBackgroundColor: LightColorScheme.lightColorScheme.surface,
      filledButtonTheme: LightFilledButtonTheme.lightFilledButtonTheme,
      //primaryColor:  AppColors.lightPrimary,
      );
}
