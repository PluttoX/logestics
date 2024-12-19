import 'package:flutter/material.dart';
import 'dark_theme/dark_theme.dart';
import 'light_theme/light_theme.dart';
class AppTheme{
  static  ThemeData lightTheme()=>LightTheme.lightTheme();
  static  ThemeData darkTheme()=>DarkTheme.darkTheme();
}