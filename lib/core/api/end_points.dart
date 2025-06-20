class EndPoints {
  static String baseURL =
      "https://dev-booking-system-website.pantheonsite.io/wp-json/";
  static String login = "jwt-auth/v1/token";
  static String signUp = "custom/v1/register";
  static String advice = "wp/v2/posts?_embed";
  static String doctor = "wp/v2/doctor?_embed";
  static String category = "wp/v2/specialization";
  static String services(int id) => "custom/v1/doctor-services/$id";
  static String doctorDaySlots({
    required int doctorId,
    required int serviceId,
    required String date,
  }) =>
      "custom/v1/doctor-day-slots?doctor_id=$doctorId&service_id=$serviceId&date=$date";
  static String confarm = "custom/v1/book-appointment";
  static String profile = "custom/v1/patient-profile";
}
