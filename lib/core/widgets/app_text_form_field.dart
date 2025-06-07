import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_health/core/theming/color.dart';

class AppTextFormField extends StatelessWidget {
  AppTextFormField({super.key, required this.hintText, required this.icon , this.isObscureText , this.prefixIcon  });
  final String hintText;
  Widget icon;
  Widget ? prefixIcon;
  final bool ? isObscureText ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: TextFormField(
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,  
        decoration: InputDecoration(
          isDense : true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            hintTextDirection: TextDirection.rtl,
            hintText: hintText,
            hintStyle: TextStyle(),
            suffixIcon: icon,
            prefixIcon: prefixIcon, 
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 0.8,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(
                color: ColorManegaer.kprimarycolor,
                width: 1.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),
            
            ),
            obscureText: isObscureText ?? false
      ),
    );
  }
}
