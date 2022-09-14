import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/app_bloc_provider..dart';
import 'package:shop_app/utilities/constants/strings_manager.dart';
import 'package:shop_app/utilities/constants/theme_manager.dart';
import 'package:shop_app/utilities/helpers/shared_preference_helper.dart';
import 'package:shop_app/utilities/navigation/route_generator.dart';
import 'package:shop_app/utilities/navigation/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool cachedOnBoarding =
        SharedPreferenceHelper.isKeyFound(key: StringsManager.cachedOnBoarding)
            ? SharedPreferenceHelper.getData(
                key: StringsManager.cachedOnBoarding,
              )
            : false;
    String cachedToken =
        SharedPreferenceHelper.isKeyFound(key: StringsManager.cachedLoginToken)
            ? SharedPreferenceHelper.getData(
                key: StringsManager.cachedLoginToken,
              )
            : '';
    String getStartRoute() {
      if (cachedOnBoarding) {
        if (cachedToken != '') {
          return RouteManager.homeRoute;
        } else {
          return RouteManager.loginRoute;
        }
      } else {
        return RouteManager.onboardingRoute;
      }
    }

    return MultiBlocProvider(
      providers: AppBlocProvider.appBlocProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.getTheme(isLightMode: true),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: getStartRoute(),
      ),
    );
  }
}
