import 'package:flutter/material.dart';
import 'package:shop_app/presentation/screens/auth_screens/login_screen.dart';
import 'package:shop_app/presentation/screens/auth_screens/register_screen.dart';
import 'package:shop_app/presentation/screens/search_screen/search_screen.dart';
import 'package:shop_app/presentation/screens/shop_layout_screen/shop_layout_screen.dart';
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
      case RouteManager.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RouteManager.registerRoute:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case RouteManager.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const ShopLayoutScreen(),
        );
      case RouteManager.searchRoute:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
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
