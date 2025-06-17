class CategoetModel {
  String name;
  String image;
  int specializationId;

  CategoetModel({
    required this.name,
    required this.image,
    required this.specializationId,
  });

  factory CategoetModel.fromJson(Map<String, dynamic> json) {
    return CategoetModel(
      name: json['name'],
      image: json['acf']['specialization_image_url'],
      specializationId: json['id'], // id هو رقم التخصص
    );
  }
}
