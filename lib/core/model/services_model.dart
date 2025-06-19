class ServicesModel {
  String name;
  String serviceId;

  ServicesModel({required this.name, required this.serviceId});

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(name: json['name'], serviceId: json['id']);
  }
}
