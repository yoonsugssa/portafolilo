import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_locale_controller.dart';


final appLocaleProvider = AsyncNotifierProvider<AppLocaleController, String> (
  AppLocaleController.new,
);
