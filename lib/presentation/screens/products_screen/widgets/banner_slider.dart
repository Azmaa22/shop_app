import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/home_cubit/home_cubit.dart';
import 'package:shop_app/business_logic/cubits/home_cubit/home_states.dart';
import 'package:shop_app/data/models/banner_model.dart';
import 'package:shop_app/presentation/widgets/network_image_container.dart';
import 'package:shop_app/utilities/constants/color_manager.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final double viewportFraction = 0.8;
  late PageController controller;
  double pageOffset = 0.0;
  @override
  void initState() {
    controller =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(() {
            setState(() {
              pageOffset = controller.page!;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: ColorManager.kSecondaryColor.withOpacity(0.5),
      width: double.infinity,
      height: size.height * 0.25,
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          if (state is HomeIsLoadedState) {
            List<BannerModel> banners = state.homeData.data.banners;
            return PageView.builder(
                controller: controller,
                itemCount: banners.length,
                itemBuilder: (context, index) {
                  double scale = max(viewportFraction,
                      (1 - (pageOffset - index).abs() + viewportFraction));
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: 10,
                      top: 100 - scale * 45,
                      right: 30,
                    ),
                    child:
                        NetworkImageContainer(imagePath: banners[index].image),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorManager.kPrimaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}
