import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_health/core/model/categoet_model.dart';
import 'package:your_health/core/theming/color.dart';
import 'package:your_health/features/Home/screen/doctor_details_screen.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({super.key, required this.categoetModel ,  });

  final CategoetModel categoetModel;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DoctorDetailsScreen(
              specializationId: categoetModel.specializationId,
              specializationTitle: categoetModel.name,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70.h,
          width: 370.w,
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: ColorManegaer.kprimarycolor),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Text(
                  categoetModel.name,
                  style: TextStyle(
                    color: ColorManegaer.kprimarycolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  categoetModel.image,
                  height: 50.h,
                  width: 50.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16.w),
            ],
          ),
        ),
      ),
    );
  }
}
