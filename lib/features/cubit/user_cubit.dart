import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/api_consumer.dart';

import 'package:your_health/features/cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(InitState());
  final ApiConsumer api;
 

  GlobalKey globalKeyLogin = GlobalKey();
  GlobalKey globalKeySignUp = GlobalKey();
  TextEditingController emilLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
}
