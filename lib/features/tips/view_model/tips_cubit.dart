import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/api_consumer.dart';
import 'package:your_health/core/api/end_points.dart';
import 'package:your_health/core/model/Tips_model.dart';
import 'package:your_health/features/tips/view_model/tips_state.dart';

class TipsCubit extends Cubit<TipsState> {
  TipsCubit(
    this.apiConsumer,
  ) : super(InitTips());
  ApiConsumer apiConsumer;
  getTips() async {
    if (isClosed) return;
    emit(LoadingTips());
    try {
      final data = await apiConsumer.get(EndPoints.advice);

      List<TipsModel> tipsList = [];

      for (var tips in data) {
        tipsList.add(TipsModel.fromJson(tips));
      }

      if (isClosed) return;
      emit(SuccessTips(tipsList: tipsList));
    } catch (e) {
      if (isClosed) return;
      log(e.toString());
      emit(FailureTips(errMessage: "يوجد مشكله في الوقت الحالي"));
    }
  }
}
