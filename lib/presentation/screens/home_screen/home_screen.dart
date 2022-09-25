import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/home_cubit/home_cubit.dart';
import 'package:shop_app/business_logic/cubits/home_cubit/home_states.dart';
import 'package:shop_app/data/models/product_model.dart';
import 'package:shop_app/presentation/screens/home_screen/widgets/banner_slider.dart';
import 'package:shop_app/presentation/widgets/network_image_container.dart';
import 'package:shop_app/presentation/widgets/product_card.dart';
import 'package:shop_app/utilities/constants/color_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (state is HomeIsLoadedState) {
          List<ProductModel> products = state.homeData.data.products;
          return Column(
            children: [
              const BannerSlider(),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  children: List.generate(
                    products.length,
                    (index) => ProductCard(
                      product: products[index],
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is HomeIsErrorState) {
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
