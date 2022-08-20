import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/onboarding_cubits/onboarding_states.dart';
import 'package:shop_app/utilities/constants/image_manager.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(GoToInitialScreenState());

  int currentIndex = 0;
  final String mainImage = ImageManager.onBoardingImage;

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  void navigateToOtherScreen(int index) {
    currentIndex = index;

    emit(GoToOtherScreenState());
  }
}
