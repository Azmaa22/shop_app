import 'package:flutter/material.dart';
import 'package:shop_app/utilities/constants/color_manager.dart';

class CategoryImageCard extends StatelessWidget {
  final String image;
  final double height;
  const CategoryImageCard({
    super.key,
    required this.image,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.all(
        10.0,
      ),
      padding: const EdgeInsets.all(
        10.0,
      ),
      decoration: BoxDecoration(
        // color: ColorManager.kSecondaryColor,
        border: Border.all(
          color: ColorManager.kGrey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            15.0,
          ),
        ),
        image: DecorationImage(
          image: NetworkImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
