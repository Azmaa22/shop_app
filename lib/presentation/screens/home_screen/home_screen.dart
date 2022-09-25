import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/home_cubit/home_cubit.dart';
import 'package:shop_app/business_logic/cubits/home_cubit/home_states.dart';
import 'package:shop_app/data/models/product_model.dart';
import 'package:shop_app/presentation/screens/home_screen/widgets/banner_slider.dart';
import 'package:shop_app/presentation/widgets/network_image_container.dart';
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
                    (index) => Container(
                      margin: const EdgeInsets.all(
                        10.0,
                      ),
                      padding: const EdgeInsets.all(
                        10.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: ColorManager.kGrey,
                        ),
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                Center(
                                  child: NetworkImageContainer(
                                    imagePath: products[index].image,
                                  ),
                                ),
                                products[index].discount != 0
                                    ? Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                        ),
                                        color: Colors.redAccent,
                                        child: const Text(
                                          'Discount',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          Text(
                            products[index].name,
                          ),
                          Row(
                            children: [
                              Text(
                                '${products[index].price} EL',
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          products[index].discount != 0
                              ? Text(
                                  '${products[index].oldPrice} EL',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
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
