import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portafolilo/home_page.dart';
import 'package:portafolilo/routes/app_route.dart';
import 'package:portafolilo/style/app_theme_controller.dart';
import 'package:portafolilo/widgets/app_locale_controller.dart';

import 'about_page.dart';
import 'courses_page.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(appLocaleControllerProvider);
    final theme = ref.watch(currentThemeProvider);

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      theme: theme,
      themeMode: ThemeMode.system,

      supportedLocales: const [
        Locale('es', 'ES'),
        Locale('en', 'US'),
      ],

      locale: Locale(locale.value ?? 'es'),
      initialRoute: Routes.home,

      routes: {
        Routes.home: (context) => const HomePage(),
        Routes.courses: (context) => const CoursesPage(),
        Routes.about: (context) => const AboutPage(),
      },
    );
  }
}