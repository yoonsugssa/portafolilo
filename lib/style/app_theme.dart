import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
    colorScheme: ColorScheme.dark(

      primary: AppColors.light,
      //boton de tema
      surface: AppColors.blue,

      //boton de idioma
      onSurface: AppColors.text,
    ),
    useMaterial3: true,
    //fondo
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,


    appBarTheme: AppBarTheme(backgroundColor: AppColors.green),
  );
}