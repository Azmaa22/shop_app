import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/utilities/constants/color_manager.dart';

class NetworkImageContainer extends StatelessWidget {
  final String imagePath;
  const NetworkImageContainer({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          color: ColorManager.kPrimaryColor,
        ),
      ),
      errorWidget: (context, url, error) {
        return const Icon(Icons.error);
      },
      fit: BoxFit.cover,
    );
  }
}
