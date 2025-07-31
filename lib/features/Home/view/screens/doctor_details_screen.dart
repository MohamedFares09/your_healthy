import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/dio_consumer.dart';
import 'package:your_health/features/Home/view/card_widget_doctor.dart';
import 'package:your_health/features/Home/view/doctor_skeletonizer_card_widget.dart';
import 'package:your_health/features/Home/view_model/doctor_cubit.dart';
import 'package:your_health/features/Home/view_model/doctor_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen(
      {super.key,
      required this.specializationId,
      required this.specializationTitle,  
     
      
    });

  final int specializationId;
  final String specializationTitle;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(specializationTitle),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => DoctorCubit(DioConsumer(dio: Dio()))
          ..getDoctor(specializationId: specializationId),
        child: BlocBuilder<DoctorCubit, DoctorState>(
          builder: (context, state) {
            if (state is LoadingDoctor) {
              return Skeletonizer(
                enabled: true,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const DoctorSkeletonCard();
                  },
                ),
              );
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
