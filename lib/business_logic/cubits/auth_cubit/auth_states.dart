import 'package:shop_app/data/models/user_model.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class SignInIsLoadingState extends AuthStates {}

class SignInIsLoadedState extends AuthStates {
  final String message;
  final UserModel userData;

  SignInIsLoadedState({
    required this.userData,
    required this.message,
  });
}

class SignInIsErrorState extends AuthStates {
  final String errorMsg;

  SignInIsErrorState({required this.errorMsg});
}

class SignUpIsLoadingState extends AuthStates {}

class SignUpIsLoadedState extends AuthStates {
  final UserModel userData;

  SignUpIsLoadedState({required this.userData});
}

class SignUpIsErrorState extends AuthStates {
  final String errorMsg;

  SignUpIsErrorState({required this.errorMsg});
}

class SignOutState extends AuthStates {}

class FormTypeState extends AuthStates {}
