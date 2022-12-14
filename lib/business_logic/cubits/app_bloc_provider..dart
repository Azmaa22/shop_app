import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:shop_app/business_logic/cubits/onboarding_cubit/onboarding_cubit.dart';

class AppBlocProvider {
  static List<BlocProvider> appBlocProvider = [
    BlocProvider<OnBoardingCubit>(
      create: (BuildContext context) => OnBoardingCubit(),
    ),
    BlocProvider<AuthCubit>(
      create: (BuildContext context) => AuthCubit(),
    ),
  ];
}
