import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:shop_app/business_logic/cubits/favorite_cubit/favorite_states.dart';
import 'package:shop_app/business_logic/cubits/home_cubit/home_cubit.dart';
import 'package:shop_app/data/models/favorite_model.dart';
import 'package:shop_app/presentation/widgets/product_card.dart';
import 'package:shop_app/utilities/constants/color_manager.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteStates>(
      builder: (context, state) {
        print(state);
        if (state is FavoritesIsLoadedState) {
          List<FavoriteItem> favoriteProducts = state.favoriteData.data.data;
          return Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  children: List.generate(
                    favoriteProducts.length,
                    (index) => ProductCard(
                      product: favoriteProducts[index].product,
                      onFavorite: () {
                        FavoriteCubit.get(context).changeProductFavorite(
                          productId: favoriteProducts[index].product.id,
                        );
                        HomeCubit.get(context).initHome();
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is FavoritesIsErrorState) {
          return Text(state.errorMsg);
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: ColorManager.kPrimaryColor,
          ));
        }
      },
    );
  }
}
