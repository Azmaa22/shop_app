class CategoryModel {
  CategoryModel({
    required this.status,
    required this.data,
  });

  bool status;
  CategoriesDataModel data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json["status"],
        data: CategoriesDataModel.fromJson(json["data"]),
      );
}

class CategoriesDataModel {
  CategoriesDataModel({
    required this.currentPage,
    required this.data,
  });

  int currentPage;
  List<CategoryItemModel> data;

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) =>
      CategoriesDataModel(
        currentPage: json["current_page"],
        data: List<CategoryItemModel>.from(
            json["data"].map((x) => CategoryItemModel.fromJson(x))),
      );
}

class CategoryItemModel {
  CategoryItemModel({
    required this.id,
    required this.name,
    required this.image,
  });

  int id;
  String name;
  String image;

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) =>
      CategoryItemModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );
}
