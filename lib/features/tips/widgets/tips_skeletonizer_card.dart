import 'package:flutter/material.dart';

class TipsSkeletonCard extends StatelessWidget {
  const TipsSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // العنوان الرئيسي (الصورة أو المحتوى الرئيسي)
          Container(
            width: double.infinity,
            height: 230,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(bottom: 8),
          ),

          // اسم الكاتب والتاريخ
          Row(
            children: [
              // اسم الكاتب
              Container(
                width: 120,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),

              const Spacer(),

              // التاريخ
              Container(
                width: 80,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // الخط الفاصل
          Container(
            height: 1,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}