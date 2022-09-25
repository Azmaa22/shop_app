import 'package:shop_app/data/models/product_model.dart';

class CategoryDetailsModel {
  CategoryDetailsModel({
    required this.status,
    required this.data,
  });

  bool status;

  ProductDataModel data;

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) =>
      CategoryDetailsModel(
        status: json["status"],
        data: ProductDataModel.fromJson(json["data"]),
      );
}

class ProductDataModel {
  ProductDataModel({
    required this.products,
  });

  List<ProductModel> products;

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      ProductDataModel(
        products: List<ProductModel>.from(
          json["data"].map(
            (product) => ProductModel.fromJson(product),
          ),
        ),
      );
}
