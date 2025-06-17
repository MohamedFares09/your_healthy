import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/api_consumer.dart';

import 'package:your_health/core/model/doctor_model.dart';
import 'package:your_health/features/cubit/doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit(this.api) : super(InitDoctor());

  ApiConsumer api;

  Future<void> getDoctor({int? specializationId}) async {
    emit(LoadingDoctor());

    try {
      final response = await api.get(
        'https://dev-booking-system-website.pantheonsite.io/wp-json/wp/v2/doctor',
        quereParameters: {
          '_embed': '',
          if (specializationId != null) 'specialization': specializationId,
        },
      );

      final List doctorList = response;
      emit(SuccessDoctor(
        doctorList: doctorList.map((e) => DoctorModel.fromJson(e)).toList(),
      ));
    } catch (e, stackTrace) {
      log('Error loading doctors: $e', stackTrace: stackTrace);
      emit(FailureDoctor(errMessage: 'فشل تحميل الأطباء'));
    }
  }
}
