class CategoetModel {
  String name;
  String image;
  CategoetModel({required this.name, required this.image});

  factory CategoetModel.fromJson(Map<String, dynamic> json) {
    return CategoetModel(
        name: json['name'], image: json['acf']['specialization_image_url']);
  }
}
