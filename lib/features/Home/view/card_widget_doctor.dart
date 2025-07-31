import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_health/core/model/doctor_model.dart';
import 'package:your_health/core/theming/color.dart';
import 'package:your_health/features/Home/view/screens/doctor_booking_screen.dart';

class CardWidgetDoctor extends StatelessWidget {
  const CardWidgetDoctor({super.key, required this.doctorModel});
  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // صورة الطبيب
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: doctorModel.imageDocor != null &&
                          doctorModel.imageDocor!.isNotEmpty
                      ? Image.network(
                          doctorModel.imageDocor!,
                          width: 60.w,
                          height: 60.h,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: 60.w,
                          height: 60.h,
                          color: Colors.grey[300],
                          child: const Icon(Icons.person, color: Colors.white),
                        ),
                ),
                 SizedBox(width: 12.w),
                // اسم الطبيب
                Expanded(
                  child: Text(
                    "دكتور ${doctorModel.nameDoctor}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                    textAlign: TextAlign.right,
                    softWrap: true,
                  ),
                ),
              ],
            ),

             SizedBox(height: 12.h),

            // التخصص الأول
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    doctorModel.specialtyDoctor,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.right,
                    softWrap: true,
                  ),
                ),
                 SizedBox(width: 8.w),
                Text(
                  ": التخصص",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),

             SizedBox(height: 12.h),

            // التخصص الثاني
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    doctorModel.specializationDoctor,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.right,
                    softWrap: true,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "التخصص:",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.medical_services, size: 16, color: Colors.blue[600]),
              ],
            ),

             SizedBox(height: 12.h),

            // العنوان
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    doctorModel.addressDoctor,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.right,
                    softWrap: true,
                  ),
                ),
                 SizedBox(width: 8.w),
                Icon(Icons.location_on, size: 16, color: Colors.blue[600]),
              ],
            ),

             SizedBox(height: 12.h),

            // سعر الكشف
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "جنيه",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  " ${doctorModel.priceDoctor}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "سعر الكشف:",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.attach_money, size: 16, color: Colors.blue[600]),
              ],
            ),

             SizedBox(height: 12.h),

            // التخصص مرة أخرى
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    doctorModel.specializationDoctor,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.right,
                    softWrap: true,
                  ),
                ),
                 SizedBox(width: 8.w),
                Icon(Icons.local_hospital, size: 16, color: Colors.blue[600]),
              ],
            ),

             SizedBox(height: 20.h),

            // زر الحجز
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DoctorBookingScreen(
                      id: doctorModel.id,
                      doctorModel: doctorModel,
                    );
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManegaer.kprimarycolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Icon(Icons.calendar_today, color: Colors.white, size: 18.sp),
                    SizedBox(width: 8),
                    Text(
                      "احجز استشارته",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
