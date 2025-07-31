import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:your_health/core/api/api_consumer.dart';
import 'package:your_health/core/api/end_points.dart';

import 'package:your_health/core/model/login_model.dart';
import 'package:your_health/features/cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(InitState());
  final ApiConsumer api;
  LoginModel? user;

  // تسجيل الدخول
  login() async {
    try {
      emit(LodingLogin());
      if (emilLogin.text.isEmpty || passwordLogin.text.isEmpty) {
        emit(FailuerLogin(errorMessage: 'يرجى إدخال جميع البيانات'));
        return;
      }
      final response = await api.post(EndPoints.login, data: {
        'username': emilLogin.text.trim(), // إزالة المسافات الزائدة
        'password': passwordLogin.text
      });
      // حفظ التوكن بعد تسجيل الدخول
      final loginModel = LoginModel.fromJson(response);
      user = loginModel;
      if (loginModel.token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', loginModel.token!);
      }
      emit(SuccessLogin());
      _clearLoginFields();
    } catch (e) {
      emit(FailuerLogin(errorMessage: "الايميل او كلمه المرور غير صحيحه"));
    }
  }

  // التسجيل
  register() async {
    try {
      emit(LodingSignUp());

      if (nameSignUp.text.isEmpty ||
          emilSignUp.text.isEmpty ||
          passwordSignUp.text.isEmpty ||
          confirmPassword.text.isEmpty) {
        emit(FailuerSignUp(errorMessage: 'يرجى إدخال جميع البيانات'));
        return;
      }

      // التحقق من تطابق كلمة المرور
      if (passwordSignUp.text != confirmPassword.text) {
        emit(FailuerSignUp(errorMessage: 'كلمة المرور غير متطابقة'));
        return;
      }

      final response = await api.post(EndPoints.signUp, data: {
        'username': nameSignUp.text.trim(),
        'email': emilSignUp.text.trim(),
        'password': passwordSignUp.text,
      });
      log('Register response: $response');

      // تحقق من الاستجابة
      if (response == null) {
        emit(FailuerSignUp(errorMessage: 'لم يتم استقبال رد من السيرفر'));
        return;
      }
      // إذا كان السيرفر يرجع مفتاح success أو error أو رسالة نصية
      if (response is Map) {
        if (response.containsKey('success') && response['success'] == true) {
          emit(SuccessSignUp());
          _clearSignUpFields();
          return;
        } else if (response.containsKey('error')) {
          emit(FailuerSignUp(errorMessage: response['error'].toString()));
          return;
        } else if (response.containsKey('message')) {
          // إذا كان هناك رسالة خطأ
          emit(FailuerSignUp(errorMessage: response['message'].toString()));
          return;
        }
      }
      // إذا لم يكن هناك مؤشر واضح للنجاح
      emit(FailuerSignUp(
          errorMessage: 'فشل التسجيل، تحقق من البيانات أو حاول لاحقًا'));
    } catch (e, stack) {
      log('Register error: $e');
      log('Stack: $stack');
      emit(FailuerSignUp(errorMessage: 'حدث خطأ غير متوقع'));
    }
  }

  // مسح حقول التسجيل
  void _clearSignUpFields() {
    nameSignUp.clear();
    emilSignUp.clear();
    passwordSignUp.clear();
    confirmPassword.clear();
  }

  // مسح جميع الحقول
  void _clearLoginFields() {
    emilLogin.clear();
    passwordLogin.clear();
    _clearSignUpFields();
  }

  // Controllers
  GlobalKey globalKeyLogin = GlobalKey();
  TextEditingController emilLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  GlobalKey globalKeySignUp = GlobalKey();
  TextEditingController nameSignUp = TextEditingController();
  TextEditingController emilSignUp = TextEditingController();
  TextEditingController passwordSignUp = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  // @override
  // Future<void> close() {
  //   // تنظيف الـ controllers عند إغلاق الـ Cubit
  //   emilLogin.dispose();
  //   passwordLogin.dispose();
  //   nameSignUp.dispose();
  //   emilSignUp.dispose();
  //   passwordSignUp.dispose();
  //   confirmPassword.dispose();
  //   return super.close();
  // }
}
