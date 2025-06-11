class SignUpModel {
  bool success;
  int user_id; 

  SignUpModel({
    required this.success,
    required this.user_id,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      success: json['success'],
      user_id: json['user_id'],
    );
  }
}
