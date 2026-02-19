import 'package:flutter/material.dart';

abstract class AppTextStyles {
  TextStyle get titleSmBold;
  TextStyle get bodyMdMedium;
  TextStyle get titleLgBold;
  TextStyle get titleMdMedium;
  TextStyle get bodyLgBold;
  TextStyle get bodyLgMedium;
}

class SmallTextStyles extends AppTextStyles {
  @override
  TextStyle get bodyLgBold => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle get bodyLgMedium => const TextStyle(
    fontSize: 20,
  );

  @override
  TextStyle get bodyMdMedium => const TextStyle(
    fontSize: 14,
  );

  @override
  TextStyle get titleLgBold => const TextStyle(
    fontSize: 24,
  );

  @override
  TextStyle get titleMdMedium => const TextStyle(
    fontSize: 14,
  );

  @override
  TextStyle get titleSmBold => const TextStyle(
    fontSize: 16,
  );
}

class LargeTextStyles extends AppTextStyles {

  @override
  TextStyle get bodyLgBold => const TextStyle(
    fontSize: 16,
  );

  @override
  TextStyle get bodyLgMedium => const TextStyle(
    fontSize: 16,
  );

  @override
  TextStyle get bodyMdMedium => const TextStyle(
    fontSize: 14,
  );

  @override
  TextStyle get titleLgBold => const TextStyle(
    fontSize: 40,
  );

  @override
  TextStyle get titleMdMedium =>const TextStyle(
    fontSize: 16,
  );

  @override
  TextStyle get titleSmBold => const TextStyle(
    fontSize: 16,
  );
}
