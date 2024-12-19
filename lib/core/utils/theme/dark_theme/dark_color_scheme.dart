import 'package:flutter/material.dart';

import '../../app_constants/colors/app_colors.dart';
const  darkTextThemeHeadingColor=AppColors.darkOnSurface;
const  darkTextThemeTextColor=AppColors.darkOnTertiaryFixedVariant;

class DarkColorScheme{
  static ColorScheme colorScheme=ColorScheme.fromSeed(seedColor: AppColors.darkPrimary).copyWith(
    brightness: Brightness.dark,

    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkOnPrimary,

    secondary: AppColors.darkSecondary,
    onSecondary: AppColors.darkOnSecondary,
    secondaryContainer: AppColors.darkSecondaryContainer,
    onSecondaryContainer:AppColors.darkOnSecondaryContainer,

    tertiary: AppColors.darkTertiary,
    onTertiary: AppColors.darkOnTertiary,
    onTertiaryFixedVariant: AppColors.darkOnTertiaryFixedVariant,

    surface: AppColors.darkSurface,
    onSurface: AppColors.darkOnSurface,
    onSurfaceVariant: AppColors.darkOnSurfaceVariant,

    error: AppColors.darkError,
    onError: AppColors.darkOnError,
    errorContainer: AppColors.darkErrorContainer,
    onErrorContainer: AppColors.darkOnErrorContainer,
         shadow: AppColors.darkShadow
  );}