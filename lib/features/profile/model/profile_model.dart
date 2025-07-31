class AppointmentModel {
  final String id;
  final String date;
  final String time;
  final String doctor;
  final String service;
  final String status;

  AppointmentModel({
    required this.id,
    required this.date,
    required this.time,
    required this.doctor,
    required this.service,
    required this.status,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id']?.toString() ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      doctor: json['doctor'] ?? '',
      service: json['service'] ?? '',
      status: json['status'] ?? '',
    );
  }
}

class ProfileModel {
  final String name;
  final String email;
  final List<AppointmentModel> appointments;

  ProfileModel({
    required this.name,
    required this.email,
    required this.appointments,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    final appointmentsJson = json['appointments'] as List?;
    final appointments = appointmentsJson != null
        ? appointmentsJson.map((e) => AppointmentModel.fromJson(e)).toList()
        : <AppointmentModel>[];
    return ProfileModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      appointments: appointments,
    );
  }
}
