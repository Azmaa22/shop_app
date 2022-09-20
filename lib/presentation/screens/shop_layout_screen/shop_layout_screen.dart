import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/shop_cubit/shop_cubit.dart';
import 'package:shop_app/business_logic/cubits/shop_cubit/shop_states.dart';
import 'package:shop_app/utilities/constants/color_manager.dart';
import 'package:shop_app/utilities/navigation/route_manager.dart';

class ShopLayoutScreen extends StatelessWidget {
  const ShopLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (context, state) {
        ShopCubit myCubit = ShopCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Shop Layout  Screen'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RouteManager.searchRoute,
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
            body: myCubit.bottomNavScreens[myCubit.currentIndex],
            bottomNavigationBar: FluidNavBar(
              scaleFactor: 1.5,
              animationFactor: 0.5,
              style: const FluidNavBarStyle(
                barBackgroundColor: ColorManager.kPrimaryColor,
                iconBackgroundColor: ColorManager.kSecondaryColor,
                iconSelectedForegroundColor: Colors.yellow,
                iconUnselectedForegroundColor: ColorManager.kWhite,
              ),
              defaultIndex: myCubit.currentIndex,
              onChange: ((selectedIndex) {
                myCubit.changeBottomScreen(index: selectedIndex);
              }),
              icons: myCubit.icons,
            ),
          ),
        );
      },
    );
  }
}
