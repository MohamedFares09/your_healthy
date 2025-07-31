import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/api_consumer.dart';
import 'package:your_health/core/api/end_points.dart';
import 'package:your_health/core/model/doctor_model.dart';
import 'package:your_health/features/Home/view_model/doctor_state.dart';


class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit(this.api) : super(InitDoctor());

  ApiConsumer api;

  Future<void> getDoctor({int? specializationId}) async {
    emit(LoadingDoctor());

    try {
      final response = await api.get(
        EndPoints.doctor,
        
        quereParameters: {
          
          if (specializationId != null) 'specialization': specializationId,
        },
      );

      final List doctorList = response;
      List<DoctorModel> listDoctor =
      doctorList.map((e) => DoctorModel.fromJson(e)).toList();
      emit(SuccessDoctor(doctorList: listDoctor));
    } catch (e, stackTrace) {
      log('Error loading doctors: $e', stackTrace: stackTrace);
      emit(FailureDoctor(errMessage: 'فشل تحميل الأطباء'));
    }
  }
}
