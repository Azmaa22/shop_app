import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/onboarding_cubit/onboarding_states.dart';
import 'package:shop_app/data/models/onboarding_model.dart';
import 'package:shop_app/utilities/constants/image_manager.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(GoToInitialScreenState());

  int currentIndex = 0;
  final List<OnBoardingModel> screens = [
    OnBoardingModel(
        image: ImageManager.onBoardingImage,
        mainText: 'On Border 1 Title',
        subText: 'On Border 1 Body'),
    OnBoardingModel(
        image: ImageManager.onBoardingImage,
        mainText: 'On Border 2 Title',
        subText: 'On Border 2 Body'),
    OnBoardingModel(
        image: ImageManager.onBoardingImage,
        mainText: 'On Border 3 Title',
        subText: 'On Border 3 Body'),
  ];
  bool isLastScreen = false;
  PageController onBoardingController = PageController();
  static OnBoardingCubit get(context) => BlocProvider.of(context);

  void navigateToOtherScreen(int index) {
    currentIndex = index;
    if (index == screens.length) {
      isLastScreen = true;
      emit(SetLastScreenFlag());
    } else {
      emit(GoToOtherScreenState());
    }
  }

  void setIsLastScreen(bool isLastScreenFlag) {
    isLastScreen = isLastScreenFlag;

    emit(SetLastScreenFlag());
  }
}
