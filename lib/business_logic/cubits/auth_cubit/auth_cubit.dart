import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/auth_cubit/auth_states.dart';
import 'package:shop_app/data/enums/auth_enum.dart';
import 'package:shop_app/data/models/user_model.dart';
import 'package:shop_app/services/apis/api_end_points.dart';
import 'package:shop_app/utilities/helpers/dio_helper.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  void loginToApp({
    required Map<String, dynamic> userInfo,
    required Map<String, dynamic> headers,
  }) {
    emit(
      SignInIsLoadingState(),
    );
    DioHelper.postData(
      url: UserEndPoints.login,
      data: userInfo,
      headers: headers,
    ).then((data) {
      if (data.data['status'] == true) {
        final user = data.data['data'];

        emit(
          SignInIsLoadedState(
            message: data.data['message'],
            userData: UserModel.fromJson(
              user,
            ),
          ),
        );
      } else {
        emit(
          SignInIsErrorState(
            errorMsg: data.data['message'],
          ),
        );
      }
    }).catchError((error) {
      SignInIsErrorState(
        errorMsg: 'email, password or both are error',
      );
    });
  }

  void registerToApp({
    required Map<String, dynamic> userInfo,
    required Map<String, dynamic> headers,
  }) {
    emit(
      SignUpIsLoadingState(),
    );

    DioHelper.postData(
      url: UserEndPoints.register,
      data: userInfo,
      headers: headers,
    ).then((data) {
      if (data.data['status'] == true) {
        final user = data.data['data'];

        emit(
          SignUpIsLoadedState(
            userData: UserModel.fromJson(
              user,
            ),
          ),
        );
      } else {
        emit(
          SignUpIsErrorState(
            errorMsg: data.data['message'],
          ),
        );
      }
    }).catchError((error) {
      SignInIsErrorState(
        errorMsg: 'email, password or both are error',
      );
    });
  }
}
