import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubits/onboarding_cubit/onboarding_cubit.dart';
import 'package:shop_app/business_logic/cubits/onboarding_cubit/onboarding_states.dart';
import 'package:shop_app/data/enums/auth_enum.dart';
import 'package:shop_app/utilities/constants/color_manager.dart';
import 'package:shop_app/utilities/constants/strings_manager.dart';
import 'package:shop_app/utilities/helpers/shared_preference_helper.dart';
import 'package:shop_app/utilities/navigation/route_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void skipOnBoardingPages() {
      SharedPreferenceHelper.saveData(
        key: StringsManager.cachedOnBoarding,
        value: true,
      ).then((value) {
        if (value) {
          Navigator.pushNamed(
            context,
            RouteManager.loginRoute,
          );
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorManager.kWhite,
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: TextButton(
                onPressed: () {
                  skipOnBoardingPages();
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ]),
      body: BlocBuilder<OnBoardingCubit, OnBoardingStates>(
        builder: (context, state) {
          OnBoardingCubit myCubit = OnBoardingCubit.get(context);
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: PageView.builder(
              controller: myCubit.onBoardingController,
              itemCount: myCubit.screens.length,
              onPageChanged: (int index) {
                myCubit.navigateToOtherScreen(index);
              },
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.network(
                        myCubit.screens[myCubit.currentIndex].image,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      myCubit.screens[myCubit.currentIndex].mainText,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      myCubit.screens[myCubit.currentIndex].subText,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 60.0,
                    ),
                    Row(
                      children: [
                        SmoothPageIndicator(
                          controller: myCubit.onBoardingController,
                          effect: const ExpandingDotsEffect(
                            dotColor: ColorManager.kGrey,
                            activeDotColor: ColorManager.kPrimaryColor,
                            dotHeight: 10,
                            expansionFactor: 4,
                            dotWidth: 10,
                            spacing: 5.0,
                          ),
                          count: myCubit.screens.length,
                        ),
                        const Spacer(),
                        FloatingActionButton(
                          elevation: 0.0,
                          backgroundColor: ColorManager.kPrimaryColor,
                          foregroundColor: ColorManager.kWhite,
                          child: const Icon(
                            Icons.arrow_forward_ios_sharp,
                          ),
                          onPressed: () {
                            skipOnBoardingPages();
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
