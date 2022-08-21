import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/app_bloc_provider..dart';
import 'package:shop_app/utilities/constants/theme_manager.dart';
import 'package:shop_app/utilities/navigation/route_generator.dart';
import 'package:shop_app/utilities/navigation/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.appBlocProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.getTheme(isLightMode: true),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: RouteManager.onboardingRoute,
      ),
    );
  }
}
