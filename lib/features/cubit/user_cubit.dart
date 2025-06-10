import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_health/features/cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(InitState());

  void login(String username, String password) async {
    emit(LodingLogin());
   await Future.delayed(Duration(seconds: 1));
    if (username == "admin" && password == "123456") {
      emit(SuccessLogin());
    } else {
      emit(FailuerLogin("Invaild Username and password"));
    }
  }

  GlobalKey globalKeyLogin = GlobalKey();
  GlobalKey globalKeySignUp = GlobalKey();
  TextEditingController emilLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
}
