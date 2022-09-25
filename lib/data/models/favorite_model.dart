import 'package:shop_app/data/models/product_model.dart';

class FavoriteModel {
  FavoriteModel({
    required this.status,
    required this.data,
  });

  bool status;
  FavoriteData data;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      status: json["status"],
      data: FavoriteData.fromJson(json["data"]),
    );
  }
}

class FavoriteData {
  FavoriteData({
    required this.data,
  });

  List<FavoriteItem> data;

  factory FavoriteData.fromJson(Map<String, dynamic> json) => FavoriteData(
        data: List<FavoriteItem>.from(
            json["data"].map((x) => FavoriteItem.fromJson(x))),
      );
}

class FavoriteItem {
  FavoriteItem({
    required this.id,
    required this.product,
  });

  int id;
  ProductModel product;

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> product = {
      'id': json["product"]["id"],
      'price': json["product"]["price"],
      'oldPrice': json["product"]["old_price"],
      'discount': json["product"]["discount"],
      'image': json["product"]["image"],
      'name': json["product"]["name"],
      'in_favorites': true,
      'in_cart': false,
    };
    return FavoriteItem(
      id: json["id"],
      product: ProductModel.fromJson(product),
    );
  }
}
