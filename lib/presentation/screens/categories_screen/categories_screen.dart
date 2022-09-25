import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_app/business_logic/cubits/category_cubit/category_cubit.dart';
import 'package:shop_app/business_logic/cubits/category_cubit/category_states.dart';
import 'package:shop_app/data/models/category_model.dart';
import 'package:shop_app/presentation/screens/categories_screen/widgets/category_image_card.dart';
import 'package:shop_app/presentation/screens/categories_screen/widgets/category_name_card.dart';
import 'package:shop_app/utilities/constants/color_manager.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryCubit, CategoryStates>(
        builder: (context, state) {
          if (state is CategoryIsErrorState) {
            return Center(
              child: Text(state.errorMsg),
            );
          }
          if (state is CategoryIsLoadedState) {
            final List<CategoryItemModel> categories =
                state.categories.data.data;
            return MasonryGridView.count(
              crossAxisCount: 2,
              itemCount: categories.length,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    CategoryImageCard(
                      height: (index % 5 + 1) * 100,
                      image: categories[index].image,
                    ),
                    CategoryNameCard(
                      name: categories[index].name,
                    ),
                  ],
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManager.kPrimaryColor,
            ),
          );
        },
      ),
    );
  }
}
