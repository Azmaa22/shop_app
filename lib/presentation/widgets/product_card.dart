import 'package:flutter/material.dart';
import 'package:shop_app/data/models/product_model.dart';
import 'package:shop_app/presentation/widgets/network_image_container.dart';
import 'package:shop_app/utilities/constants/color_manager.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    imagePath: product.image,
                  ),
                ),
                product.discount != 0
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
            product.name,
          ),
          Row(
            children: [
              Text(
                '${product.price} EL',
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
          product.discount != 0
              ? Text(
                  '${product.oldPrice} EL',
                  style: const TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
