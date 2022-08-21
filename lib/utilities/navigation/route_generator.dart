import 'package:flutter/material.dart';
import 'package:shop_app/presentation/screens/auth_screens/login_screen.dart';
import 'package:shop_app/presentation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:shop_app/utilities/constants/strings_manager.dart';
import 'package:shop_app/utilities/navigation/route_manager.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteManager.onboardingRoute:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case RouteManager.authRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            StringsManager.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(
            StringsManager.noRouteFound,
          ),
        ),
      ),
    );
  }
}
