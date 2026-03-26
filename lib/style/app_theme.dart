import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {

  static ThemeData get greenblue => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.plane,

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.darkblue;
        return AppColors.darkblue;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.darkblue.withOpacity(0.5);
        return AppColors.darkblue.withOpacity(0.5);
      }),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
    ),

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
        backgroundColor: AppColors.darkblue,
        foregroundColor: DarkAppColors.plane,
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

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return DarkAppColors.cutered;
        return DarkAppColors.cutered;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return DarkAppColors.cutered.withOpacity(0.3);
        return DarkAppColors.cutered.withOpacity(0.3);
      }),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
    ),

    colorScheme: const ColorScheme.dark(
      primary: DarkAppColors.red,
      secondary: DarkAppColors.plane,
      surface: DarkAppColors.red,
      onPrimary: DarkAppColors.plane,
      onSecondary: DarkAppColors.red,
      onSurface: DarkAppColors.plane, //fondo del my bar,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: DarkAppColors.plane,
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