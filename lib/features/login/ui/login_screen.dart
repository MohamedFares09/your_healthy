import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_health/core/theming/color.dart';
import 'package:your_health/core/widgets/app_text_form_field.dart';
import 'package:your_health/core/widgets/custom_button.dart';
import 'package:your_health/features/sign_up/ui/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = "loginsreens";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30.w),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 30.h),
                  Center(
                    child: Text("تسجيل الدخول",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorManegaer.kprimarycolor)),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "مرحبًا بعودتك!\nأدخل بياناتك لتسجيل الدخول ومتابعة حجز مواعيدك الطبية بكل سهولة",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  AppTextFormField(
                    hintText: "البريد الالكتروني",
                    icon: Icon(Icons.email_outlined),
                  ),
                  AppTextFormField(
                    hintText: "كلمة المرور",
                    icon: Icon(Icons.lock_outline),
                    prefixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      child: Icon(
                        isObscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                    ),
                    isObscureText: isObscureText,
                  ),
                  SizedBox(height: 20.h),
                  Text("هل نسيبت كلمة المرور؟",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorManegaer.kprimarycolor,
                      )),
                  SizedBox(height: 20.h),
                  CustomButton(
                    namebutton: "تسجيل الدخول",
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, SignUpScreen.id);
                        },
                        child: Text(
                          "انشاء حساب جديد",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorManegaer.kprimarycolor,
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "ليس لديك حساب؟",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
