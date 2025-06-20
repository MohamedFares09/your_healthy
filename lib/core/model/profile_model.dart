class ProfileModel {
  final String name;
  final String email;
  final String id;
  final String date;
  final String time;
  final String doctor;
  final String service;
  final String status;

  ProfileModel({
    required this.name,
    required this.email,
    required this.id,
    required this.date,
    required this.time,
    required this.doctor,
    required this.service,
    required this.status,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    final appointments = json['appointments'];
    if (appointments != null &&
        appointments is List &&
        appointments.isNotEmpty) {
      final appointment = appointments[0];
      return ProfileModel(
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        id: appointment['id']?.toString() ?? '',
        date: appointment['date'] ?? '',
        time: appointment['time'] ?? '',
        doctor: appointment['doctor'] ?? '',
        service: appointment['service'] ?? '',
        status: appointment['status'] ?? '',
      );
    } else {
      // لا يوجد مواعيد، نعرض فقط بيانات المستخدم الأساسية
      return ProfileModel(
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        id: '',
        date: '',
        time: '',
        doctor: '',
        service: '',
        status: '',
      );
    }
  }
}
