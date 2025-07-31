import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TipsSkeletonCard extends StatelessWidget {
  const TipsSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(bottom: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // العنوان الرئيسي (الصورة أو المحتوى الرئيسي)
          Container(
            width: double.infinity,
            height: 230.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            margin:  EdgeInsets.only(bottom: 8.sp),
          ),

          // اسم الكاتب والتاريخ
          Row(
            children: [
              // اسم الكاتب
              Container(
                width: 120.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),

              const Spacer(),

              // التاريخ
              Container(
                width: 80.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),

           SizedBox(height: 16.h),

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