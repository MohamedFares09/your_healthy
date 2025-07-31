import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_health/core/theming/color.dart';
import 'package:your_health/features/profile/view_model/profile_cubit.dart';
import 'package:your_health/features/profile/view/signout_button_widget.dart';
import 'package:your_health/features/profile/view/text_data_profile.dart';
import 'package:your_health/features/profile/view_model/profile_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // استدعاء getProfile عند أول بناء للصفحة
    Future.delayed(Duration.zero, () {
      BlocProvider.of<ProfileCubit>(context).getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
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

                      /// بيانات الحجوزات
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
                                  "تفاصيل الحجوزات",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              if (profile.appointments.isEmpty)
                                Text(
                                  "لا يوجد حجوزات",
                                  style: TextStyle(color: Colors.white),
                                )
                              else
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: profile.appointments.length,
                                  itemBuilder: (context, index) {
                                    final appointment =
                                        profile.appointments[index];
                                    return Card(
                                      color: Colors.white10,
                                      margin: EdgeInsets.symmetric(vertical: 8),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextDataProfile(
                                                title: "رقم الحجز",
                                                value: appointment.id),
                                            TextDataProfile(
                                                title: "التاريخ",
                                                value: appointment.date),
                                            TextDataProfile(
                                                title: "الوقت",
                                                value: appointment.time),
                                            TextDataProfile(
                                                title: "الدكتور",
                                                value: appointment.doctor),
                                            TextDataProfile(
                                                title: "الخدمة",
                                                value: appointment.service),
                                            TextDataProfile(
                                                title: "الحالة",
                                                value: appointment.status),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
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
      );
  }
}

