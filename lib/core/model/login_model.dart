class LoginModel {
  final String ?token;
  final String ?user_email;
  final String ?user_nicename;
  final String ?user_display_name;

  LoginModel({
    required this.token,
    required this.user_email,
    required this.user_nicename,
    required this.user_display_name,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        token: json["token"],
        user_email: json["user_email"],
        user_nicename: json["user_nicename"],
        user_display_name: json["user_nicename"],
        );
  }
}
