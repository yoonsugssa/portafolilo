import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:portafolilo/style/app_theme.dart';
import 'package:flutter/material.dart';

enum AppThemeType { greenblue, redpink }

class AppThemeController extends StateNotifier<AppThemeType> {
  AppThemeController() : super(AppThemeType.greenblue);

  void toggleTheme() {
    state = state == AppThemeType.greenblue
        ? AppThemeType.redpink
        : AppThemeType.greenblue;
  }
}

final appThemeControllerProvider =
StateNotifierProvider<AppThemeController, AppThemeType>(
      (ref) => AppThemeController(),
);

// Provider derivado que devuelve el ThemeData listo para usar
final currentThemeProvider = Provider<ThemeData>((ref) {
  final themeType = ref.watch(appThemeControllerProvider);
  return themeType == AppThemeType.greenblue
      ? AppTheme.greenblue
      : AppTheme.redpink;
});