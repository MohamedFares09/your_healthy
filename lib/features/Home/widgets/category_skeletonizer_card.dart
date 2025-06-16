import 'package:flutter/material.dart';

class CategorySkeletonCard extends StatelessWidget {
  const CategorySkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        width: 370,
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
                width: 100,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),

            const SizedBox(width: 16),

            // صورة وهمية
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
