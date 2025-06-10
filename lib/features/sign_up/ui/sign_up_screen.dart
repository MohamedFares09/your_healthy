import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_health/core/widgets/app_text_form_field.dart';
import 'package:your_health/core/widgets/custom_button.dart';
import 'package:your_health/features/login/ui/login_screen.dart';
import 'package:your_health/features/sign_up/widget/texr_details_signup_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String id = "signupscreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  bool isObscureText = true;
  bool isObscureTextConfirm = true;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Center(
                  child: Text(
                    "إنشاء حساب جديد",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TexrDetailsSignupScreen(),
                SizedBox(height: 30.h),
                AppTextFormField(
                  hintText: "اسم المستخدم",
                  icon: Icon(Icons.person_outline),
                ),
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
                AppTextFormField(
                  hintText: " تأكيد كلمة المرور",
                  icon: Icon(Icons.lock_outline),
                  prefixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscureTextConfirm = !isObscureTextConfirm;
                      });
                    },
                    child: Icon(
                      isObscureTextConfirm
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                  isObscureText: isObscureTextConfirm,
                ),
                CustomButton(
                  onPressed: (){},
                  namebutton: "إنشاء حساب",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, LoginScreen.id);
                      },
                      child: Text(
                        "تسجيل الدخول ",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "لديك حساب بالفعل؟",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
