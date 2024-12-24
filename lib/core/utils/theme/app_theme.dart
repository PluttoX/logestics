import 'package:flutter/material.dart';
import 'dark_theme/dark_theme.dart';
import 'light_theme/light_theme.dart';
class AppTheme{

       static ThemeData lightTheme(double densityPixelRation)=>LightTheme.lightTheme( densityPixelRation);
    static ThemeData darkTheme(double densityPixelRation){

   return   DarkTheme.darkTheme( densityPixelRation);}

}