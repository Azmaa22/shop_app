import 'package:flutter/material.dart';
import 'package:shop_app/utilities/constants/color_manager.dart';

class CategoryNameCard extends StatelessWidget {
  final String name;
  const CategoryNameCard({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        15.0,
      ),
      decoration: BoxDecoration(
        color: ColorManager.kSecondaryColor.withOpacity(
          0.7,
        ),
        borderRadius: BorderRadius.circular(
          15.0,
        ),
      ),
      child: Text(
        name,
        style: Theme.of(context).textTheme.caption!.copyWith(
              color: Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
