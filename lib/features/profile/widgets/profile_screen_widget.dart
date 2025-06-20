import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_health/core/api/dio_consumer.dart';
import 'package:dio/dio.dart';
import 'package:your_health/core/theming/color.dart';
import 'package:your_health/features/Home/screen/home_screen.dart';
import 'package:your_health/features/cubit/profile_cubit.dart';
import 'package:your_health/features/cubit/profile_state.dart';
import 'package:your_health/features/profile/widgets/signout_button_widget.dart';
import 'package:your_health/features/profile/widgets/text_data_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(DioConsumer(dio: Dio()))..getProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded) {
            final profile = state.profile;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// بيانات المستخدم
                      Card(
                        color: ColorManegaer.kprimarycolor,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "البيانات الشخصية",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              TextDataProfile(
                                  title: "الاسم", value: profile.name),
                              SizedBox(height: 8.h),
                              TextDataProfile(
                                  title: "البريد الإلكتروني",
                                  value: profile.email),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      /// بيانات الحجز
                      Card(
                        color: ColorManegaer.kprimarycolor,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "تفاصيل الحجز",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              TextDataProfile(
                                  title: "رقم الحجز", value: profile.id),
                              TextDataProfile(
                                  title: "التاريخ", value: profile.date),
                              TextDataProfile(
                                  title: "الوقت", value: profile.time),
                              TextDataProfile(
                                  title: "الدكتور", value: profile.doctor),
                              TextDataProfile(
                                  title: "الخدمة", value: profile.service),
                              TextDataProfile(
                                  title: "الحالة", value: profile.status),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SignoutButtonWidget()
                    ],
                  ),
                ),
              ),
            );
          } else if (state is ProfileError) {
            return const Center(child: Text('حدث خطأ أثناء تحميل البيانات'));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
