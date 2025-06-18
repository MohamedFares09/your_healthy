import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/api_consumer.dart';
import 'package:your_health/core/api/end_points.dart';
import 'package:your_health/core/model/services_model.dart';
import 'package:your_health/features/cubit/services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit(this.api) : super(InitServicesState());
  ApiConsumer api;
  Future<void> getDoctorServices(int doctorId) async {
    emit(LoadingServicesState());
    try {
      final response = await api.get(EndPoints.services(doctorId));
      
      final List list = response as List;
      final services = list.map((e) => ServicesModel.fromJson(e)).toList();
      emit(SuccessServicesState(services));
    } catch (e) {
      emit(FailuerServicesState('فشل تحميل الخدمات'));
    }
  }
}
