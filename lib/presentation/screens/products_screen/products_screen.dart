import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_app/business_logic/cubits/category_cubit/category_cubit.dart';
import 'package:shop_app/business_logic/cubits/category_cubit/category_states.dart';
import 'package:shop_app/data/entities/category_details_screen_arguments.dart';
import 'package:shop_app/data/models/product_model.dart';
import 'package:shop_app/presentation/widgets/product_card.dart';
import 'package:shop_app/utilities/constants/color_manager.dart';

class ProductsScreen extends StatelessWidget {
  final CategoryDetailsScreenArguments categoryDetailsScreenArguments;
  const ProductsScreen({
    super.key,
    required this.categoryDetailsScreenArguments,
  });

  @override
  Widget build(BuildContext context) {
    final int categoryId = categoryDetailsScreenArguments.categoryId;
    final String categoryName = categoryDetailsScreenArguments.categoryName;

    return BlocProvider(
      create: (context) => CategoryCubit()
        ..getCategoryDetails(
          categoryId: categoryId,
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            categoryName,
          ),
        ),
        body: BlocBuilder<CategoryCubit, CategoryStates>(
          builder: (context, state) {
            if (state is ProductsOfCategoryIsLoadedState) {
              final List<ProductModel> products =
                  state.categoryDetailsModel.data.products;
              return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                children: List.generate(
                  products.length,
                  (index) => ProductCard(
                    product: products[index],
                  ),
                ),
              );
            }
            if (state is ProductsOfCategoryIsErrorState) {
              return Center(
                child: Text(
                  state.msgError,
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: ColorManager.kPrimaryColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
