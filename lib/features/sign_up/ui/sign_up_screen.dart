import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_health/core/theming/color.dart';
import 'package:your_health/core/widgets/app_text_form_field.dart';
import 'package:your_health/core/widgets/custom_button.dart';

import 'package:your_health/features/login/ui/login_screen.dart';
import 'package:your_health/features/profile/view_model/user_cubit.dart';
import 'package:your_health/features/profile/view_model/user_state.dart';
import 'package:your_health/features/sign_up/widget/texr_details_signup_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String id = "signupscreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscureText = true;
  bool isObscureTextConfirm = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // إضافة Form Key

  @override
  Widget build(BuildContext context) {
    UserCubit userCubit = context.read<UserCubit>(); 
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.w),
          child: SingleChildScrollView(
            child: Form( // إضافة Form Widget
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Center(
                    child: Text(
                      "إنشاء حساب جديد",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManegaer.kprimarycolor,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TexrDetailsSignupScreen(),
                  SizedBox(height: 30.h),
                  
                  // ربط الـ controllers مع الـ TextFields
                  AppTextFormField(
                    controller: userCubit.nameSignUp, // إضافة controller
                    hintText: "اسم المستخدم",
                    icon: Icon(Icons.person_outline),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال اسم المستخدم';
                      }
                      return null;
                    },
                  ),
                  
                  AppTextFormField(
                    controller: userCubit.emilSignUp, // إضافة controller
                    hintText: "البريد الالكتروني",
                    icon: Icon(Icons.email_outlined),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال البريد الإلكتروني';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'يرجى إدخال بريد إلكتروني صحيح';
                      }
                      return null;
                    },
                  ),
                  
                  AppTextFormField(
                    controller: userCubit.passwordSignUp, // إضافة controller
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال كلمة المرور';
                      }
                      if (value.length < 8) {
                        return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
                      }
                      return null;
                    },
                  ),
                  
                  AppTextFormField(
                    controller: userCubit.confirmPassword, // إضافة controller
                    hintText: "تأكيد كلمة المرور",
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى تأكيد كلمة المرور';
                      }
                      if (value != userCubit.passwordSignUp.text) {
                        return 'كلمة المرور غير متطابقة';
                      }
                      return null;
                    },
                  ),
                  
                  SizedBox(height: 30.h),
                  
                  BlocConsumer<UserCubit, UserState>(
                    listener: (context, state) {
                      if (state is SuccessSignUp) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("تم التسجيل بنجاح"),
                            backgroundColor: Colors.green,
                          )
                        );
                        // الانتقال لصفحة تسجيل الدخول بعد التسجيل الناجح
                        Navigator.pushReplacementNamed(context, LoginScreen.id);
                      } else if (state is FailuerSignUp) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage),
                            backgroundColor: Colors.red,
                          )
                        );
                      }
                    },
                    builder: (context, state) {
                      return state is LodingSignUp
                          ? CircularProgressIndicator()
                          : CustomButton(
                              onPressed: () {
                                // التحقق من صحة البيانات قبل الإرسال
                                if (_formKey.currentState!.validate()) {
                                  context.read<UserCubit>().register();
                                }
                              },
                              namebutton: "إنشاء حساب",
                            );
                    },
                  ),
                  
                  SizedBox(height: 20.h),
                  
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
      ),
    );
  }
}