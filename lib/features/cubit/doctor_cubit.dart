import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/api_consumer.dart';
import 'package:your_health/core/api/end_points.dart';
import 'package:your_health/core/model/doctor_model.dart';
import 'package:your_health/features/cubit/doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit(this.api) : super(InitDoctor());
  ApiConsumer api;
  getDoctor() async {
    if (isClosed) return;
    emit(LoadingDoctor());
    try {
      final data = await api.get(EndPoints.doctor);
      List<DoctorModel> doctorList = [];
      for (var tips in data) {
        doctorList.add(DoctorModel.fromJson(tips));
      }
      if (isClosed) return;
      emit(SuccessDoctor(doctorList: doctorList));
      log(data.toString());
    } catch (e) {
      if (isClosed) return;
      log(e.toString());
      emit(FailureDoctor(errMessage: "يوجد مشكله في الوقت الحالي "));
    }
  }
}
