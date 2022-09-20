import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/shop_cubit/shop_states.dart';
import 'package:shop_app/presentation/screens/categories_screen/categories_screen.dart';
import 'package:shop_app/presentation/screens/favorite_screen/favorite_screen.dart';
import 'package:shop_app/presentation/screens/products_screen/products_screen.dart';
import 'package:shop_app/presentation/screens/settings_screen/settings_screen.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitState());
  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<FluidNavBarIcon> icons = [
    FluidNavBarIcon(
      icon: Icons.home,
      extras: {"label": "home"},
    ),
    FluidNavBarIcon(
      icon: Icons.apps,
      extras: {"label": "Categories"},
    ),
    FluidNavBarIcon(
      icon: Icons.favorite,
      extras: {"label": "Favorites"},
    ),
    FluidNavBarIcon(
      icon: Icons.settings,
      extras: {"label": "Settings"},
    ),
  ];
  List<Widget> bottomNavScreens = const [
    ProductsScreen(),
    CategoriesScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ];

  void changeBottomScreen({required int index}) {
    currentIndex = index;
    emit(ChangeBottomNavigationState());
  }
}
