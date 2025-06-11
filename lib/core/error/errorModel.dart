class Errormodel {
  String? message;
  Map<String, dynamic>? data;
  Errormodel({required this.message, this.data});
  Errormodel.fromJson(String json) {
    message = json;
    // data = json['data'];
  }
}

class Data {
  int? status;

  Data({this.status});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }
}
