class ServicesModel {
  String name;
  ServicesModel({required this.name});

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(name: json['name']);
  }
}
