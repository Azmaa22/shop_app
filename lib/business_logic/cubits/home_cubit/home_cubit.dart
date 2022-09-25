import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/home_cubit/home_states.dart';
import 'package:shop_app/data/models/home_model.dart';
import 'package:shop_app/services/apis/api_end_points.dart';
import 'package:shop_app/utilities/constants/strings_manager.dart';
import 'package:shop_app/utilities/helpers/dio_helper.dart';
import 'package:shop_app/utilities/helpers/shared_preference_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());
  static HomeCubit get(context) => BlocProvider.of(context);
  void initHome() async {
    emit(HomeIsLoadingState());
    DioHelper.getData(url: HomeEndPoints.home, headers: {
      'lang': 'ar',
      'Authorization': SharedPreferenceHelper.getData(
        key: StringsManager.cachedLoginToken,
      ),
    }).then((value) {
      emit(
        HomeIsLoadedState(
          homeData: HomeModel.fromJson(
            value.data,
          ),
        ),
      );
    }).catchError((error) {
      emit(
        HomeIsErrorState(errorMsg: 'error'),
      );
    });
  }
}
