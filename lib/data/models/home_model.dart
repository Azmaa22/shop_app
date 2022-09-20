import 'package:shop_app/data/models/banner_model.dart';
import 'package:shop_app/data/models/product_model.dart';

class HomeModel {
  HomeModel({
    required this.status,
    required this.data,
  });

  bool status;

  HomeDataModel data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json["status"],
        data: HomeDataModel.fromJson(json["data"]),
      );
}

class HomeDataModel {
  HomeDataModel({
    required this.banners,
    required this.products,
    required this.ad,
  });

  List<BannerModel> banners;
  List<ProductModel> products;
  String ad;

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
        banners: List<BannerModel>.from(
          json["banners"].map(
            (banner) => BannerModel.fromJson(banner),
          ),
        ),
        products: List<ProductModel>.from(
          json["products"].map(
            (product) => ProductModel.fromJson(product),
          ),
        ),
        ad: json["ad"],
      );
}
