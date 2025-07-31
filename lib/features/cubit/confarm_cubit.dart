import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/api_consumer.dart';
import 'package:your_health/core/api/end_points.dart';
import 'package:your_health/core/model/confarm_model.dart';
import 'package:your_health/features/cubit/confarm_state.dart';
import 'package:your_health/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfarmCubit extends Cubit<ConfarmState> {
  final ApiConsumer api;

  ConfarmCubit(this.api) : super(ConfarmInitial());

  Future<void> bookAppointment(ConfarmModel model) async {
    emit(ConfarmLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token == null) {
        emit(ConfarmError("يجب تسجيل الدخول أولاً"));
        return;
      }
      log('Booking request body: ' + model.toJson().toString());
      log('Booking request headers: ' +
          {'Authorization': 'Bearer $token'}.toString());
      final response = await api.post(
        EndPoints.confarm,
        data: model.toJson(),
        headers: {'Authorization': 'Bearer $token'},
      );
      log('API bookAppointment response:');
      log(response.toString());
      emit(ConfarmSuccess());
    } catch (e) {
      if (e is ServerException) {
        emit(ConfarmError(e.errormodel.message ?? "حدث خطأ غير متوقع"));
      } else {
        emit(ConfarmError(e.toString()));
      }
    }
  }
}
