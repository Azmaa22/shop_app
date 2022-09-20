class BannerModel {
  final int id;
  final String image;

  BannerModel({
    required this.id,
    required this.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["id"],
        image: json["image"],
      );
}
