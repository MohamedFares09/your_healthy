import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_health/features/onbording/widgets/button_onbording.dart';
import 'package:your_health/features/onbording/widgets/doc_logo_and_name.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});
  static String id = "onboringscreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          DocLogoAndName(),
          SizedBox(
            height: 30.h,
          ),
          Text(
            ".احجز، تابع، واطمئن… كل شيء في مكان واحد\n صحتك، التطبيق الذي يهتم بك وبمن تحب",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 230.h,
          ),
         ButtonOnbording()
        ],
      )),
    );
  }
}
