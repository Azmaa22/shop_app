import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/onboarding_cubit/onboarding_cubit.dart';
import 'package:shop_app/business_logic/cubits/onboarding_cubit/onboarding_states.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnBoardingCubit, OnBoardingStates>(
        builder: (context, state) {
          OnBoardingCubit myCubit = OnBoardingCubit.get(context);
          return Column(
            children: [
              Center(
                child: Image.network(
                  myCubit.mainImage,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
