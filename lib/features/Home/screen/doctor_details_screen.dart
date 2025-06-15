import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/dio_consumer.dart';
import 'package:your_health/features/Home/widgets/card_widget_doctor.dart';
import 'package:your_health/features/cubit/doctor_cubit.dart';
import 'package:your_health/features/cubit/doctor_state.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});
  static String id = "doctordetailsscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => DoctorCubit(DioConsumer(dio: Dio()))..getDoctor(),
        child: BlocBuilder<DoctorCubit, DoctorState>(
          builder: (context, state) {
            if (state is LoadingDoctor) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccessDoctor) {
              return ListView.builder(
                itemCount: state.doctorList.length,
                itemBuilder: (context, index) {
                  return CardWidgetDoctor(doctorModel: state.doctorList[index]);
                },
              );
            } else if (state is FailureDoctor) {
              return Center(child: Text(state.errMessage));
            } else {
              return const Center(child: Text('لا توجد بيانات متاحة.'));
            }
          },
        ),
      ),
    );
  }
}
