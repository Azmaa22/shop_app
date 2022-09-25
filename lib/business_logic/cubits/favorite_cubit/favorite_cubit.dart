import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/favorite_cubit/favorite_states.dart';
import 'package:shop_app/business_logic/cubits/home_cubit/home_cubit.dart';
import 'package:shop_app/data/models/favorite_model.dart';
import 'package:shop_app/services/apis/api_end_points.dart';
import 'package:shop_app/utilities/constants/strings_manager.dart';
import 'package:shop_app/utilities/helpers/dio_helper.dart';
import 'package:shop_app/utilities/helpers/shared_preference_helper.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit() : super(FavoriteInitState());
  static FavoriteCubit get(context) => BlocProvider.of(context);
  void getFavorites() async {
    emit(FavoritesIsLoadingState());
    DioHelper.getData(url: FavoriteEndPoints.favorites, headers: {
      'lang': 'ar',
      'Content-Type': 'application/json',
      'Authorization': SharedPreferenceHelper.getData(
        key: StringsManager.cachedLoginToken,
      ),
    }).then((value) {
      emit(
        FavoritesIsLoadedState(
          favoriteData: FavoriteModel.fromJson(value.data),
        ),
      );
    }).catchError((error) {
      emit(
        FavoritesIsErrorState(
          errorMsg: error.toString(),
        ),
      );
    });
  }

  void changeProductFavorite({
    required int productId,
  }) async {
    print(productId);
    emit(ChangeFavoriteIsLoadingState());

    DioHelper.postData(url: FavoriteEndPoints.favorites, data: {
      'product_id': productId,
    }, headers: {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': SharedPreferenceHelper.getData(
        key: StringsManager.cachedLoginToken,
      ),
    }).then((value) {
      var msg = value.data['status'];
      print(msg);
      emit(
        ChangeFavoriteIsLoadedState(
          status: value.data['status'],
        ),
      );
      getFavorites();
    }).catchError((error) {
      emit(
        ChangeFavoriteIsErrorState(
          errorMsg: error.toString(),
        ),
      );
    });
  }
}
