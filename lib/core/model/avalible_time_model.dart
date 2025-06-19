class AvalibleTimeModel {
  String start;
  String end;

  AvalibleTimeModel({required this.start, required this.end});

  factory AvalibleTimeModel.fromJson(Map<String, dynamic> json) {
    return AvalibleTimeModel(
      start: json['start'],
      end: json['end'],
    );
  }
}
