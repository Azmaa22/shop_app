import 'package:shop_app/data/models/category_details_model.dart';
import 'package:shop_app/data/models/category_model.dart';

abstract class CategoryStates {}

class CategoryInitState extends CategoryStates {}

class CategoryIsLoadingState extends CategoryStates {}

class CategoryIsLoadedState extends CategoryStates {
  final CategoryModel categories;

  CategoryIsLoadedState({
    required this.categories,
  });
}

class CategoryIsErrorState extends CategoryStates {
  final String errorMsg;
  CategoryIsErrorState({
    required this.errorMsg,
  });
}

class ProductsOfCategoryIsLoadingState extends CategoryStates {}

class ProductsOfCategoryIsLoadedState extends CategoryStates {
  final CategoryDetailsModel categoryDetailsModel;

  ProductsOfCategoryIsLoadedState({required this.categoryDetailsModel});
}

class ProductsOfCategoryIsErrorState extends CategoryStates {
  final String msgError;

  ProductsOfCategoryIsErrorState({required this.msgError});
}
