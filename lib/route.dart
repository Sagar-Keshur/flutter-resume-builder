import 'package:flutter/material.dart';
import 'package:flutter_resume_builder/views/pages/form_input.dart';
import 'package:flutter_resume_builder/views/pages/home.dart';

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomePage(),
        );
      case FormInputPage.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const FormInputPage(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomePage(),
        );
    }
  }
}
