class SignUpModel {
  bool success;
  int userId; 

  SignUpModel({
    required this.success,
    required this.userId,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      success: json['success'],
      userId: json['user_id'],
    );
  }
}
