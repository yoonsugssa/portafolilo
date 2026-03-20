import 'package:flutter/material.dart';
import 'app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = AppTheme.greenblue;
  String _themeName = 'greenblue';

  ThemeData get currentTheme => _currentTheme;
  bool get isRedPink => _themeName == 'redpink';

  void toggleTheme() {
    if (_themeName == 'greenblue') {
      _currentTheme = AppTheme.redpink;
      _themeName = 'redpink';
    } else {
      _currentTheme = AppTheme.greenblue;
      _themeName = 'greenblue';
    }
    notifyListeners();
  }
}