import 'package:shop_app/data/models/favorite_model.dart';

class FavoriteStates {}

class FavoriteInitState extends FavoriteStates {}

class FavoritesIsLoadingState extends FavoriteStates {}

class FavoritesIsLoadedState extends FavoriteStates {
  final FavoriteModel favoriteData;

  FavoritesIsLoadedState({required this.favoriteData});
}

class FavoritesIsErrorState extends FavoriteStates {
  final String errorMsg;

  FavoritesIsErrorState({required this.errorMsg});
}

class ChangeFavoriteIsLoadingState extends FavoriteStates {}

class ChangeFavoriteIsLoadedState extends FavoriteStates {
  final bool status;

  ChangeFavoriteIsLoadedState({required this.status});
}

class ChangeFavoriteIsErrorState extends FavoriteStates {
  final String errorMsg;

  ChangeFavoriteIsErrorState({required this.errorMsg});
}
