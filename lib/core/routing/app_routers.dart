import 'package:flutter/material.dart';
import 'package:go_car/core/routing/routes.dart';
import 'package:go_car/features/auth/login_screen/login_screen.dart';
import 'package:go_car/features/auth/sign_up_screen/congratulations_screen.dart';
import 'package:go_car/features/auth/sign_up_screen/phone_number_otp.dart';
import 'package:go_car/features/auth/sign_up_screen/sign_up_screen.dart';
import 'package:go_car/features/home/home_screen.dart';
import 'package:go_car/features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case Routes.phoneNumberOtp:
        return MaterialPageRoute(builder: (_) => PhoneNumberOtp());

        case Routes.congratulationsScreen:
        return MaterialPageRoute(builder: (_) => CongratulationsScreen());
      
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
