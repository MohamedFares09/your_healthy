import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_health/core/api/dio_consumer.dart';
import 'package:your_health/core/theming/color.dart';
import 'package:your_health/features/Home/view/avalible_time_widget.dart';
import 'package:your_health/features/Home/view_model/avalible_time_cubit.dart';
import 'package:your_health/features/Home/view_model/avalible_time_state.dart';

class AvailableTimesScreen extends StatelessWidget {
  final String date;
  final int doctorId;
  final String serviceId;

  const AvailableTimesScreen({
    super.key,
    required this.date,
    required this.doctorId,
    required this.serviceId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AvalibleTimeCubit(DioConsumer(dio: Dio()))
        ..getAvalibleTime(
          doctorId: doctorId,
          serviceId: int.parse(serviceId),
          date: date,
        ),
      child: Scaffold(
        appBar: AppBar(title: const Text("اختر الوقت")),
        body: BlocBuilder<AvalibleTimeCubit, AvalibleTimeState>(
          builder: (context, state) {
            if (state is AvalibleTimeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AvalibleTimeSuccessState) {
              return AvailableTimesWidget(
                listTime: state.listTime,
                doctorId: doctorId,
                serviceId: int.parse(serviceId),
                date: date,
              );
            } else if (state is AvalibleTimeFailuerState) {
              return Center(
                  child: Text(
                state.errMessage,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManegaer.kprimarycolor),
              ));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
