// ignore: todo
// TODO Implement this library.
// ignore_for_file: prefer_collection_literals

class CategoriesModel {
  String? categoriesId;
  String? categoriesName;
  String? categoriesImage;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesImage,
    });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['id'];
    categoriesName = json['name'];
    categoriesImage = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = categoriesId;
    data['name'] = categoriesName;
    data['image'] = categoriesImage;
    return data;
  }
}
