import 'package:flutter/material.dart';
import 'package:go_car/core/routing/routes.dart';
import 'package:go_car/features/login_screen/login_screen.dart';
import 'package:go_car/features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      default:
        // Unknown route
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
