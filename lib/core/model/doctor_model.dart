class DoctorModel {
  final String nameDoctor;
  final String? imageDocor;
  final String contentDctor;
  final String specializationDoctor;
  final String specialtyDoctor;
  final String addressDoctor;
  final String priceDoctor;

  DoctorModel({
    required this.nameDoctor,
    this.imageDocor,
    required this.contentDctor,
    required this.specializationDoctor,
    required this.specialtyDoctor,
    required this.addressDoctor,
    required this.priceDoctor,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      nameDoctor: json['title']['rendered'],
      contentDctor: json['content']['rendered'],
      imageDocor: json['_embedded']?['wp:featuredmedia']?[0]?['media_details']?['sizes']?['thumbnail']?['source_url']
          ?? json['_embedded']?['wp:featuredmedia']?[0]?['source_url']
          ?? '',
      specializationDoctor: json['acf']['doctor_specialization'] ?? '',
      specialtyDoctor: json['_embedded']?['wp:term']?[0]?[0]?['name'] ?? '',
      addressDoctor: json['acf']['doctor_address'] ?? '',
      priceDoctor: json['acf']['doctor_price'].toString(),
    );
  }
}
