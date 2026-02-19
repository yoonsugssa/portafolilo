import 'package:flutter/material.dart';

import '../about_page.dart';
import '../courses_page.dart';
import '../home_page.dart';
import 'app_route.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.courses:
        return MaterialPageRoute(builder: (_) => const CoursesPage());
      case Routes.about:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('Error: No funciona el enlace.'),
        ),
      );
    });
  }
}
