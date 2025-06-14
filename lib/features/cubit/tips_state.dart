// 2. States (حالات الـ Tips)
import 'package:your_health/core/model/Tips_model.dart';

abstract class TipsState {} 

class InitTips extends TipsState {}

class LoadingTips extends TipsState {} 

class SuccessTips extends TipsState {
  final List<TipsModel> tipsList;
  SuccessTips({required this.tipsList});
}

class FailureTips extends TipsState {
  final String errMessage;
  FailureTips({required this.errMessage});
}
