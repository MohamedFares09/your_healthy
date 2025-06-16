import 'package:flutter/material.dart';
import 'package:your_health/core/model/categoet_model.dart';
import 'package:your_health/core/theming/color.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({super.key, required this.categoetModel});

  final CategoetModel categoetModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        width: 370,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: ColorManegaer.kprimarycolor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // النص
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                categoetModel.name,
                style: TextStyle(
                  color: ColorManegaer.kprimarycolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),

            // مسافة بسيطة بين النص والصورة
            SizedBox(width: 16),

            // الصورة
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                categoetModel.image,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),

            // مسافة يمين
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
