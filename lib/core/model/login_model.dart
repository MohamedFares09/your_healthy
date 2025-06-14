class LoginModel {
  final String ?token;
  final String ?userEmail;
  final String ?userNicename;
  final String ?userDisplayName;

  LoginModel({
    required this.token,
    required this.userEmail,
    required this.userNicename,
    required this.userDisplayName,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        token: json["token"],
        userEmail: json["user_email"],
        userNicename: json["user_nicename"],
        userDisplayName: json["user_nicename"],
        );
  }
}
