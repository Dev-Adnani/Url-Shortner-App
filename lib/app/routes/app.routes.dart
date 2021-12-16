import 'package:flutter/material.dart';
import 'package:urlshortner/presentation/views/customShortView/custom.short.view.dart';
import 'package:urlshortner/presentation/views/deciderView/decider.view.dart';
import 'package:urlshortner/presentation/views/randomShortView/random.short.view.dart';

class AppRouter {
  static const String customRoute = "/customRoute";
  static const String randomRoute = "/randomRoute";
  static const String deciderRoute = "/deciderRoute";

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case customRoute:
        {
          return MaterialPageRoute(builder: (_) => CustomShortView());
        }
      case randomRoute:
        {
          return MaterialPageRoute(builder: (_) => RandomShortView());
        }
      case deciderRoute:
        {
          return MaterialPageRoute(builder: (_) => const DeciderView());
        }
    }
  }
}
