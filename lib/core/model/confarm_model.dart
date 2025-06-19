class ConfarmModel {
  final int doctorId;
  final int serviceId;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String start;
  final String end;

  ConfarmModel({
    required this.doctorId,
    required this.serviceId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.start,
    required this.end,
  });

  Map<String, dynamic> toJson() {
    return {
      "doctor_id": doctorId,
      "service_id": serviceId,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone": phone,
      "start": start,
      "end": end,
    };
  }
}
