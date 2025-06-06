import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        SvgPicture.asset(
          'assets/images/svg/logo.svg',
          height: 70.h,
          width: 70.w,
        ),
        SizedBox(
          height: 25.h,
        ),
        Text(
          "صحتك",
          style: TextStyle(
              color: Colors.blue[900],
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'CourierPrime'),
        )
      ],
    ));
  }
}
