import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/api_consumer.dart';
import 'package:your_health/core/api/end_points.dart';
import 'package:your_health/core/model/confarm_model.dart';
import 'package:your_health/features/cubit/confarm_state.dart';
import 'package:your_health/core/error/exceptions.dart';

class ConfarmCubit extends Cubit<ConfarmState> {
  final ApiConsumer api;

  ConfarmCubit(this.api) : super(ConfarmInitial());

  Future<void> bookAppointment(ConfarmModel model) async {
    emit(ConfarmLoading());
    try {
      await api.post(EndPoints.confarm, data: model.toJson());
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
