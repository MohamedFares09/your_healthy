import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_health/core/model/doctor_model.dart';
import 'package:your_health/core/model/services_model.dart';
import 'package:your_health/core/widgets/custom_dailog_widget.dart';
import 'package:your_health/features/Home/view/date_packer_helper.dart';
import 'package:your_health/features/Home/view/screens/avalible_time_screen.dart';

class DoctorBookingCardWidget extends StatefulWidget {
  const DoctorBookingCardWidget({
    super.key,
    required this.doctorModel,
    required this.id,
    required this.servicelist,
  });

  final int id;
  final DoctorModel doctorModel;
  final List<ServicesModel> servicelist;

  @override
  State<DoctorBookingCardWidget> createState() =>
      _DoctorBookingCardWidgetState();
}

class _DoctorBookingCardWidgetState extends State<DoctorBookingCardWidget> {
  ServicesModel? selectedService;

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
            // بيانات الطبيب (الاسم + الصورة)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: widget.doctorModel.imageDocor != null &&
                          widget.doctorModel.imageDocor!.isNotEmpty
                      ? Image.network(
                          widget.doctorModel.imageDocor!,
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
                Expanded(
                  child: Text(
                    "دكتور ${widget.doctorModel.nameDoctor}",
                    style:  TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
             SizedBox(height: 12.h),

            // التخصص الأساسي
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    widget.doctorModel.specialtyDoctor,
                    textAlign: TextAlign.right,
                    style:  TextStyle(fontSize: 14.sp),
                  ),
                ),
                 SizedBox(width: 8.w),
                 Text(": التخصص", style: TextStyle(fontSize: 14.sp)),
              ],
            ),
             SizedBox(height: 8.h),

            // التخصص الفرعي
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    widget.doctorModel.specializationDoctor,
                    textAlign: TextAlign.right,
                    style:  TextStyle(fontSize: 14.sp),
                  ),
                ),
                 SizedBox(width: 8.w),
                 Icon(Icons.medical_services, size: 16.sp),
              ],
            ),
             SizedBox(height: 8.h),

            // العنوان
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    widget.doctorModel.addressDoctor,
                    textAlign: TextAlign.right,
                    style:  TextStyle(fontSize: 14.sp),
                  ),
                ),
                 Icon(Icons.location_on, size: 16.sp),
              ],
            ),
             SizedBox(height: 8.h),

            // السعر
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("جنيه",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(" ${widget.doctorModel.priceDoctor}",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                const Text("سعر الكشف:"),
                const SizedBox(width: 4),
                const Icon(Icons.attach_money, size: 16),
              ],
            ),

             SizedBox(height: 12.h),

            // الخدمات (Radio buttons لاختيار خدمة واحدة فقط)
            const Text("اختر خدمة:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: widget.servicelist.map((service) {
                return RadioListTile<ServicesModel>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Text(
                    service.name,
                    textAlign: TextAlign.right,
                  ),
                  value: service,
                  groupValue: selectedService,
                  onChanged: (value) {
                    setState(() {
                      selectedService = value;
                    });
                  },
                );
              }).toList(),
            ),

             SizedBox(height: 12.h),

            // زر الاستمرار
ElevatedButton(
  onPressed: selectedService == null
      ? () {
          CustomDialogWidget.show(
            context: context,
            message: "يجب اختيار الخدمه اولا",
          );
        }
      : () async {
          await DatePickerHelper.pickDate(
            context: context,
            onDateSelected: (DateTime selectedDate) {
              // صيغة التاريخ المطلوبة yyyy-MM-dd
              final String formattedDate =
                  "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";

              // بعد اختيار التاريخ ننتقل لصفحة عرض المواعيد
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AvailableTimesScreen(
                    date: formattedDate,
                    doctorId: widget.id, // أو widget.doctorModel.doctorId إذا عندك الحقل في الموديل
                    serviceId: selectedService!.serviceId,
                  ),
                ),
              );
            },
          );
        },
  child: const Text("استمرار"),
),

          ],
        ),
      ),
    );
  }
}
