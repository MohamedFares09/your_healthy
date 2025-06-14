import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart'; // إضافة SharedPreferences
import 'package:your_health/core/api/api_consumer.dart';
import 'package:your_health/core/api/end_points.dart';
import 'package:your_health/core/error/exceptions.dart';
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
      final response = await api.post(
        EndPoints.login,
        data: {
          'username': emilLogin.text.trim(), // إزالة المسافات الزائدة
          'password': passwordLogin.text
        }
      );

      user = LoginModel.fromJson(response);
      
      // حفظ الـ token في SharedPreferences
      if (user?.token != null) {
        await _saveToken(user!.token!);
        await _saveUserData(user!);
      }

      emit(SuccessLogin());
      
    } on ServerException catch (e) {
      emit(FailuerLogin(errorMessage: e.errormodel.message ?? 'حدث خطأ في تسجيل الدخول'));
    } catch (e) {
      emit(FailuerLogin(errorMessage: 'حدث خطأ غير متوقع'));
      log('Login error: $e');
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

      final response = await api.post(
        EndPoints.signUp,
        isFormData: true,
        data: {
          'name': nameSignUp.text.trim(),
          'email': emilSignUp.text.trim(),
          'password': passwordSignUp.text,
          'password_confirmation': confirmPassword.text
        }
      );

      log('Sign up response: $response');
      
      // التحقق من نجاح التسجيل
      if (response != null) {
        // إذا كان الـ API يرجع token مباشرة بعد التسجيل
        if (response.containsKey('token')) {
          user = LoginModel.fromJson(response);
          if (user?.token != null) {
            await _saveToken(user!.token!);
            await _saveUserData(user!);
          }
        }
        
        emit(SuccessSignUp(),);

        _clearSignUpFields();
      } else {
        emit(FailuerSignUp(errorMessage: 'فشل في التسجيل'));
      }
      
    } on ServerException catch (e) {
      emit(FailuerSignUp(errorMessage: e.errormodel.message ?? 'حدث خطأ في التسجيل'));
    } catch (e) {
      emit(FailuerSignUp(errorMessage: 'حدث خطأ غير متوقع'));
      log('Register error: $e');
    }
  }



  // حفظ الـ token
  Future<void> _saveToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_token', token);
    } catch (e) {
      log('Error saving token: $e');
    }
  }

  // حفظ بيانات المستخدم
  Future<void> _saveUserData(LoginModel user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (user.user_email != null) {
        await prefs.setString('user_email', user.user_email!);
      }
      if (user.user_nicename != null) {
        await prefs.setString('user_name', user.user_nicename!);
      }
      if (user.user_display_name != null) {
        await prefs.setString('user_display_name', user.user_display_name!);
      }
    } catch (e) {
      log('Error saving user data: $e');
    }
  }

  // جلب الـ token المحفوظ
  Future<String?> getSavedToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('user_token');
    } catch (e) {
      log('Error getting saved token: $e');
      return null;
    }
  }

  // تسجيل الخروج
  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear(); 
      user = null;
      _clearAllFields();
    } catch (e) {
      log('Error during logout: $e');
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
  void _clearAllFields() {
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

  @override
  Future<void> close() {
    // تنظيف الـ controllers عند إغلاق الـ Cubit
    emilLogin.dispose();
    passwordLogin.dispose();
    nameSignUp.dispose();
    emilSignUp.dispose();
    passwordSignUp.dispose();
    confirmPassword.dispose();
    return super.close();
  }
}