import 'package:flutter/material.dart';
import 'app_colors.dart';

//No funcionan los themes
class AppTheme {
  static ThemeData get greenblue => ThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColors.black,
      //boton de tema
      surface: AppColors.darkblue,
      //boton de idioma
      onSurface: AppColors.plane, //white
      onSecondary: AppColors.darkgreen,
    ),
    useMaterial3: true,
    //fondo
    scaffoldBackgroundColor: AppColors.plane, //white
    appBarTheme: AppBarTheme(backgroundColor: AppColors.green),
  );
}

class RedAppTheme {
  static ThemeData get redpink => ThemeData(
    colorScheme: ColorScheme.dark(
      primary: DarkAppColors.plane,
      //boton de tema
      surface: DarkAppColors.cutered,
      //boton de idioma
      onSurface: DarkAppColors.black,
    ),
    useMaterial3: true,
    //fondo
    scaffoldBackgroundColor: DarkAppColors.black,
    appBarTheme: AppBarTheme(backgroundColor: DarkAppColors.red),
  );
}