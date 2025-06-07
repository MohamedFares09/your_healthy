import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_health/core/theming/color.dart';

class ButtonOnbording extends StatelessWidget {
  const ButtonOnbording({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManegaer.kprimarycolor,
        foregroundColor: Colors.white,
        minimumSize: Size(200.w, 50.h),
      ),
      child: Text(
        "ابدأ الآن",
        style: TextStyle(fontSize: 18.sp),
      ),
    );
  }
}
