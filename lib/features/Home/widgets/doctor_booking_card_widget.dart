import 'package:flutter/material.dart';
import 'package:your_health/core/model/doctor_model.dart';

class DoctorBookingCardWidget extends StatelessWidget {
  const DoctorBookingCardWidget({
    super.key,
    required this.doctorModel,
    required this.id
  });
  final int id;
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
            // بيانات الطبيب (الاسم + الصورة)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: doctorModel.imageDocor != null &&
                          doctorModel.imageDocor!.isNotEmpty
                      ? Image.network(
                          doctorModel.imageDocor!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: 60,
                          height: 60,
                          color: Colors.grey[300],
                          child: const Icon(Icons.person, color: Colors.white),
                        ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "دكتور ${doctorModel.nameDoctor}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // التخصص الأساسي
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    doctorModel.specialtyDoctor,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(": التخصص", style: TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 8),

            // التخصص الفرعي
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    doctorModel.specializationDoctor,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.medical_services, size: 16),
              ],
            ),
            const SizedBox(height: 8),

            // العنوان
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    doctorModel.addressDoctor,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                const Icon(Icons.location_on, size: 16),
              ],
            ),
            const SizedBox(height: 8),

            // السعر
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("جنيه",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(" ${doctorModel.priceDoctor}",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                const Text("سعر الكشف:"),
                const SizedBox(width: 4),
                const Icon(Icons.attach_money, size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
