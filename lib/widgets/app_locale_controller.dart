import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppLocaleController extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() {
    return 'es';
  }

  void changeLocale(String newLocale) {
    update((state) => newLocale);
  }
}