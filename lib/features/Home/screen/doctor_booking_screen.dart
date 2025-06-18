import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/dio_consumer.dart';
import 'package:your_health/core/model/doctor_model.dart';
import 'package:your_health/features/Home/widgets/doctor_booking_card_widget.dart';
import 'package:your_health/features/cubit/services_cubit.dart';
import 'package:your_health/features/cubit/services_state.dart';


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
                    DoctorBookingCardWidget(doctorModel: doctorModel,id: id,),

                    const SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "الخدمات المتوفرة:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...state.listServices.map((service) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Text(
                                      service.name,
                                      style: const TextStyle(fontSize: 14),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  const Icon(Icons.medical_services,
                                      color: Colors.blue, size: 18),
                                ],
                              ),
                            );
                          }).toList()
                        ],
                      ),
                    ),
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
