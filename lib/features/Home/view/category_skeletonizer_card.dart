import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySkeletonCard extends StatelessWidget {
  const CategorySkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70.h,
        width: 370.w,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // النص الوهمي
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: 100.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),

            const SizedBox(width: 16),

            // صورة وهمية
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),

             SizedBox(width: 16.w),
          ],
        ),
      ),
    );
  }
}
