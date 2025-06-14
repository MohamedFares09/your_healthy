// 2. States (حالات الـ Tips)
import 'package:your_health/core/model/Tips_model.dart';

abstract class TipsState {} // حالة أساسية مجردة

class LoadingTips extends TipsState {} // حالة التحميل

class SuccessTips extends TipsState {
  final List<TipsModel> tipsList;
  SuccessTips({required this.tipsList});
}

class FailureTips extends TipsState {
  final String errMessage;
  FailureTips({required this.errMessage});
}
