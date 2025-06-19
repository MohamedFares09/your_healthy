import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/api_consumer.dart';
import 'package:your_health/core/model/avalible_time_model.dart';
import 'package:your_health/features/cubit/avalible_time_state.dart';

class AvalibleTimeCubit extends Cubit<AvalibleTimeState> {
  AvalibleTimeCubit(this.api) : super(AvalibleTimeInitState());
  ApiConsumer api;

  static AvalibleTimeCubit get(context) => BlocProvider.of(context);

  Future<void> getAvalibleTime({
    required int doctorId,
    required int serviceId,
    required String date,
  }) async {
    emit(AvalibleTimeLoadingState());
    try {
      final response = await api.get(
        "custom/v1/doctor-day-slots?doctor_id=$doctorId&service_id=$serviceId&date=$date",
      );

      final List<AvalibleTimeModel> timeList = (response['available_slots'] as List)
          .map((e) => AvalibleTimeModel.fromJson(e))
          .toList();

      emit(AvalibleTimeSuccessState(listTime: timeList));
    } catch (e) {
      emit(AvalibleTimeFailuerState(errMessage: e.toString()));
    }
  }
}
