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
