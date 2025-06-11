import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/api_consumer.dart';
import 'package:your_health/core/api/end_points.dart';
import 'package:your_health/core/error/exceptions.dart';
import 'package:your_health/core/model/login_model.dart';

import 'package:your_health/features/cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(InitState());
  final ApiConsumer api;
  LoginModel? user;
  login() async {
    try {
      emit(LodingLogin());
      final response = await api.post(EndPoints.login , data: {'username': emilLogin.text, 'password': passwordLogin.text});
      user = LoginModel.fromJson(response);
      
      // final decodedToken =   JwtDecoder.decode(user!.token);
      // emit(SuccessLogin());
    } on ServerException catch (e) {
      emit(FailuerLogin(errorMessage: e.errormodel.message ?? 'Unknown error'));
    }
  }

  GlobalKey globalKeyLogin = GlobalKey();
  GlobalKey globalKeySignUp = GlobalKey();
  TextEditingController emilLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
}
