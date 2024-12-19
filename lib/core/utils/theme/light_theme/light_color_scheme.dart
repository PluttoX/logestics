import 'package:flutter/material.dart';

import '../../app_constants/colors/app_colors.dart';
 const  lightTextThemeHeadingColor=AppColors.lightOnSurface;
 const  lightTextThemeTextColor=AppColors.lightOnTertiaryFixedVariant;

class LightColorScheme{

  static ColorScheme lightColorScheme=ColorScheme.fromSeed(seedColor: AppColors.lightPrimary).copyWith(
    brightness: Brightness.light,

    primary: AppColors.lightPrimary,
    onPrimary: AppColors.lightOnPrimary,

    secondary: AppColors.lightSecondary,
    onSecondary: AppColors.lightOnSecondary,
    secondaryContainer: AppColors.lightSecondaryContainer,
    onSecondaryContainer:AppColors.lightOnSecondaryContainer,

    tertiary: AppColors.lightTertiary,
    onTertiary: AppColors.lightOnTertiary,
    onTertiaryFixedVariant: AppColors.lightOnTertiaryFixedVariant,

    surface: AppColors.lightSurface,
    onSurface: AppColors.lightOnSurface,
    onSurfaceVariant: AppColors.lightOnSurfaceVariant,

    error: AppColors.lightError,
    onError: AppColors.lightOnError,
    errorContainer: AppColors.lightErrorContainer,
    onErrorContainer: AppColors.lightOnErrorContainer,

      shadow: AppColors.lightShadow

  );

}