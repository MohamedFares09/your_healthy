class Errormodel {
  String? message;
  Map<String, dynamic>? data;
  Errormodel({required this.message, this.data});
  Errormodel.fromJson(Map<String, dynamic> json) {
    if(json['message'] == null) return;
    message = json['message'];
    data = json['data'];
  }
  Errormodel.fromString(String this.message);
}

class Data {
  int? status;

  Data({this.status});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }
}
