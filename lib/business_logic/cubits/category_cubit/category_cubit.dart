import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/category_cubit/category_states.dart';
import 'package:shop_app/data/models/category_details_model.dart';
import 'package:shop_app/data/models/category_model.dart';
import 'package:shop_app/services/apis/api_end_points.dart';
import 'package:shop_app/utilities/constants/strings_manager.dart';
import 'package:shop_app/utilities/helpers/dio_helper.dart';
import 'package:shop_app/utilities/helpers/shared_preference_helper.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInitState());
  static CategoryCubit get(context) => BlocProvider.of(context);

  void getCategories() async {
    emit(CategoryIsLoadingState());
    DioHelper.getData(
      url: CategoriesEndPoints.categories,
    ).then((value) {
      emit(
        CategoryIsLoadedState(
          categories: CategoryModel.fromJson(
            value.data,
          ),
        ),
      );
    }).catchError((error) {
      emit(
        CategoryIsErrorState(
          errorMsg: error.toString(),
        ),
      );
    });
  }

  void getCategoryDetails({required int categoryId}) async {
    emit(ProductsOfCategoryIsLoadingState());
    DioHelper.getData(
        url: '${CategoriesEndPoints.categories}/$categoryId',
        headers: {
          'lang': 'ar',
          'Content-Type': 'application/json',
          'Authorization': SharedPreferenceHelper.getData(
            key: StringsManager.cachedLoginToken,
          ),
        }).then((value) {
      emit(
        ProductsOfCategoryIsLoadedState(
          categoryDetailsModel: CategoryDetailsModel.fromJson(
            value.data,
          ),
        ),
      );
    }).catchError((error) {
      emit(
        ProductsOfCategoryIsErrorState(
          msgError: error.toString(),
        ),
      );
    });
  }
}
