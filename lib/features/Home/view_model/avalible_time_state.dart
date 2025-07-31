import 'package:your_health/core/model/avalible_time_model.dart';

class AvalibleTimeState {}

class AvalibleTimeInitState extends AvalibleTimeState {}

class AvalibleTimeLoadingState extends AvalibleTimeState {}

class AvalibleTimeSuccessState extends AvalibleTimeState {
  List<AvalibleTimeModel> listTime;
  AvalibleTimeSuccessState({required this.listTime});
}

class AvalibleTimeFailuerState extends AvalibleTimeInitState {
  String errMessage;
  AvalibleTimeFailuerState({required this.errMessage});
}
