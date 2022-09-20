import 'package:shop_app/data/models/home_model.dart';

class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeIsLoadingState extends HomeStates {}

class HomeIsLoadedState extends HomeStates {
  final HomeModel homeData;

  HomeIsLoadedState({
    required this.homeData,
  });
}

class HomeIsErrorState extends HomeStates {
  final String errorMsg;

  HomeIsErrorState({
    required this.errorMsg,
  });
}
