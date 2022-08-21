import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/auth_cubit/auth_states.dart';
import 'package:shop_app/data/enums/auth_enum.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  AuthFormType formType = AuthFormType.login;
  bool isLoginForm = true;

  static AuthCubit get(context) => BlocProvider.of(context);
  void loginToApp({required String email, required String password}) {}
  void changeFormType(AuthFormType formType) {
    if (formType == AuthFormType.login) {
      formType = AuthFormType.login;
      isLoginForm = true;
    } else {
      formType = AuthFormType.register;
      isLoginForm = false;
    }
    emit(FormTypeState());
  }
}
