import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {

  static ThemeData get greenblue => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.plane,

    colorScheme: const ColorScheme.light(
      primary: AppColors.plane,
      secondary: AppColors.plane,
      surface: AppColors.darkblue,
      onPrimary: AppColors.plane,
      onSecondary: AppColors.darkgreen,
      onSurface: AppColors.plane,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.plane,
      foregroundColor: AppColors.darkgreen,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.plane,
        foregroundColor: AppColors.plane,
      ),
    ),

    iconTheme: const IconThemeData(color: AppColors.darkblue),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.plane),
      bodyMedium: TextStyle(color: AppColors.plane),
      titleLarge: TextStyle(color: AppColors.darkblue, fontWeight: FontWeight.bold),
    ),
  );

  static ThemeData get redpink => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkAppColors.plane,

    colorScheme: const ColorScheme.dark(
      primary: DarkAppColors.plane,
      secondary: DarkAppColors.plane,
      surface: DarkAppColors.red,
      onPrimary: DarkAppColors.plane,
      onSecondary: DarkAppColors.darkred,
      onSurface: DarkAppColors.plane, //fondo del my bar,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: DarkAppColors.black,
      foregroundColor: DarkAppColors.plane,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DarkAppColors.cutered,
        foregroundColor: DarkAppColors.plane,
      ),
    ),

    iconTheme: const IconThemeData(color: DarkAppColors.lightpink),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: DarkAppColors.pink),
      bodyMedium: TextStyle(color: DarkAppColors.pink),
      titleLarge: TextStyle(color: DarkAppColors.lightpink, fontWeight: FontWeight.bold),
    ),
  );
}