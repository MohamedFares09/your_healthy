import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_health/core/theming/color.dart';
import 'package:your_health/features/login/ui/login_screen.dart';

class ButtonOnbording extends StatelessWidget {
  const ButtonOnbording({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, LoginScreen.id);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManegaer.kprimarycolor,
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity.w, 50.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Text(
          "ابدأ الآن",
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
    );
  }
}
