import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_health/core/api/dio_consumer.dart';
import 'package:your_health/core/model/doctor_model.dart';
import 'package:your_health/features/Home/view/doctor_booking_card_widget.dart';
import 'package:your_health/features/Home/view_model/services_cubit.dart';
import 'package:your_health/features/Home/view_model/services_state.dart';

class DoctorBookingScreen extends StatelessWidget {
  const DoctorBookingScreen({
    super.key,
    required this.id,
    required this.doctorModel,
  });

  final int id;
  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تفاصيل الدكتور")),
      body: BlocProvider(
        create: (context) =>
            ServicesCubit(DioConsumer(dio: Dio()))..getDoctorServices(id),
        child: BlocBuilder<ServicesCubit, ServicesState>(
          builder: (context, state) {
            if (state is LoadingServicesState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FailuerServicesState) {
              return const Center(child: Text("حدث خطأ أثناء تحميل الخدمات"));
            } else if (state is SuccessServicesState) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  children: [
                    // كارت معلومات الدكتور
                    DoctorBookingCardWidget(
                      doctorModel: doctorModel,
                      id: id, servicelist: state.listServices,
                     
                    ),

                     SizedBox(height: 16.h),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink(); // fallback
            }
          },
        ),
      ),
    );
  }
}
